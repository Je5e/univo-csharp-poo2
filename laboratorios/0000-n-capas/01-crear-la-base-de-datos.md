# Creando la base de datos con Microsoft SQL Server Management Studio

Para crear la base de datos que utilizaremos en nuestra aplicación podemos utilizar dos herramientas, 
una de ellas es **Microsoft SQL Server Management Studio** y la otra es la ventana **Server Explorer de 
Visual Studio.**

Empecemos con SQL Server Management Studio.

1. Abre la aplicación **Microsoft SQL Server Management Studio.**

     ![Sql Managment Studio](images/001-ssm.png)
     

2. En la ventana **Connect to Server** selecciona **Database Engine** como tipo de servidor.
3. Introduce o selecciona el nombre del servidor SQL Server.
4. Selecciona **Windows Authentication** como el tipo de autenticación. Sí lo prefieres puedes 
seleccionar otro tipo de autenticación y proporcionar los datos de autenticación que te sean 
solicitados.
5. Haz clic en el botón **Connect** para realizar la conexión.

![Connect to Server](https://user-images.githubusercontent.com/45072377/143620432-3d2a519e-6d7a-4fa4-b21b-f24b10be2797.png)

Después de realizar la conexión te será mostrada la ventana **Object Explorer.**

6. Desde la ventana **Object Explorer** selecciona la opción **New Database** del menú contextual del 
   nodo **Databases.**
   
   ![New Database](https://user-images.githubusercontent.com/45072377/143620780-763a1f75-f0e0-41ca-b1a2-d872139e105f.png)
   
   7. En la ventana **New Database** establece el nombre **NWind** a la base de datos y haz clic en el 
      botón **OK** para crear la nueva base de datos.
      
      ![database name](https://user-images.githubusercontent.com/45072377/143620878-fc7f23ed-e481-426b-9ba6-ecb16f570609.png)
      
   8. En la ventana **Object Explorer**, selecciona la opción **New > Table…** del menú contextual del 
      nodo **Tables.**
      
      ![new table](https://user-images.githubusercontent.com/45072377/143621118-78b3a4b4-6e27-4db5-9dea-8248de0de80e.png)
      
  9. En la ventana de diseño de la tabla, registra la siguiente información

     ![tables values](https://user-images.githubusercontent.com/45072377/143621190-7a92bef9-f352-498d-a93a-62f2cd6ba836.png)
     
  10. Selecciona la opción **Set primary Key** del menú contextual del campo CategoryID para 
      establecer el campo CategoryID como la llave primaria de la tabla.
      
      ![Set primary key](https://user-images.githubusercontent.com/45072377/143621412-9c32dc65-2cf2-438d-a11c-3fe4d17502f4.png)
      
   11. En la sección **Column Properties** del campo *CategoryID* establece la propiedad **Is Identity** con 
       el valor **Yes.**
       
       ![Identity is](https://user-images.githubusercontent.com/45072377/143621563-bc301565-44cd-4ebb-bba4-2a1173a6233d.png)
       
   12. Guarda la tabla con el nombre **Categories.**

Después de guardar los cambios, podrás ver la tabla **Categories** dentro de la carpeta **Tables**
de la Base de Datos **NWind.**

![table created](https://user-images.githubusercontent.com/45072377/143621705-669989a9-42b2-4d9f-86da-31a3b8e54796.png)

Realice el mismo procedimiento para crear otra tabla llamada **Products**:

Escribe los nombres de las columnas, tipos de datos y opciones Null de acuerdo con la siguiente 
tabla:

![product table](https://user-images.githubusercontent.com/45072377/143621867-ea646a5e-be1b-42fc-8922-7abd1a4fa656.png)

Al finalizar estas tareas vamos a tener la base de datos con las siguientes tablas:

![2 tables](https://user-images.githubusercontent.com/45072377/143622334-5dc38c2a-dcaf-47e7-b59e-448c20293acc.png)





       


     






