% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa que calcula la longitud 
%              interna de un árbol multiway.
%              Se incluye una versión en python.
% ===============================================
% -------- Código en python ------------
%def longitud_interna(termino, profundidad=0):
%    # Verificar si el término es una lista (nodo)
%    if not isinstance(termino, list) or len(termino) == 0:
%        return 0
%
%    # Sumar la profundidad actual (del nodo actual)
%    longitud = profundidad
%
%    # Iterar sobre los hijos del nodo (a partir del segundo elemento)
%    for hijo in termino[1:]:
%        longitud += longitud_interna(hijo, profundidad + 1)
%    
%    return longitud
%
%# Ejemplo de uso
%arbol_multiway = [1, [2, [4], [5]], [3, [6, [7], [8]]]]
%print("La longitud interna del árbol multiway es: ",longitud_interna(arbol_multiway))
% -------- Código en Prolog --------------------
main :-
    % Definición de un árbol multiway
    Arbol = arbol(a, [arbol(b, []), arbol(c, [arbol(d, [])])]),
    longitud_interna(Arbol, Longitud),
    write('La longitud interna del árbol es: '), write(Longitud), nl.

% Calcula la longitud interna de un árbol multiway.
longitud_interna(arbol(_, Hijos), Longitud) :-
    longitud_hijos(Hijos, LongitudHijos),
    Longitud is 1 + LongitudHijos.  % Un nodo interno mas la longitud de los hijos.

% Si la lista de hijos esta vacía, la longitud es 0.
longitud_hijos([], 0).  
longitud_hijos([H | T], Longitud) :-
    longitud_interna(H, LongitudH),
    longitud_hijos(T, LongitudT),
    Longitud is LongitudH + LongitudT.
%-------------------------------------
