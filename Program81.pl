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
    % Construir un árbol multiway para el ejemplo.
    Arbol = arbol(a, [arbol(b, [arbol(e, []), arbol(f, [])]), arbol(c, []), arbol(d, [arbol(g, []), arbol(h, [])])]),
    write('Árbol: '), write(Arbol), nl,
    recorrido_inverso(Arbol, Resultado),
    write('Recorrido de abajo hacia arriba: '), write(Resultado), nl.

% Define la estructura de un árbol multiway.
% arbol(Raiz, Hijos) donde Hijos es una lista de subárboles.

% Recorrido de abajo hacia arriba de un árbol multiway.
recorrido_inverso(nil, []).  % Un árbol vacío no produce recorrido.
recorrido_inverso(arbol(Raiz, Hijos), Resultado) :-
    % Recorre cada hijo y acumula sus resultados.
    maplist(recorrido_inverso, Hijos, ResultadosHijos),
    % Aplana la lista de resultados de los hijos y añade la raíz al final.
    flatten(ResultadosHijos, ResultadoHijos),
    append(ResultadoHijos, [Raiz], Resultado).
%-------------------------------------
