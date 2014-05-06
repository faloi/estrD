Tipos algebraicos
-----------------

Llamamos así a los tipos que tienen la particularidad de que pueden inferirse las **operaciones de acceso** a partir de los tipos de los **constructores**. Veamos por ejemplo el caso de las listas:

```haskell
-- Constructores
[] :: [a]
(:) :: a -> [a] -> [a]

-- Operaciones de acceso
null :: [a] -> Bool
head :: [a] -> a
tail :: [a] -> [a]
```

Tenemos entonces 3 funciones de acceso:
- `null`: que dada una lista, discrimina si fue construida con `[]` o con `(:)`
- `head`: que dada una lista construida con `(:)`, me devuelve la cabeza (un elemento de tipo _a_)
- `tail`: que dada una lista construida con `(:)`, me devuelve la una (cola lista de _a_)

Como se ve, `head` y `tail` son parciales en `[]`. Y eso por qué? Como `[]` no toma argumentos, entonces no tiene ningún sentido separarlo... y por eso es que no podemos hacerlo. En el caso de la lista construida con `(:)`, con solo mirar el tipo nos podemos dar cuenta de que va a tener 2 funciones de acceso: una para el **primer argumento** (la cabeza) y otra para **el segundo** (la cola).

