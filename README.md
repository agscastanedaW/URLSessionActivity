# URLSession Activity

## Descripción

Este proyect está basado en el playground [DIP-Final](https://github.com/VictorUrielP/SOLID-Samples/tree/main/5.%20DIP/DIP-Final.playground) del repositorio [Solid-Samples](https://github.com/VictorUrielP/SOLID-Samples)

La intención de este proyecto es:

- Conocer URLSession y su implementación con diferentes herramientas.

- Usar las mejores prácticas de codificación y decodificación de datos JSON.

- Mostrar las mejores prácticas de manejo de errores de API.

## Actividades

### 1. Define tipos de errores para la capa de Networking:

1. Crea una enumeración para manejar los siguientes errores del cliente:

    * Error al de URL inválida en tus endpoints. 
    * Error al decodificar los datos de una respuesta.
 
1. Crea una enumeración para manejar los siguientes errores del servidor:

    * Error interno del servidor 500.
    * Error de datos no encontrados.
    
1. Elimina la estructura `DataNotFoundError` y reemplázala por el caso correspondiente de `NetworkingServerErrors`.

NOTA: Define los mensajes de error de todos estos casos en inglés usando `LocalizedError`.

### 2. Mejora la implementación de Networking actual:

1. Crea un protocolo `Endpoint` que defina las características genéricas de un endpoint como su path, queries y url base.

1. Modifica `URLRequestFactory` renombrando su función actual por: `func make() throws -> URLRequest`

1. Utiliza herencia de protocolos para que `Endpoint` herede de `URLRequestFactory`.

1. Crea una extensión de `Endpoint` y escribe una implementación default para la función heredada de `URLRequestFactory`. Utiliza el error correspondiente de `NetworkingClientErrors` en caso de no poder obtener una `URL` válida.

1. Actualiza `URLSessionFetcher` para usar la nueva abstracción de `URLRequestFactory` y manejar sus errores.

1. Elimina `DogsURLRequestFactory` y `CatsURLRequestFactory`.

### 3. Integra la API de Cats en CatsViewController:

1. Declara la URL base del servidor: `let animalsAPIBaseURL = URL(string: "https://baz-example.free.beeceptor.com")!`.

1. Crea una implementación de `Endpoint` para obtener una lista de gatitos desde: `/v2/cats`

1. Reemplaza el `LocalFileFetcher` en `CatsUIComposer` por un `URLSessionFetcher` con tu nuevo request al `Endpoint` de cats.

1. Arregla el threading utilizando el patron `Decorator` para crear un `MainThreadFetcherDecorator`.

### 4. Integra la API de dogs en DogsViewController:

1. Crea una implementación de `Endpoint` para consumir una lista de perritos: `/v2/dogs`

1. El DogsService requiere la implementación de `async/await` para funcionar, por lo tanto:

    1. Crea un nuevo protocolo `AsyncFetcher` que maneje requests con `async/await. Copia la función declarada en `Fetcher` y utiliza la función `Refactor / Convert Function to Async` de `Xcode` para ayudarte a crear la función con `async/await`.
    1. Crea una extension de `URLSessionFetcher` que conforme con `AsyncFetcher` y crea un wrapper de `async/await`. Utiliza la función `Refactor / Add Async Wrapper` de Xcode para ayudarte a crear la función de `async/await`.

1. Inyecta un `AsyncFetcher` en `DogsService` y reemplaza la data mock en el método por una llamada a fetcher.

1. Agrega `keyDecodingStrategy` al modelo `Dog` para renombrar las propiedades de: `snake_case` a: `lowerCammelCase`.

NOTA: En esta implementación no fue necesario crear un `Decorator` para manejar la ejecución en el Main Queue, ¿por qué?

### 5. Crea mensajes de error personalizados para el usuario:

1. Modifica la clase `URLSessionFetcher` para manejar los errores de respuesta del servidor.

1. Maneja los errores en `CatsServiceImp` y en `DogsServiceImp`, para evitar que los errores que se definieron en la capa de red sean visibles para el usuario final. No olvides que puedes implementar el protocolo `LocalizedError` para proveer mensajes personalizados en el `localizedDescription` del error.

1. Crea una enumeración llamada `DogsErrors` con los siguientes errores personalizados:
    * Cuando el array de perritos está vacío: “No encontramos perritos en este momento.”
    * Cuando el servidor responde 500: “El servidor de perritos está fuera de servicio. Inténtalo más tarde.”
    * En otro caso: “Ocurrió un error desconocido mientras buscábamos perritos :(”
				
1. Crea una enumeración llamada `CatsErrors` con los siguientes errores personalizados:
    * Cuando el array de gatitos está vacío: “No encontramos gatitos en este momento.”
    * Cuando el servidor responde 500: “El servidor de gatitos está fuera de servicio. Inténtalo más tarde.”
    * En otro caso: “Ocurrió un error desconocido mientras buscábamos gatitos :(”

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
* El threading también es una responsabilidad que regularmente delegamos a las vistas. Al usar el patrón Decorator podemos delegar esta responsabilidad.
* Usando `async/await` facilita mucho programar código asíncrono. La respuesta al por qué no es necesario manejar los updates en el main queue la puedes encontrar aquí: [Using the MainActor attribute to automatically dispatch UI updates on the main queue](https://www.swiftbysundell.com/articles/the-main-actor-attribute/)
* Probar todos estos cambios requiere que compilemos la aplicación y hagamos llamadas realeas a las APIs.
