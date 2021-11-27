# Creando la capa de Entidades y Acceso a Datos con Entity Framework

Entity Framework es una tecnología que proporciona una solución ORM (Object Relational Mapping), 
ORM es una técnica de programación que permite a los desarrolladores trabajar con datos relacionales 
usando objetos específicos del dominio a través de mapeos de entidades con tablas y de propiedades 
de la entidad con campos de la tabla. Un ORM reduce la cantidad de código de acceso a datos que los 
desarrolladores deben escribir para realizar consultas o actualizaciones sobre la fuente de datos.

Cuando desarrollamos aplicaciones con acceso a datos utilizando Entity Framework podemos elegir 
alguno de los 3 enfoques que nos ofrece:

* **Database-First,** la base de datos se crea primero y el código y el modelo se crean después.
* **Model-First,** primero se crea el modelo y posteriormente se genera la estructura de la base de datos a partir del modelo.
* **Code-First,** donde se crean primero las entidades y después se crea la base de datos en base a las entidades.

En esta tarea se describe la forma de crear la capa de Acceso a datos utilizando *Entity Framework*
con el enfoque *Database-First* y se describe la forma de crear la capa de Entidades.

Finalmente, se describe de manera sencilla la forma de implementar el patrón **Repository** para el 
acceso a datos.

## Objetivos

Al finalizar esta tarea, los participantes contarán con las habilidades y conocimientos para:

* Crear la capa de Acceso a Datos.
* Crear la capa de Entidades.
* Implementar el patrón *Repositorio.*
* Probar la capa de Acceso a Datos.

## Creando la capa de Acceso a Datos

Una vez creada la base de datos, el siguiente paso es iniciar con el desarrollo de la aplicación que podrá 
realizar operaciones CRUD sobre la información de nuestra base de datos.

Empecemos creando una solución vacía en Visual Studio, los pasos a seguir son los siguientes:

1. Abre Visual Studio en contexto de administrador.
2. Selecciona la opción **Archivo > Nuevo > Proyecto…** de la barra de menús de Visual Studio.
3. En la ventana **Nuevo proyecto** selecciona la plantilla **Solución en blanco**.

   ![Blank Solution](https://user-images.githubusercontent.com/45072377/143649055-e0e4e2f3-706f-46ff-81b8-aca37c409fd8.png)
   
4. Escribe el nombre **NWind** para la solución, selecciona la ubicación y haz clic en el botón **Crear.**

   ![Configuring solution name and location](https://user-images.githubusercontent.com/45072377/143650840-4c3fff0e-a0c3-4988-84e8-941f8b88fa08.png)
   
El siguiente paso será agregar un proyecto a la solución para implementar la capa de acceso a datos utilizando **Entitiy Framework 6.**

5. Selecciona la opción **Add > New Project…** del menú contextual de la solución.

   ![new project](https://user-images.githubusercontent.com/45072377/143655342-59140211-5d5a-4f08-9f37-29e2d191e5ac.png)
   
6. En la ventana **Add New Project,** selecciona la plantilla **Libreria de clases (.Net Framework).**

   ![Class Library](https://user-images.githubusercontent.com/45072377/143655621-684533c2-e5a5-4ed2-84f1-0d9af9cdc3a3.png)
   
7. Escribe el nombre **DAL** y haz clic en el botón **Crear** para agregar el proyecto.

   ![name project](https://user-images.githubusercontent.com/45072377/143655775-6ba64405-febc-405c-81f9-ad5b5c165dab.png)
   
Al utilizar la plantilla Class Library con el *.NET Framework,* podremos utilizar distintos 
controladores de bases de datos en nuestra aplicación, por ejemplo, cuando tengamos la 
necesidad de utilizar controladores de bases de datos que solo sean soportadas en Windows 
como Visual FoxPro. Si utilizáramos *.NET Standard o .NET Core,* no tendríamos la opción de 
utilizar *Entity Framework* que requiere el .NET Framework.

8. Elimina el archivo **Class1.cs** que es generado automáticamente.

Ahora es momento de crear el modelo.

Selecciona la opción **Add > New Item…** del menú contextual del proyecto **DAL.**

![New model class](https://user-images.githubusercontent.com/45072377/143655997-b51f1c19-8117-4bbb-aa65-0a2b5ee3c0ee.png)

10. Selecciona la plantilla **ADO.NET Entity Data Model.**

![Entity Data Model](https://user-images.githubusercontent.com/45072377/143656055-cb5be09b-a298-4d9c-b777-fa3aa8450394.png)

11. Escribe el nombre **NWindDBModel** y haz clic en el botón **Add** para continuar.

    ![EDM name](https://user-images.githubusercontent.com/45072377/143656146-d2bfefaa-c48b-4902-8db4-34308b9ad38f.png)
    
**Nota:** Si no aparece **ADO.NET Entity Data Model,** dirigase aquí para instalarlo [ADO.NET Entity Data Model](ef-ado.net-entity-data-model.md)   
    
La ventana *Entity Data Model Wizard* será mostrada. Entity Data Model Wizard es uno de los asistentes 
de *ADO.NET Entity Framework* que nos permite generar un nuevo modelo conceptual.

12. En la ventana *Entity Data Model Wizard* selecciona la opción **EF Designer from DataBase** y haz clic en **Next.**
    
    ![Wizard window](https://user-images.githubusercontent.com/45072377/143656271-f74f14cf-3ff5-46d8-9b37-33596f8a2a75.png)
    
13. En la pantalla **Choose Your Data Connection** selecciona **nueva conexión.**

    ![New connection wizard](https://user-images.githubusercontent.com/45072377/143656526-b5c78aaa-34bf-436c-a274-2f12aa4e7170.png)
    
14. En la ventana de **Connection Properties**, en la opción **Server Name** ingresa el nombre del servidor donde está nuestra base de datos Nwind; en nuestro
    en el servidor **(localdb)\mssqllocaldb**
    
    ![Server name](https://user-images.githubusercontent.com/45072377/143656675-27cbb5c7-e69e-44ac-a6f6-9bd75460cf8f.png)
    
15. En la opción selecciona o ingresa el nombre de la base de datos escribe **NWind.** A continuación asegurate que la conexión sea exitosa, haciendo clic en el 
    botón **Probar conexión**. Hacer clic en el botón **Ok** para cerrar la ventana.
    
    ![test connection](https://user-images.githubusercontent.com/45072377/143656811-62a3d4f0-4dca-4688-ba0a-faa4f7237913.png)
    
Puedes ver la cadena de conexión que el asistente ha creado automáticamente, en ella se 
especifican los datos del modelo conceptual con sus definiciones y sus mapeos asi como el 
nombre del servidor, el nombre de la base de datos inicial, la seguridad y el soporte a múltiples 
resultados activos. La cadena de conexión será guardada en el archivo *App.Config.*

![choose connection](https://user-images.githubusercontent.com/45072377/143656947-3db78544-4225-47ec-906d-6f94e110a7ce.png)

16. Escribe el nombre **NWindEntities** para la llave que será guardada en el archivo de 
    configuración y haz clic en **Next.**
    
    ![NWindEntities name](https://user-images.githubusercontent.com/45072377/143657028-c09461ea-fa02-4b96-8e49-a9751ec2c1a9.png)
    
17. En la ventana **Choose Your Versión**, selecciona la opción **Entity Framework 6.x** y haz clic en el 
    botón **Next.**
    
    ![EF version](https://user-images.githubusercontent.com/45072377/143657093-ab5b519f-0ac7-450e-abda-e5b37ded001d.png)
    
Aparecerá una ventana donde podrás ver los posibles elementos que se pueden agregar al modelo.

18. Selecciona las tablas **Categories y Products.**

    ![Select tables](https://user-images.githubusercontent.com/45072377/143657198-c350457b-dca8-45d5-9454-d33201db4b9a.png)
    
19. Verifica que la casilla **foreign key columns in the model** esté seleccionada, esto permitirá importar las relaciones que existen entre las tablas.

    ![foreign key](https://user-images.githubusercontent.com/45072377/143657351-b6c90dfd-2480-47c4-b3ac-a03033597b15.png)
    
La opción **Import Selected store procedures…** permitirá importar los procedimientos 
almacenados que podrán ser utilizados como funciones de C#. Esta opción no nos es útil por 
el momento ya que no tenemos Stored procedures en la base de datos.

La opción **Pluralize or singularize generated objects names** singulariza los nombres de las 
tablas por ejemplo de *Products a Product y de Categories a Category.*

20. Selecciona la opción **Pluralize or singularize generated objects names** y haz clic en el botón **Finish** para finalizar.

    ![pluralizeTables names](https://user-images.githubusercontent.com/45072377/143657477-82977fab-3a42-487a-ab38-1b1d48788449.png)
    
21. Haz clic en **OK** en caso de que te sea solicitada la autorización para ejecutar la plantilla.    

    ![ok confirm dialog](https://user-images.githubusercontent.com/45072377/143657573-babc4e54-93a8-4cc4-9153-593298826303.png)
    
Cuando creamos un modelo mediante el *Entity Data Model Wizard* el modelo se abrirá en el 
panel del diseñador mostrando las entidades que el asistente haya generado y las relaciones 
entre ellas (Propiedades de navegación). Se puede utilizar este panel para agregar, modificar 
y *eliminar* entidades y relaciones.

![Model and Relationship](https://user-images.githubusercontent.com/45072377/143660975-8cc8e97e-5000-4a17-9ccf-b4c3de20cd5e.png)

La siguiente imagen muestra la solución después de agregar el modelo. Observa los archivos 
**NWindDBModel.context.tt y NWindDBModel.tt** que conforman el modelo.

![Solution](https://user-images.githubusercontent.com/45072377/143661048-3bbe8119-dc34-43c2-90c3-e0d46e804b44.png)

Es importante hacer notar, que tanto el código de acceso a datos como las entidades han quedado 
en el mismo proyecto. El siguiente ejercicio será separar a las entidades del código de acceso a 
datos para que queden en un proyecto independiente y de esta forma puedan ser utilizadas por 
las demás capas sin violar las reglas de la arquitectura n-capas que nos indica que una capa solo 
puede consumir los servicios de la capa inmediatamente inferior.






   


    

    





    




   

   
  



   





