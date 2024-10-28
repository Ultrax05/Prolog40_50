% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa que verifique si un 
%              término dado representa un árbol multiway.
%              Se incluye una versión en python.
% ===============================================
% -------- Código en python ------------
%def es_arbol_multiway(termino):
%    # Verificar si el término es una lista
%    if not isinstance(termino, list):
%        return False
%    
%    # Verificar el primer elemento (valor del nodo)
%    if len(termino) == 0:
%        return False
%    
%    # Verificar los hijos
%    for hijo in termino[1:]:
%        if not es_arbol_multiway(hijo):
%            return False
%            
%    return True
%
%# Ejemplo de uso
%arbol_multiway_valido = [1, [2, [4], [5]], [3, [6], [7]]]
%arbol_multiway_no_valido = [1, [2, [4], 5], [3, [6, [7]]]]  # 5 no es un árbol
%
%print("El término representa un árbol multiway (válido):", es_arbol_multiway(arbol_multiway_valido))  # True
%print("El término representa un árbol multiway (no válido):", es_arbol_multiway(arbol_multiway_no_valido))  # False
% -------- Código en Prolog --------------------
main :-
    % Definición de un árbol multiway
    Arbol1 = arbol(a, [arbol(b, []), arbol(c, [arbol(d, [])])]),
    Arbol2 = arbol(x, [arbol(y, []), x]), % No es un árbol multiway válido
    (arbol_multiway(Arbol1) -> write('Arbol1 es un árbol multiway.'), nl; write('Arbol1 NO es un árbol multiway.'), nl),
    (arbol_multiway(Arbol2) -> write('Arbol2 es un árbol multiway.'), nl; write('Arbol2 NO es un árbol multiway.'), nl).
    
% Verifica si un término es un árbol multiway.
arbol_multiway(arbol(Raiz, Hijos)) :-
    es_lista_hijos(Hijos).

% Verifica si Hijos es una lista de árboles o está vacía.
es_lista_hijos([]).  % Una lista vacía es un caso válido.
es_lista_hijos([H | T]) :-  % Verifica el primer elemento y el resto.
    arbol_multiway(H),  % H debe ser un árbol multiway.
    es_lista_hijos(T).  % Verifica el resto de la lista.

%-------------------------------------
