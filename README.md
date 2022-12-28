# KeepCodingMobile15_Calzadilla_C_Fundamentos_IOS

@uthor : Isabel Calzadilla

@version : práctica IOS Fundamentals


<div align="center"><h1>Práctica Fundamentos iOS</h1></div>

# Enunciado


El objetivo de esta práctica es implementar una aplicación móvil iOS que consuma la API Rest
Dragon Ball presentada en clase.


## Requisitos Obligatorios


- La aplicación deberá estar desarrollada siguiendo la arquitectura MVC. Para el diseño de
interfaces se utilizarán solo archivos .xibs (No storyboards).

- Similar a la desarrollada en clase, la aplicación deberá contener las siguientes pantallas:
• Pantalla de Login (endpoint: /api/auth/login)

• Listado de heroes (a elegir mostrarlos como tabla o colección) (endpoint: /api/heros/all)
• Pantalla de detalle del héroe con botón de acceso a las transformaciones
• Lista de transformaciones del héroe (a elegir mostrarlos como tabla o colección)
(endpoint: /api/heros/tranformations)


- El desarrollo debe incluir UnitTests de los modelos.

## Requisitos Opcionales


- Añadirle lógica al botón de transformaciones para mostrarlo / ocultarlo en caso de que el héroe
no tenga transformaciones.

Spoiler: se deberá realizar la llamada a transformations en la pantalla de detalla del héroe, para saber si tiene o no transformaciones .

- Mostrar el detalle de las transformaciones.

Spoiler: se puede reutilizar alguna pantalla creada anteriormente.


## Resolución

<div align = "center"> 

### Pantalla de Login (endpoint: /api/auth/login)


![image](https://user-images.githubusercontent.com/36207623/209857695-4f334aee-2015-47ac-be31-93f22aa9198c.png)

### View de Login

  

### Listado de heroes (a elegir mostrarlos como tabla o colección) (endpoint: /api/heros/all)


![image](https://user-images.githubusercontent.com/36207623/209858005-a0b9b359-5550-494c-9a98-c5951d41515d.png)

### View de Tabla con personajes


![image](https://user-images.githubusercontent.com/36207623/209858116-7da9e1c8-e2c0-444e-a320-1be2d5256d4e.png)

### View de Collection con personajes



### Pantalla de detalle del héroe con botón de acceso a las transformaciones


![image](https://user-images.githubusercontent.com/36207623/209858239-b5293212-8862-474d-b702-b9a33071da46.png)

### View de Detalle con personajes sin transformación y con Transformación

![image](https://user-images.githubusercontent.com/36207623/209859133-537a7fa7-38ab-4521-91cf-01c94357586e.png)



### Lista de transformaciones del héroe (a elegir mostrarlos como tabla o colección) (endpoint: /api/heros/tranformations)

![image](https://user-images.githubusercontent.com/36207623/209858607-c20b68c5-8d31-41cf-9597-7e09fd624395.png)


## Requisitos Opcionales


### Añadirle lógica al botón de transformaciones para mostrarlo / ocultarlo en caso de que el héroe
no tenga transformaciones.

![image](https://user-images.githubusercontent.com/36207623/209858415-c0e7a55b-4087-48b4-ab1f-a23439c445e2.png)

### View de Detalle de personajes con transformación

He reutilizado la misma celda Details para mostrar los personajes con transformación, además de otros usos que explicaré a continuación.

![image](https://user-images.githubusercontent.com/36207623/209859133-537a7fa7-38ab-4521-91cf-01c94357586e.png)


### Añadir Personaje a 'Me Gusta'

![image](https://user-images.githubusercontent.com/36207623/209859344-69aee3f1-2ff9-4068-8f48-0a9cb326d9ab.png)

### View de La tabla con personajes adheridos a la colección de 'Me Gusta'


- Además he añadido la TableView de los 'Me Gusta' al ToolBar para facilitar su direccionamiento.

- Edit : La única pega que me da el método es que no actualiza la colección de forma inmediata, ha de volver a cerrarse y ejecutar para contemplar la
elección del 'Me gusta' en la colección, conseguí solventarlo con una request al método de 'All' pero se tardaba renderizando y me pareció más practico cerrar la aplicación por ahora.


### Detalle  Personaje Colección 'Me Gusta'

- Solo he reciclado las Views de Details para aprovecharla.

![image](https://user-images.githubusercontent.com/36207623/209859929-821627d1-8e36-4b2d-9e08-11a449826bac.png)


### Añadir  Personaje a la Colección y actualizar el registro de la API en el server

- He creado una View para añadir el personaje, reutilizando Views y realizando la 'QueryItems' para ello, por defecto tomará una imagen random de los elementos contenidos en la colección,  pero se puede añadir la imagen que se desee solo colocando la dirección url en el TextField


![image](https://user-images.githubusercontent.com/36207623/209860105-1fe72bc9-7c09-443f-9090-ad132c6a6c8d.png)


### Nuevo Personaje adherido a la colección

![image](https://user-images.githubusercontent.com/36207623/209860499-bbec82af-502c-4ab5-b01c-0b4fcae83c17.png)


### Detalle Nuevo Personaje adherido a la colección


![image](https://user-images.githubusercontent.com/36207623/209860626-08030998-649c-41f6-817a-de6ffc08291b.png)

  </div>
