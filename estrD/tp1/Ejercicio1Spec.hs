module Ejercicio1Spec where

import Test.Hspec
import Ejercicio1
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
  describe "mapSucesor" $ do
    it "dada una lista de enteros, devuelve la lista de los sucesores de cada elemento" $
      mapSucesor [4, 5, 6] `shouldBe` [5, 6, 7]

  describe "filterPositivos" $ do
    it "dada una lista de enteros, devuelve una lista con los elementos que son positivos" $
      filterPositivos [-1, 2, 4, -5] `shouldBe` [2, 4]

  describe "esPrimo" $ do
    it "devuelve true cuando el numero solo es divisible por uno y por si mismo" $
      esPrimo 5 `shouldBe` True

    it "devuelve false cuando el numero tiene mas de 2 divisores" $
      esPrimo 4 `shouldBe` False

  describe "filterPrimos" $ do
    it "dada una lista de enteros, devuelve la lista de los que son primos." $
      filterPrimos [1, 2, 4, 5] `shouldBe` [1, 2, 5]

  describe "zipMaximos1" $ do
    it "dadas dos listas de la misma longitud, devuelve una lista donde el elemento n es el maximo entre el elemento n de la lista 1 y de la lista 2" $
      zipMaximos1 [1, 2, 3] [3, 1, 4] `shouldBe` [3, 2, 4]

  describe "zipMaximos2" $ do
    it "dadas dos listas de la MISMA longitud, devuelve una lista donde el elemento n es el maximo entre el elemento n de la lista 1 y de la lista 2" $
      zipMaximos2 [1, 2, 3] [3, 1, 4] `shouldBe` [3, 2, 4]

    it "dadas dos listas de DISTINTA longitud, devuelve una lista donde el elemento n es el maximo entre el elemento n de la lista 1 y de la lista 2" $
      zipMaximos2 [1, 2, 3, 4, 5] [3, 1, 4] `shouldBe` [3, 2, 4]

  describe "zipSort" $ do
    it "dadas dos listas de enteros de igual longitud, retorna una lista de pares cuyo primer elemento es el min y el otro el max de la misma posicion" $
      zipSort [2, 6, 8] [3, 4, 5] `shouldBe` [(2, 3), (4, 6), (5, 8)]

  describe "mapLongitudes" $ do
    it "dada una lista de listas, devuelve la lista de sus longitudes" $
      mapLongitudes [["2", "4"], ["hola", "chau", "adios"]] `shouldBe` [2, 3]

  describe "longitudMayorA" $ do
    it "dada una lista de listas y un numero n, devuelve la lista de aquellas que tienen mas de n elementos" $
      longitudMayorA [[1, 2, 3], [4, 5], [6, 7, 8, 9]] 3 `shouldBe` [[6, 7, 8, 9]]

  describe "mapCuadrados" $ do
    it "dada una lista de enteros positivos, devuelve la lista de los cuadrados de los elementos" $
      mapCuadrados [3, 2, 4] `shouldBe` [9, 4, 16]

    it "dada una lista de enteros positivos y negativos, devuelve la lista de los cuadrados de los elementos positivos" $
      mapCuadrados [3, -10, 2, -1, 4] `shouldBe` [9, 4, 16]      

  describe "sumaPar" $ do
    it "dada una lista de pares, devuelve una nueva lista en la que cada elemento es la suma de los elementos de cada par" $
      sumaPar [(2, 1), (3, 7), (4, 4)] `shouldBe` [3, 10, 8]

  describe "esMenor" $ do
    it "devuelve True si la primera fecha es menor a la segunda" $
      esMenor (Fecha 11 02 2014) (Fecha 12 02 2014) `shouldBe` True

  describe "takePersonas" $ do
    describe "dada una lista de personas ordenada por fecha" $ do
      it "y una fecha mayor al nacimiento de algunas de las personas, devuelve las personas que cumplen anios antes de la fecha dada" $
        takePersonas [Persona "Juan" "Cruz" (Fecha 30 10 1991), Persona "Pepe" "Lui" (Fecha 1 11 1991), Persona "JJ" "Lopez" (Fecha 3 12 1991)] (Fecha 31 10 1991) `shouldBe` [Persona "Juan" "Cruz" (Fecha 30 10 1991)]
      
      it "y una fecha menor al nacimiento de todas las personas, devuelve una lista vacia" $
        takePersonas [Persona "Juan" "Cruz" (Fecha 30 10 1991), Persona "Pepe" "Lui" (Fecha 1 11 1991)] (Fecha 20 10 1990) `shouldBe` []

  describe "dropPrecio" $ do
    it "dada una lista de Pizzas en orden ascendente por precio, devuelve aquellas con precio superior a $30" $
      dropPrecio [(Pizza ["queso", "tomate"] 25), (Pizza ["queso", "tomate", "jamon"] 31), (Pizza ["queso", "tomate", "jamon", "morron"] 40)] `shouldBe` [(Pizza ["queso", "tomate", "jamon"] 31), (Pizza ["queso", "tomate", "jamon", "morron"] 40)]

  describe "takeNombresPersonas" $ do
    it "dada una lista de Personas y una fecha devuelve los nombres de las personas que nacieron antes de dicha fecha" $
      takeNombresPersonas [Persona "Juan" "Cruz" (Fecha 30 10 1991), Persona "Pepe" "Lui" (Fecha 1 11 1991)] (Fecha 31 10 1991) `shouldBe` ["Juan"]

  describe "sumParesColor" $ do
    it "dadas dos listas de ParColor, devuelve una lista de Par-Color donde la cantidad de cada elemento es la suma del elemento de ese color en cada lista" $
      sumParesColor [(Rojo, 12), (Verde, 1)] [(Azul, 8), (Rojo, 3)] `shouldBe` [(Rojo, 15), (Verde, 1), (Azul, 8)]

  describe "reversa" $ do
    it "dada una lista de enteros, devuelve la lista con los mismos elementos de atras para adelante" $
      reversa [1, 2, 3] `shouldBe` [3, 2, 1]

  describe "aplanar" $ do
    it "dada una lista de listas, devuelve una unica lista con todos sus elementos" $
      aplanar [[1, 2], [3], [4, 5, 6, 7]] `shouldBe` [1, 2, 3, 4, 5, 6, 7]
