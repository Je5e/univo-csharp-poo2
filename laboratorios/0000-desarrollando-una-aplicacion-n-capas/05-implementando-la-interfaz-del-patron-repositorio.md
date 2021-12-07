# Implementando la interface del patrón Repositorio
Ya que hemos definido la Interface del patrón Repositorio, vamos a crear la clase que implementará 
los métodos declarados en esta interface. Esta implementación estará diseñada para obtener los datos 
de un contexto **Entity Framework.** Como buena práctica, lo recomendable seria implementar esta 
clase en su propio Assembly para poder reutilizarlo en otros proyectos que requieran un repositorio 
que trabaje con contextos **Entity Framework.** Por simplicidad, nosotros implementaremos la interface 
en nuestro proyecto DAL.
1. Agrega una clase con el nombre de **EFRepository** al proyecto **DAL.**


![Add EFRepository class](https://user-images.githubusercontent.com/45072377/145080504-b53c530a-587f-40f4-9797-c235bf2d30ad.png)

2. En esta clase, implementaremos la interface realizada en el ejercicio anterior. Modifica el 
código de la siguiente manera.
```c#
 public class EFRepository : IRepository
 {

 }
```
3. Agrega el siguiente código a la clase, donde se define el contexto que utilizará el repositorio.

```c#
        DbContext Context;
        // Recibamos una instancia del contexto al crear la clase.
        public EFRepository(DbContext context)
        {
            this.Context = context;
        }
```
4. Agrega el siguiente código para importar los espacios de nombres donde se encuentra la clase 
**DbContext** y la clase **Expression.**
```c#
using System.Data.Entity;
using System.Linq.Expressions;
```
5. Agrega el siguiente código a la clase **EFRepository** para implementar los miembros de la 
Interface.

```c#
 public TEntity Create<TEntity>(TEntity toCreate) where TEntity : class
        {
            TEntity Result = default(TEntity);
            try
            {
                Context.Set<TEntity>().Add(toCreate);
                Context.SaveChanges();
                Result = toCreate;
            }
            catch { }
            return Result;
        }
        public bool Delete<TEntity>(TEntity toDelete) where TEntity : class
        {
            bool Result = false;
            try
            {
                Context.Entry<TEntity>(toDelete).State = EntityState.Deleted;
                Result = Context.SaveChanges() > 0;
            }
            catch { }
            return Result;
        }
        public bool Update<TEntity>(TEntity toUpdate) where TEntity : class
        {
            bool Result = false;
            try
            {
                Context.Entry<TEntity>(toUpdate).State =
                EntityState.Modified;
                Result = Context.SaveChanges() > 0;
            }
            catch { }
            return Result;
        }
        public TEntity Retrieve<TEntity>
       (Expression<Func<TEntity, bool>> criteria) where TEntity : class
        {
            TEntity Result = null;
            try
            {
                Result = Context.Set<TEntity>().FirstOrDefault(criteria);
            }
            catch { }
            return Result;
        }
        public List<TEntity> Filter<TEntity>
       (Expression<Func<TEntity, bool>> criteria) where TEntity : class
        {
            List<TEntity> Result = null;
            try
            {
                return Context.Set<TEntity>().Where(criteria).ToList();
            }
            catch { }
            return Result;
        }
        public void Dispose()
        {
            if (Context != null)
            {
                Context.Dispose();
            }
        }
```
6. Agrega una nueva clase al proyecto *DAL* con el nombre **RepositoryFactory.** Esta clase será la 
que expondremos a la lógica de negocio. La función de esta clase será la de crear un repositorio 
especifico de la fuente de datos a utilizar. Por ejemplo, esta clase decidiría utilizar un 
repositorio *Entity Framework* o alguna otra implementación del repositorio.

![RepositoryFactory](https://user-images.githubusercontent.com/45072377/145083785-b25e1269-6877-4d23-b2c8-0d8bd6364b2b.png)

7. Agrega el siguiente código a la clase para pasar el contexto al Repositorio.

```c#
public class RepositoryFactory
    {
        public static IRepository CreateRepository()
        {
            return new EFRepository(new Entities.NWindEntities());
        }
    }

```

En este ejercicio, implementamos la lógica de acceso a datos para realizar operaciones CRUD utilizando 
el patrón Repositorio.



