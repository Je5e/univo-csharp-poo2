# Creando la capa de entidades

Como podemos darnos cuenta, en nuestro modelo creado en nuestra capa DAL, tenemos tanto el 
Contexto como las *Entidades* en el mismo proyecto. El siguiente paso por realizar es separar las 
entidades del contexto para crear nuestra capa de Entidades. Es aquí donde surge la pregunta que 
muchos desarrolladores que utilizan **Entity Framework** se plantean ¿Cómo separo las Entidades del 
Contexto?

Existen varias alternativas para separar el contexto de las entidades, algunas implican modificar el 
archivo de proyecto, agregar o modificar plantillas de texto T4 o utilizar el generador de contexto. 
Mostremos la solución modificando la plantilla T4 que genera las entidades.

1. Agrega un nuevo proyecto a la solución de tipo **Class Library (.NET Standard)** con el nombre Entities.

![New project](https://user-images.githubusercontent.com/45072377/143662667-3938ddcb-999e-4136-a405-c50b5f080784.png)

![Add name to project](https://user-images.githubusercontent.com/45072377/143662684-dd57417c-939d-471e-bfdf-1e0730191733.png)

Al trabajar con una biblioteca *.NET Standard* podremos reutilizar nuestras entidades en otras 
plataformas como por ejemplo en una aplicación **Xamarin** para dispositivos Android o iOS.

En la ventana de Información Adicional selecciona el target framework **.NET Standard 2.0** y haz clic en el botón **crear.**

![Target framework](https://user-images.githubusercontent.com/45072377/143662794-105dfda8-e837-4528-a8fb-05d483c86900.png)

2. Borra el archivo **Class1.cs** que se genera automáticamente.
3. Abre la plantilla **NWindDBModel.tt** en el proyecto DAL dando clic sobre el archivo. Esta plantilla tiene el código que genera las entidades.
4. Modifica la ruta donde genera las clases que representan las entidades.

![modeltt](https://user-images.githubusercontent.com/45072377/143668153-6e3e8db9-93bd-4d29-bfbb-92b5737368a2.png)

5. Selecciona el archivo **NWindDBModel.tt** y presiona la tecla **F4** para abrir la ventana de propiedades.
6. Modifica la propiedad **Custom Tool NameSpace** de la plantilla **NWindDBModel.tt** con el valor **Entities,** para indicar el espacio de nombres de las entidades a generar.

![Custom namespace](https://user-images.githubusercontent.com/45072377/143668221-7a51435f-e80e-46b1-8437-f4e0204cb058.png)

7. Guarda los cambios del archivo y espera a que se creen las clases. Observa que las clases **Category y Product** se han creado en el proyecto **Entities.**

![CategoryAndProducts](https://user-images.githubusercontent.com/45072377/143668275-77e92f9a-e401-4f0a-8d22-64ff02c594c4.png)

8. Compila la solución.

![Error](https://user-images.githubusercontent.com/45072377/143668294-92b056d9-ae9c-4cf9-bd04-62e5fdda3300.png)

El contexto en el proyecto DAL busca las entidades en su mismo espacio de nombres DAL, por lo que ahora muestra un error al no encontrar los tipos entidad.

Tenemos que modificar las propiedades de la plantilla **NWindDBModel.Context.tt** para que se genere el contexto en el mismo espacio de nombres de las entidades.

9. Abre la ventana de propiedades del archivo **NWindDBModel.Context.tt.**
10. Establece el espacio de nombres **Entities** en la propiedad **Custom Tool Namespace.**

![Custom namespace](https://user-images.githubusercontent.com/45072377/143668347-eb42450a-97aa-4dbe-808e-06016da48fb9.png)

La capa DAL necesita una referencia a la capa **Entities** para poder hacer uso de las entidades.

11. Selecciona la opción **Add Reference** del menú contextual del nodo **References** del proyecto DAL.
12. Selecciona el proyecto **Entities** y haz clic en el botón **OK.**
13. Selecciona el archivo **Category.cs** de la DAL.

![Category](https://user-images.githubusercontent.com/45072377/143668441-89ab3407-40a5-4788-ba36-89c7faa42aa8.png)

14. Presiona **F4** para abrir la ventana de propiedades.
15. Establece el valor **None** a la propiedad **Build Action.**

![none Compile](https://user-images.githubusercontent.com/45072377/143668489-18e61fcd-871f-49fa-939f-f277440cb501.png)

16. Repite los pasos anteriores para establecer **None** a la propiedad **Build Action** del archivo **Product.cs.**
17. Verifica que la aplicación compile correctamente ahora.













