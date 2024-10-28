% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina la
%              longitud de del camino interno de
%              del camino interno de un árbol multiway.
%              Se incluye una versión en python.
% ===============================================
% -------- Código en python ------------
%def longitud_camino_interno(termino, profundidad=0):
%    # Verificar si el término es una lista (nodo)
%    if not isinstance(termino, list):
%        return 0
%
%    # Sumar la profundidad actual (del nodo actual)
%    longitud = profundidad
%
%    # Iterar sobre los hijos del nodo (a partir del segundo elemento)
%    for hijo in termino[1:]:
%        longitud += longitud_camino_interno(hijo, profundidad + 1)
%    
%    return longitud
%
%# Ejemplo de uso
%arbol_multiway = [1, [2, [4], [5]], [3, [6, [7], [8]]]]
%print("La longitud del camino interno del árbol multiway es: ",longitud_camino_interno(arbol_multiway))
%
% -------- Código en Prolog --------------------
main :-
arbol_ejemplo(arbol_multiway(a, [
    arbol_multiway(b, []),
    arbol_multiway(c, [
        arbol_multiway(e, []),
        arbol_multiway(f, [])
    ]),
    arbol_multiway(d, [])
])),
    arbol_ejemplo(Arbol),
    longitud_camino_interno(Arbol, Longitud),
    write('Longitud del camino interno: '), write(Longitud), nl.

% Calcula la longitud del camino interno de un árbol multiway.
longitud_camino_interno(Arbol, Longitud) :-
    camino_interno(Arbol, 0, Longitud).

% Camino interno para cada nodo del árbol.
% Si es una hoja (sin subárboles), la profundidad es la actual.
camino_interno(arbol_multiway(_, []), Profundidad, Profundidad).

% Si tiene subárboles, calcula la longitud del camino interno para cada subárbol y suma las profundidades.
camino_interno(arbol_multiway(_, Subarboles), Profundidad, Longitud) :-
    Profundidad1 is Profundidad + 1,
    findall(SubLongitud, (member(Sub, Subarboles), camino_interno(Sub, Profundidad1, SubLongitud)), Longitudes),
    sum_list(Longitudes, Longitud).
%-------------------------------------
