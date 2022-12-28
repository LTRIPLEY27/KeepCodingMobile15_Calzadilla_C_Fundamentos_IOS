# KeepCodingMobile15_Calzadilla_C_Fundamentos_IOS

@uthor : Isabel Calzadilla

@version : práctica IOS Fundamentals


<div align="center"><h1>Práctica Fundamentos iOS</h1></div>

#Enunciado


El objetivo de esta práctica es implementar una aplicación móvil iOS que consuma la API Rest
Dragon Ball presentada en clase.


##Requisitos Obligatorios


- La aplicación deberá estar desarrollada siguiendo la arquitectura MVC. Para el diseño de
interfaces se utilizarán solo archivos .xibs (No storyboards).

- Similar a la desarrollada en clase, la aplicación deberá contener las siguientes pantallas:
• Pantalla de Login (endpoint: /api/auth/login)

• Listado de heroes (a elegir mostrarlos como tabla o colección) (endpoint: /api/heros/all)
• Pantalla de detalle del héroe con botón de acceso a las transformaciones
• Lista de transformaciones del héroe (a elegir mostrarlos como tabla o colección)
(endpoint: /api/heros/tranformations)


- El desarrollo debe incluir UnitTests de los modelos.

##Requisitos Opcionales


- Añadirle lógica al botón de transformaciones para mostrarlo / ocultarlo en caso de que el héroe
no tenga transformaciones.

Spoiler: se deberá realizar la llamada a transformations en la pantalla de detalla del héroe, para saber si tiene o no transformaciones .

- Mostrar el detalle de las transformaciones.

Spoiler: se puede reutilizar alguna pantalla creada anteriormente.
