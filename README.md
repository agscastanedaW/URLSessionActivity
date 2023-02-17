# URLSession Sample

## Descripción

Este proyect está basado en el playground [DIP-Final](https://github.com/VictorUrielP/SOLID-Samples/tree/main/5.%20DIP/DIP-Final.playground) del repositorio [Solid-Samples](https://github.com/VictorUrielP/SOLID-Samples)

La intención de este proyecto es:

- Conocer URLSession y su implementación con diferentes herramientas.

- Usar las mejores prácticas de codificación y decodificación de datos JSON.

- Mostrar las mejores prácticas de manejo de errores de API.

## Actividades

### 1. Mejora la implementación de Networking actual:

1. Crear un protocolo `Endpoint` que defina las características genéricas de un endpoint como su host, path, queries, etc. 

1. Crea una extensión de `Endpoint` con una función `url() throws -> URL`.

1. Crea una extensión de `Endpoint` con una función `urlRequest() throws -> URLRequest`.

1. Elimina el protocolo `URLRequestFactory` y sus implementaciones `DogsURLRequestFactory` y `CatsURLRequestFactory`.

1. Modifica la función de `URLSessionFetcher` para recibir un `Endpoint` como parte de sus parámetros.

### 2. Maneja los errores de la capa de `Networking`:

1. Crea una enumeración para manejar los siguientes errores del cliente:

    * Error al de URL inválida en tus endpoints. 
    * Error al decodificar los datos de una respuesta.
    * Error de autenticación 401.
 
1. Crea una enumeración para manejar los siguientes errores del servidor:

    * Error interno del servidor 500.

NOTA: Define los mensajes de error de todos estos casos en inglés.

### 3. Integra la API de Cats en CatsViewController:

1. Declara la URL del servidor: https://baz-example.free.beeceptor.com.

1. Crea una implementación de `Endpoint` para obtener una lista de gatitos desde: `/v2/cats`

1. Reemplaza el `LocalFileFetcher` en `CatsUIComposer` por un `URLSessionFetcher` con tu nuevo request al `Endpoint` de cats.

### 4. Integra la API de dogs en DogsViewController:

1. Crea una implementación de `Endpoint` para consumir una lista de perritos: `/v2/dogs`

1. El DogsService requiere la implementación de `async/await` para funcionar, por lo tanto:

    1. Crea un nuevo protocolo `AsyncFetcher` que maneje requests con `async/await`.
    1. Crea una extensión de `URLSessionFetcher` que conforme con `AsyncFetcher`.
    1. Inyecta tu fetcher en `DogsService` y reemplaza la data mock en el método por una llamada a fecther.

### 5. Crea mensajes de error personalizados para el usuario:

1. Crea una capa intermedia de manejo de errores, para evitar que los errores con mensajes en inglés que se definieron en la capa de red sean visibles para el usuario final. Los mensajes de error deberían ser amigables para el usuario.

1. Crea una enumeración llamada `DogsErrors` con los siguientes errores personalizados:
    * Cuando el array de perritos está vacío: “No encontramos perritos en este momento.”
    * Cuando el servidor responde 500: “El servidor de perritos está fuera de servicio. Inténtalo más tarde.”
    * En otro caso: “Ocurrió un error desconocido mientras buscábamos perritos :(”
				
1. Crea una enumeración llamada `CatsErrors` con los siguientes errores personalizados:
    * Cuando el array de gatitos está vacío: “No encontramos gatitos en este momento.”
    * Cuando el servidor responde 500: “El servidor de gatitos está fuera de servicio. Inténtalo más tarde.”
    * En otro caso: “Ocurrió un error desconocido mientras buscábamos gatitos :(”

1. Crea un adaptador para transformar los errores de la capa de red en este tipo de errores específicos. No olvides que puedes implementar el protocolo `LocalizedError` para proveer mensajes personalizados en el `localizedDescription` del error.

## Endpoints

```
GET /v2/dogs
Mock status as 200
```
```
GET /v2/cats
Mock status as 200
```

## Endpoints vacíos y de error

Declara implementaciones de los siguientes endpoints para simular llamadas vacías o con error del servidor y reemplázalas temporalmente donde sea necesarios para simular errores en tus `UIViewControllers`.

Puedes usar los siguientes endpoints para simular las respuestas vacías del servidor:

```
GET /v2/cats/empty
Mock status as 200
```
```
GET /v2/dogs/empty
Mock status as 200
```

Puedes usar los siguientes endpoints para simular respuestas de error del servidor:

```
GET /v2/cats/error
Mock status as 500
```
```
GET /v2/dogs/error
Mock status as 500
```

## Conclusiones

* Los cambios en la capa de Networking no deberían obligarte a modificar tus vistas.
* Puedes extender la funcionalidad de tus clases de Networking para atender las necesidades específicas de tus vistas, como en el caso de `async/await`.
* Tanto los datos de las vistas como sus mensajes de error, pueden desarrollarse incluso si los endpoints aún no están listos.
* Todos estos beneficios los obtuvimos gracias la aplicación de los principios SOLID.
