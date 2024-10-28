% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa que construye un árbol 
%              multiway a partir de una secuencia
%              de nodos.
%              Se incluye una versión en python.
% ===============================================
% -------- Código en python ------------
%class NodoMultiway:
%    def __init__(self, valor):
%        self.valor = valor
%        self.hijos = []
%
%    def agregar_hijo(self, hijo):
%        self.hijos.append(hijo)
%
%def construir_arbol_multiway(nodos):
%    if not nodos:
%        return None
%
%    # Crear el nodo raíz con el primer valor
%    raiz = NodoMultiway(nodos[0])
%    
%    # Agregar hijos recursivamente
%    for hijo in nodos[1:]:
%        raiz.agregar_hijo(construir_arbol_multiway(hijo))
%
%    return raiz
%
%def imprimir_arbol(arbol, nivel=0):
%    if arbol is not None:
%        print(' ' * nivel + str(arbol.valor))
%        for hijo in arbol.hijos:
%            imprimir_arbol(hijo, nivel + 2)
%
%# Ejemplo de uso
%secuencia_nodos = [1, [2, [4], [5]], [3, [6], [7]]]
%arbol_multiway = construir_arbol_multiway(secuencia_nodos)
%
%print("Estructura del árbol multiway:")
%imprimir_arbol(arbol_multiway)
% -------- Código en Prolog --------------------
main :-
    Nodos = [a, b, c, d, e, f],  % Lista de nodos.
    construir_arbol_multiway(Nodos, Arbol),
    write('Árbol construido: '), write(Arbol), nl.

% Construye un árbol multiway a partir de una lista de nodos.
construir_arbol_multiway([], nil).  % Una lista vacía produce un árbol vacío.
construir_arbol_multiway(Nodos, arbol(Raiz, Hijos)) :-
    Nodos = [Raiz | Restantes],  % La cabeza de la lista es la raíz.
    dividir_hijos(Restantes, Hijos).  % Divide el resto de los nodos en hijos.

% Divide la lista de nodos restantes en subárboles (hijos).
dividir_hijos([], []).  % Si no hay nodos restantes, no hay hijos.
dividir_hijos(Nodos, [Hijo | Hijos]) :-
    % Se toma un hijo de la lista de nodos.
    Hijo = arbol(Raiz, SubHijos),  % Se construye el hijo.
    Nodos = [Raiz | Restantes],  % La cabeza de la lista de nodos es la raíz del hijo.
    dividir_hijos(Restantes, Hijos).  % Divide el resto en mas hijos.

%-------------------------------------
