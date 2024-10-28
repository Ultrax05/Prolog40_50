% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa que represente un árbol 
%              binario como una cadena.
%              Se incluye una versión en python.
% ===============================================
% -------- Código en python ------------
%class Nodo:
%    def __init__(self, valor):
%        self.valor = valor
%        self.izquierda = None
%        self.derecha = None
%
%def representar_arbol_como_cadena(raiz):
%    if raiz is None:
%        return "None"  # Representación de nodos vacíos
%    # Construir la representación en preorden
%    return f"{raiz.valor}, {representar_arbol_como_cadena(raiz.izquierda)}, {representar_arbol_como_cadena(raiz.derecha)}"
%
%# Ejemplo de uso
%# Construir un árbol binario de ejemplo
%raiz = Nodo(1)
%raiz.izquierda = Nodo(2)
%raiz.derecha = Nodo(3)
%raiz.izquierda.izquierda = Nodo(4)
%raiz.izquierda.derecha = Nodo(5)
%raiz.derecha.izquierda = Nodo(6)
%raiz.derecha.derecha = Nodo(7)
%
%# Representar el árbol como cadena
%arbol_cadena = representar_arbol_como_cadena(raiz)
%print("Representación del árbol binario como cadena:")
%print(arbol_cadena)
% -------- Código en Prolog --------------------
main :-
    Arbol = arbol(a, arbol(b, nil, nil), arbol(c, arbol(d, nil, nil), nil)),
    arbol_a_cadena(Arbol, Cadena),
    write('Representación del árbol: '), write(Cadena), nl.

% Representa un árbol binario como una cadena.
arbol_a_cadena(nil, "").
arbol_a_cadena(arbol(Raiz, Izquierdo, Derecho), Cadena) :-
    arbol_a_cadena(Izquierdo, CadenaIzq),
    arbol_a_cadena(Derecho, CadenaDer),
    format(string(Cadena), "(~w ~s ~s)", [Raiz, CadenaIzq, CadenaDer]).
%-------------------------------------
