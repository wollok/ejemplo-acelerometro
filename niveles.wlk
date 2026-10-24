import wollok.mirror.*
import casillas.*

// Nivel 1: 20 filas de 40 casillas.
// v = piso, m = pared, h = hueco, s = meta

// se representa como lista de listas, donde cada lista representa una fila del nivel.
const nivelFacil = [
  [m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m],
  [m,v,v,v,v,h,v,v,v,v,m,v,v,v,v,v,m,v,v,v,v,h,v,v,v,v,m,v,v,v,v,v,v,m,v,v,v,v,v,m], //-
  [m,v,v,m,v,v,v,v,v,v,m,v,v,v,v,v,m,v,v,v,v,v,v,v,v,m,m,v,v,m,v,v,v,v,v,v,v,v,v,m], //-
  [m,v,v,m,v,v,v,h,v,v,v,v,v,h,v,v,v,v,v,m,m,m,m,v,v,v,v,v,v,m,h,v,v,v,v,h,v,v,v,m], //-
  [m,v,v,v,v,m,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,m,v,v,v,v,v,v,v,v,v,v,m,v,v,v,h,v,m], //-
  [m,m,v,v,v,m,v,v,v,h,v,m,v,v,v,v,m,v,v,v,h,v,m,v,v,m,v,v,v,v,v,v,m,m,v,v,v,v,v,m], //-
  [m,m,v,v,v,v,v,v,v,v,v,m,v,v,v,m,m,v,v,v,v,v,v,v,v,v,v,v,h,v,v,v,v,v,v,v,v,v,v,m], //-
  [m,v,v,v,v,v,v,m,m,v,v,m,h,v,v,v,v,v,h,v,v,v,v,h,v,v,v,v,v,v,v,v,v,v,m,m,v,v,m,m], //-
  [m,v,v,m,m,v,v,v,v,v,v,m,m,m,v,v,v,v,v,v,m,v,v,v,v,v,m,v,v,v,m,v,v,v,m,v,v,v,v,m], //-
  [m,v,v,v,v,v,v,h,v,v,v,v,v,v,v,v,m,v,v,v,m,v,v,v,v,m,m,v,v,m,m,v,v,v,m,m,v,v,v,m], //-
  [m,v,v,v,v,v,v,v,v,v,v,h,v,v,v,v,m,v,v,v,v,v,v,v,v,v,m,v,v,v,m,h,v,v,m,v,v,v,v,m], //-
  [m,m,v,h,v,v,v,v,v,v,v,v,v,v,h,v,m,v,v,v,v,v,m,m,v,v,m,v,v,v,v,v,v,v,v,v,v,v,v,m], //-
  [m,v,v,v,m,v,v,m,v,v,v,v,v,v,v,v,m,v,h,v,v,h,m,v,v,v,v,v,v,v,v,v,m,v,v,v,v,m,m,m], //-
  [m,s,s,v,m,v,v,m,v,h,v,v,m,v,v,v,v,v,v,v,v,v,m,v,v,v,v,v,v,h,v,v,m,v,v,v,v,v,v,m], //-
  [m,s,s,v,m,v,v,v,v,v,v,v,m,m,v,v,v,v,v,v,v,v,m,v,h,v,v,v,v,v,v,v,m,v,v,m,v,v,h,m], //-
  [m,v,v,v,m,v,v,v,v,v,v,v,v,m,v,v,m,v,v,m,v,v,v,v,v,v,m,v,v,v,v,v,v,v,m,m,v,v,v,m], //-
  [m,v,v,v,m,h,v,v,v,m,m,v,v,m,v,v,m,v,v,m,v,v,v,v,v,v,m,v,v,m,m,v,v,v,v,v,v,v,v,m], //-
  [m,v,v,m,m,v,v,v,v,v,m,v,v,v,v,v,v,v,v,m,v,v,m,v,v,v,m,v,v,v,m,v,v,v,v,v,m,m,m,m], //-
  [m,v,v,v,v,v,v,v,v,v,m,v,v,v,v,m,v,v,h,m,v,v,m,v,h,v,m,h,v,v,m,v,h,v,v,v,v,v,v,m], //-
  [m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m,m]
];

// Para sumar niveles, se podra agregár otra matriz a esta lista
const niveles = [nivelFacil]
