class Planilla p where
  planillaVacia         :: p
  agregar               :: p -> Actividad -> Proyecto -> Horas -> p
  proyectoDe            :: p -> Actividad -> Proyecto
  horasDe               :: p -> Actividad -> Horas
  actividadesDe         :: Set s => p -> Proyecto -> s Actividad
  totalProyecto         :: p -> Proyecto -> Horas
  proyectosConMasHoras  :: Set s => p -> s Proyecto

-- Ejercicio 2

agregarTodas :: Planilla -> Proyecto -> [(Actividad, Horas)] -> Planilla
agregarTodas p _ [] = p
agregarTodas p pr ((a, hs):as) = agregar (agregarTodas p pr as) a pr hs

armarPlanilla :: [Proyecto] -> Map Proyecto [(Actividad, Horas)] -> Planilla
armarPlanilla [] _ = planillaVacia
armarPlanilla (pr:prs) actividades = agregarTodas (armarPlanilla prs actividades) pr (fromJust (lookupM actividades pr))

proyectosConMasHorasEnMap :: Map Proyecto [(Actividad, Horas)] -> Set Proyecto
proyectosConMasHorasEnMap pr = proyectosConMasHoras (armarPlanilla (domainM pr) pr)

-- Ejercicio 3

data Planilla = MkPlanilla
                (Map Actividad (Proyecto, Horas))
                (Set Proyecto)

-- INV REP
-- Todo proyecto que esté en el Set debe existir en el Map
-- Los proyectos que están en el Set son los que tienen la maxima cantidad de hs registradas

instance Planilla Planilla where
   planillaVacia = MkPlanilla emptyMap emptySet
   agregar p@(MkPlanilla acts prs) act pr hs = MkPlanilla (agregarActividadAlMap acts act pr hs) (recalcularMaximos p prs pr hs)
   proyectoDe (MkPlanilla acts _) act = fst (componentesDe acts act)
   horasDe (MkPlanilla acts _) act = snd (componentesDe acts act)
   actividadesDe (MkPlanilla acts _) pr = actividades (porProyecto pr (domM acts) acts)
   totalProyecto (MkPlanilla acts _) pr = sumarHoras (porProyecto pr (domM acts) acts)
   proyectosConMasHoras (MkPlanilla _ prs) = prs

agregarActividadAlMap :: Map Actividad (Proyecto, Horas) -> Actividad -> Proyecto -> Horas
agregarActividadAlMap acts act pr hs =
  case (lookupM acts act) of
    Nothing -> addM acts act (pr, hs)
    Just (pr', hs') -> if pr == pr' then addM acts act (pr, hs + hs') else error "Esta actividad ya esta en otro proyecto"

porProyecto :: Proyecto -> [Actividad] -> Map Actividad (Proyecto, Horas) -> [(Actividad, Horas)]
porProyecto _ [] _ = []
porProyecto pr (a:as) acts =
  let comp = componentesDe a acts
  in if fst comp == pr then (a, snd comp) : porProyecto else porProyecto pr as acts

actividades :: Set s => [(Actividad, Horas)] -> s Actividad
actividades [] = emptySet
actividades [(act, _):as] = addSet (actividades as) act

sumarHoras :: [(Actividad, Horas)] -> Horas
sumarHoras [] = 0
sumarHoras ((_, h):as) = h + sumarHoras as

componentesDe :: Map Actividad (Proyecto, Horas) -> Actividad -> (Proyecto, Horas)
componentesDe acts act = fromJust (lookupM acts act)

recalcularMaximos :: Planilla -> Set Proyecto -> Proyecto -> Horas -> Set Proyecto
recalcularMaximos planilla proyectos proyecto horas =
  let total = totalProyecto planilla proyecto + horas, maxHoras = totalProyecto planilla (anyS proyectos)
  in if total > maxHoras
    then addS emptySet proyecto
    else if maxHoras == total then addS proyectos proyecto else proyectos

anyS :: Set s => s -> a
anyS x = head (set2list x)
