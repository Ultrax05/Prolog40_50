% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa que cuenta el número de 
%              nodos de un árbol multiway.
%              Se incluye una versión en python.
% ===============================================
% -------- Código en python ------------
%def contar_nodos(termino):
%    # Verificar si el término es una lista (nodo)
%    if not isinstance(termino, list):
%        return 0
%
%    # El primer elemento cuenta como un nodo
%    contador = 1
%
%    # Iterar sobre los hijos del nodo (a partir del segundo elemento)
%    for hijo in termino[1:]:
%        contador += contar_nodos(hijo)
%
%    return contador
%
%# Ejemplo de uso
%arbol_multiway = [1, [2, [4], [5]], [3, [6, [7]], [8]]]
%numero_nodos = contar_nodos(arbol_multiway)
%
%print(f"El número de nodos en el árbol multiway es: {numero_nodos}")
% -------- Código en Prolog --------------------
main :-
    Arbol = arbol(a, [arbol(b, []), arbol(c, [arbol(d, []), arbol(e, [])])]),
    contar_nodos(Arbol, NumeroNodos),
    write('Número de nodos en el árbol: '), write(NumeroNodos), nl.
    
% Cuenta el número de nodos en un árbol multiway.
contar_nodos(arbol(_, Hijos), Cantidad) :-
    contar_nodos_hijos(Hijos, CantidadHijos),  % Cuenta los nodos en los hijos.
    Cantidad is 1 + CantidadHijos.  % Suma 1 por la raíz.

% Cuenta el número de nodos en una lista de árboles.
contar_nodos_hijos([], 0).  % Una lista vacía tiene 0 nodos.
contar_nodos_hijos([H | T], Cantidad) :-
    contar_nodos(H, CantidadHijo),  % Cuenta los nodos del árbol hijo.
    contar_nodos_hijos(T, CantidadResto),  % Cuenta los nodos del resto de la lista.
    Cantidad is CantidadHijo + CantidadResto.  % Suma los nodos.
%-------------------------------------
