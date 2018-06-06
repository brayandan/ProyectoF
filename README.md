# ProyectoF
Proyecto final de programación:

Integrantes:

Brayan Daniel Barrera

Daniel Esteban Bohórquez

Carlos Andrés Arévalo

Leonardo Andrés Pacheco

Objetivo: Crear un programa capaz de solucionar problemas de armaduras simples de estática (2D con un sólo apoyo fijo). 

Diseño de Clases:
-Clase Node: Esta clase permite la conexion de elementos de la armadura, y de la misma forma la ubicación de barra, soportes, fuerzas y momentos.
-Clase Bar: Permite la visualización de una barra a partir de la utilización de dos nodos (inicial y final).
-Clase Support: Es una clase que se presenta como un polimorfismo, dado que el apoyo puede tomar diferentes formas tales como: 
--Fixed
--Roller
--Collar
--Pinned
-Clase Button: Esta clase permite que el programa tenga una mejor interfaz visual, donde el usuario tenga mayor facilidad al momento de diseñar su armadura, esto a partir de una imagen insertada, una posición en la pantalla y una funcionalidad única al momento de realizar los métodos propuestos en esta clase.

Resultados y Trabajo Futuro: Por la implementación de las clases anteriormente descritas, se realizó un programa que permite crear una armadura con sus respetivos apoyos, y la implementacion de fuerzas y momentos en los nodos de dicha armadura.
En cuanto al trabajo futuro se espera realizar modificaciones donde el programa sea capaz de realizar máquinas  o marcos y a su vez permita ver las fuerzas que poseen cada uno de estos elementos.


