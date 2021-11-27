# Creando el diagrama Entidad-Relación

Para terminar con la Capa de Datos, en este ejercicio crearemos la llave foránea de las tablas creadas 
en los ejercicios anteriores, una forma de realizarlo es mediante un diagrama Entidad-Relación en 
Microsoft SQL Server Management Studio.

1. Abre **Microsoft SQL Server Management Studio** y expande el nodo **NWind.**
2. Selecciona la opción **New Database Diagram** del menú contextual de la opción **Database 
   Diagrams.**
   
   ![New Diagram](https://user-images.githubusercontent.com/45072377/143627568-dcc41642-7a2a-4bd8-ac5f-c5cc3c1ff12a.png)
   
3. En caso de que te sea mostrada la ventana de diálogo indicándote que se requiere de objetos 
   de soporte, haz clic en **Yes** para crearlos.
   
   ![Yes diagram](https://user-images.githubusercontent.com/45072377/143627700-c919bd24-edb1-41e6-bd3f-310ca3587908.png)
   
   La ventana **Add Table** será mostrada.
   
4. En la ventana **Add Table**, selecciona las tablas **Categories y Products** y haz clic en el botón **Add.**

   ![tables](https://user-images.githubusercontent.com/45072377/143627818-43bb9711-c249-4f81-89b3-9030d7cb5f90.png)

5. Haz clic en el botón **Close** para cerrar la ventana **Add Table.**
6. Crea la relación entre ambas tablas seleccionando el campo **CategoryID** de la tabla **Categories**
y arrastrándolo hacia el campo **CategoryID** de la tabla **Products.** Al soltar el botón del ratón se 
mostrará la ventana **Tables and Columns.**

7. Verifica que las tablas y campos sean los correctos y haz clic en el botón **OK.**

   ![RelationshipProductsAndCategories](https://user-images.githubusercontent.com/45072377/143632292-707353a6-695b-46fd-8f8b-244002e93799.png)
   
8. En la ventana **Foreign Key Relationship** haz clic en el botón **OK** para crear la llave foránea. Se 
   mostrará un diagrama similar al siguiente.
   
   ![diagramProductsAndCategories](https://user-images.githubusercontent.com/45072377/143634016-2e8b73f3-5297-45a9-a866-9a2f43b23307.png)
   
9. Haz clic en el botón **Save** de la barra de herramientas. 
10. En el cuadro de dialogo **Choose Name** escribe el nombre **NWindDiagram** y haz clic en **OK** para 
    guardar los cambios.
    
    ![diagramDialog](https://user-images.githubusercontent.com/45072377/143636052-38b9837c-3954-4ba7-8aef-165b4b47c576.png)
    
11. En la ventana **Save,** aparecerá un resumen de las tablas que serán afectadas. Haz clic en **Yes**
    para aceptar los cambios.
    
    ![DialogSaveDiagram](https://user-images.githubusercontent.com/45072377/143636977-ab3eb368-06ea-46eb-ad8b-17ff280371a2.png)
    
Con esto finaliza este ejercicio y como resultado tenemos la capa de datos con la base de datos **NWind**
con sus relaciones entre las tablas **Categories y Products.**    

    

  





