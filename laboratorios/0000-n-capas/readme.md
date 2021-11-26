En este módulo aplicaremos los conceptos teóricos descritos en el módulo anterior desarrollando una 
aplicación en la cual implementaremos la Arquitectura N-Capas.<br/>

Para ejemplificar el desarrollo de una aplicación en N-Capas, desarrollaremos una aplicación que nos 
permita realizar operaciones CRUD con 2 tablas en una base de datos de una empresa ficticia.

La capa de datos se encontrará alojada en un servidor Microsoft SQL Server. Utilizando el enfoque 
Database-First que es el enfoque más común, construiremos la Capa de acceso a datos y la capa de 
entidades utilizando Entity Framework. Separaremos las Entidades POCO en un proyecto .NET 
Standard independiente de la capa de acceso a datos para poder reutilizar esta capa de entidades en 
las demás capas, incluyendo en los clientes Xamarin.Forms.

Crearemos una capa de lógica de negocios para permitir el acceso a los datos desde las otras capas, 
construiremos una capa de servicio utilizando un Web API ASP.NET MVC para dar soporte a 
aplicaciones WPF, Web, UWP, iOS y Android.

Toda la solución será desarrollada utilizando Visual Studio como entono de desarrollo. Los pasos 
descritos en los ejercicios están diseñados con Visual Studio Enterprise 2019 versión 16.11.2 sobre una 
máquina con Windows 10 Pro y SQL Server 2017.

## Objetivos
Al finalizar este módulo, los participantes podrán: 

* Crear la capa de origen de datos utilizando Microsoft SQL Server.
* Crear la capa de Acceso a datos utilizando Entity Framework.
* Crear la capa de Entidades utilizando una biblioteca de clases .NET Standard.
* Crear la capa de Lógica de Negocios.
