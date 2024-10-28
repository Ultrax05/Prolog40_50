% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa que verifica si un término 
%              dado representa un árbol multiway.
%              Se incluye una versión en python.
% ===============================================
% -------- Código en python ------------
%def es_arbol_multiway(termino):
%    # Verificar si el término es una lista
%    if not isinstance(termino, list):
%        return False
%
%    # El primer elemento debe ser un valor (no debe ser None)
%    if len(termino) == 0 or termino[0] is None:
%        return False
%
%    # Verificar que cada hijo también sea un árbol multiway
%    for hijo in termino[1:]:
%        if not es_arbol_multiway(hijo):
%            return False
%
%    return True
%
%# Ejemplo de uso
%arbol_multiway_valido = [1, [2, [4], [5]], [3, [6], [7]]]
%arbol_multiway_no_valido = [1, [2, 4, 5], [3, [6, [7]]]]  # 4 y 5 no son árboles
%
%print("El término representa un árbol multiway (válido):", es_arbol_multiway(arbol_multiway_valido))  # True
%print("El término representa un árbol multiway (no válido):", es_arbol_multiway(arbol_multiway_no_valido))  # False
% -------- Código en Prolog --------------------
main :-
    Arbol1 = arbol(a, [arbol(b, []), arbol(c, [arbol(d, [])])]),
    Arbol2 = arbol(a, [b, c]),  % Este no es un árbol multiway válido.
    
    (es_arbol_multiway(Arbol1) ->
        write('Arbol1 es un árbol multiway.'), nl
    ;
        write('Arbol1 no es un árbol multiway.'), nl
    ),
    
    (es_arbol_multiway(Arbol2) ->
        write('Arbol2 es un árbol multiway.'), nl
    ;
        write('Arbol2 no es un árbol multiway.'), nl
    ).

% Verifica si un término representa un árbol multiway.
es_arbol_multiway(arbol(Raiz, Hijos)) :-
    atom(Raiz),           % Verifica que la raíz sea un átomo.
    es_lista_hijos(Hijos).  % Verifica que los hijos sean una lista de árboles.

% Verifica si un término es una lista de árboles.
es_lista_hijos([]).  % Una lista vacía es un caso base válido.
es_lista_hijos([H | T]) :-
    es_arbol_multiway(H),  % Verifica que el primer elemento sea un árbol.
    es_lista_hijos(T).      % Verifica recursivamente el resto de la lista.
%-------------------------------------
