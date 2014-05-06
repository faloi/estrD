data Persona = Persona Int String
type Alumno = Persona

instance Show Persona where
   show (Persona edad nombre) = "Hola, soy " ++ nombre ++ " y tengo " ++ show edad ++ " anios!"

cumplirAnios :: Persona -> Persona
cumplirAnios (Persona edad nombre) = Persona (edad + 1) nombre

cambiarNombre :: Persona -> String -> Persona
cambiarNombre (Persona edad nombre) nuevoNombre = Persona edad nuevoNombre