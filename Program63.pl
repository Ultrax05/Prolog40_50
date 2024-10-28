% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa que construya un árbol 
%              binario completo con n nodos.
%              Se incluye una versión en python.
% ===============================================
% -------- Código en python ------------
%class Nodo:
%    def __init__(self, valor):
%        self.valor = valor
%        self.izquierda = None
%        self.derecha = None
%
%def construir_arbol_binario_completo(n):
%    # Si no hay nodos, retornar None
%    if n <= 0:
%        return None
%    
%    # Crear una lista de nodos
%    nodos = [Nodo(i) for i in range(1, n + 1)]
%    
%    # Asignar los hijos izquierdo y derecho para cada nodo
%    for i in range(n):
%        if 2 * i + 1 < n:  # Verificar índice para el hijo izquierdo
%            nodos[i].izquierda = nodos[2 * i + 1]
%        if 2 * i + 2 < n:  # Verificar índice para el hijo derecho
%            nodos[i].derecha = nodos[2 * i + 2]
%    
%    # Retornar la raíz del árbol
%    return nodos[0]
%
%# Función para imprimir el árbol en niveles (BFS) para verificar el resultado
%def imprimir_arbol_por_niveles(raiz):
%    if raiz is None:
%        return
%    cola = [raiz]
%    while cola:
%        actual = cola.pop(0)
%        print(actual.valor, end=" ")
%        if actual.izquierda:
%            cola.append(actual.izquierda)
%        if actual.derecha:
%            cola.append(actual.derecha)
%    print()
%
%# Ejemplo de uso
%n = 7
%arbol_binario_completo = construir_arbol_binario_completo(n)
%print("Árbol binario completo con", n, "nodos:")
%imprimir_arbol_por_niveles(arbol_binario_completo)
% -------- Código en Prolog --------------------
main :-
    N = 7,
    arbol_binario_completo(N, Arbol),
    write('Arbol binario completo: '), write(Arbol), nl.

% Construye un árbol binario completo con N nodos.
arbol_binario_completo(N, Arbol) :-
    construir_lista_nodos(N, ListaNodos),
    construir_arbol(ListaNodos, Arbol).

% Construye una lista de nodos para el árbol
construir_lista_nodos(0, []).
construir_lista_nodos(N, [x|Resto]) :-
    N > 0,
    N1 is N - 1,
    construir_lista_nodos(N1, Resto).

% Construye el árbol a partir de la lista de nodos.
construir_arbol([], nil).
construir_arbol([X|Resto], arbol(X, Izquierdo, Derecho)) :-
    dividir_lista(Resto, IzquierdaLista, DerechaLista),
    construir_arbol(IzquierdaLista, Izquierdo),
    construir_arbol(DerechaLista, Derecho).

% Divide la lista de nodos en dos partes, izquierda y derecha.
dividir_lista(Lista, Izquierda, Derecha) :-
    length(Lista, Len),
    HalfLen is Len // 2,
    length(Izquierda, HalfLen),
    append(Izquierda, Derecha, Lista).
%-------------------------------------
