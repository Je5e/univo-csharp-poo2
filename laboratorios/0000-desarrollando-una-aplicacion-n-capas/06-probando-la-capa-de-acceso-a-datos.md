# Probando la Capa de Acceso a Datos 

Antes de continuar con las demás capas de nuestra aplicación, podríamos probar la funcionalidad de 
la capa de Acceso a Datos.

1. Agrega a la solución una aplicación de Windows Forms con el nombre **WFTest.**

![WF client application](https://user-images.githubusercontent.com/45072377/145107306-7074012c-00cb-4342-9488-5a82a42ed03f.png)

![Configuration application](https://user-images.githubusercontent.com/45072377/145107438-67588696-3c16-4ce1-805e-6c2cbc853864.png)

2. Agrega una referencia de los proyectos DAL y Entities al proyecto WFTest.

![Add project reference](https://user-images.githubusercontent.com/45072377/145108016-4c3bad90-06fc-460c-835a-65d98775699f.png)

![Mark projects](https://user-images.githubusercontent.com/45072377/145108128-9c4affd6-8e73-469b-baf6-7c496f9e44d4.png)

3. Localiza la cadena de conexión a la base de datos en el archivo **App.config** del proyecto **DAL.**
El código es similar al siguiente.
```xml
<connectionStrings>
    <add name="NWindEntities" connectionString="metadata=res://*/NWindDBModel.csdl|res://*/NWindDBModel.ssdl|res://*/NWindDBModel.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=(localdb)\mssqllocaldb;initial catalog=NWind;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework&quot;" providerName="System.Data.EntityClient" />
  </connectionStrings>
```

4. Copia ese código al archivo **App.config** del proyecto WFTest dentro del elemento
**<configuration>.**
  
Entitiy Framework ahora es desarrollado bajo licencia open source así que ya no forma parte 
del .NET Framework. A partir de Entity Framework 6 debemos registrar a los proveedores que 
utilizará nuestra aplicación. En este caso, el proveedor Microsoft SQL Server.
  
La manera más fácil de realizar este registro es a través de un paquete NuGet.
  
5. Selecciona la opción Manage **NuGet Packages…** del menú contextual del proyecto WFTest.
  
![Add Nuget EntityFramework 6](https://user-images.githubusercontent.com/45072377/145109063-91309eed-a1c1-4fc5-9e2d-d2e1499d4818.png)
  
6. En la pantalla NuGet haz clic en la pestaña **Browse** e ingresa **Entitiy Framework** en la caja de 
texto para buscarlo.
7. En la lista de resultados, haz clic en **EntitiyFramework** y posteriormente en el botón **Install.**
  
![image](https://user-images.githubusercontent.com/45072377/145109509-7dde8e60-916a-4978-9500-09a96f617bcc.png)

8. Acepta los cambios y acuerdo de licencia cuando te sea requerido.
9. Establece la aplicación de WFTest como proyecto de inicio dando clic derecho sobre el 
proyecto y seleccionando la opción **Set as Startup Project** del menú contextual.  
  





