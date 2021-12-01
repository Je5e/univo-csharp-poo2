# Definiendo la interface del patrón Repositorio
La capa de lógica de negocios utiliza a la capa de acceso a datos para recuperar la información que 
necesita. La capa de lógica de negocios debe ser ignorante del tipo de datos que existe en la capa de 
origen de datos. Por ejemplo, la capa de datos puede ser una base de datos, una lista de SharePoint o 
un servicio Web.

Podemos utilizar el patrón Repositorio para separar la lógica de negocios de la lógica que utiliza la capa 
de acceso a datos para recuperar los datos y mapearlos a las entidades del modelo.


Para obtener más información sobre el patrón Repositorio puedes consultar el 
siguiente enlace:
The Repository Pattern
https://msdn.microsoft.com/en-us/library/ff649690.aspx

En pocas palabras, un repositorio es un mediador entre el dominio de la aplicación y los datos que le 
dan persistencia. Con este planteamiento podemos pensar que el cliente de este repositorio no 
necesitaría conocer la tecnología utilizada para acceder a los datos, sino que le bastará con saber cuáles 
son las operaciones que le facilita este “mediador”, esto es, el repositorio.

Implementaremos de forma sencilla el patrón Repositorio en nuestra capa de acceso a datos para 
implementar la recuperación de datos.

Siguiendo las recomendaciones del patrón Repositorio, definamos una interface con las operaciones 
básicas que utilizaremos para realizar las operaciones CRUD sobe la fuente de datos.
1. Agrega un nuevo elemento de tipo **Interface** al proyecto DAL con el nombre de **IRepository.**

![Add IRepository](https://user-images.githubusercontent.com/45072377/144181342-d2ba674e-604b-4db3-b1c6-8746f059be2f.png)

Nuestra solución debe lucir de la siguiente manera:

![Solution Explorer with IRepository](https://user-images.githubusercontent.com/45072377/144181774-4f6d75b2-e544-41cc-a647-d1960a989a39.png)

2. Modifica el código de la interface de la siguiente manera.

```c#
public interface IRepository: IDisposable
{
}
```
La interface implementará la interface *IDisposable* para poder liberar al contexto de datos.



