% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa que construye la secuencia
%              de recorrido de abajo hacia arriba 
%              de un árbol multiway.
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
%def recorrido_abajo_hacia_arriba(nodo):
%    if nodo is None:
%        return []
%    
%    # Lista para almacenar el recorrido
%    resultado = []
%
%    # Recorrer todos los hijos
%    for hijo in nodo.hijos:
%        resultado.extend(recorrido_abajo_hacia_arriba(hijo))
%    
%    # Agregar el valor del nodo actual
%    resultado.append(nodo.valor)
%
%    return resultado
%
%# Ejemplo de uso
%arbol_multiway = NodoMultiway(1)
%hijo1 = NodoMultiway(2)
%hijo2 = NodoMultiway(3)
%hijo1.agregar_hijo(NodoMultiway(4))
%hijo1.agregar_hijo(NodoMultiway(5))
%hijo2.agregar_hijo(NodoMultiway(6))
%hijo2.agregar_hijo(NodoMultiway(7))
%arbol_multiway.agregar_hijo(hijo1)
%arbol_multiway.agregar_hijo(hijo2)
%
%# Obtener el recorrido de abajo hacia arriba
%recorrido = recorrido_abajo_hacia_arriba(arbol_multiway)
%
%print("Secuencia de recorrido de abajo hacia arriba del árbol multiway:")
%print(recorrido)
% -------- Código en Prolog --------------------
main :-
    % Crear un árbol multiway en estilo Lisp.
    arbol_multiway(a, [b, c, d], ArbolLisp),
    write('Árbol en estilo Lisp: '), write(ArbolLisp), nl,
    % Convertir a la forma tradicional.
    lisp_a_arbol(ArbolLisp, ArbolTradicional),
    write('Árbol en forma tradicional: '), write(ArbolTradicional), nl.

% Define la estructura de un árbol multiway en estilo Lisp.
% El árbol se representará como una lista: [Raiz | Hijos].

% Representar un árbol multiway en estilo Lisp.
arbol_multiway(Raiz, Hijos, Arbol) :-
    Arbol = [Raiz | Hijos].

% Convertir un árbol en representación Lisp a la forma tradicional.
lisp_a_arbol([], nil).  % Caso base para una lista vacía.
lisp_a_arbol([Raiz | Hijos], arbol(Raiz, HijosArbol)) :-
    maplist(lisp_a_arbol, Hijos, HijosArbol).
%-------------------------------------
