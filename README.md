# PokeApp

## Descripción
PokeApp es una aplicación móvil desarrollada en Flutter que permite a los usuarios explorar y visualizar información detallada sobre diferentes Pokémons utilizando la PokeAPI. 

## Credenciales para realizar el login
- **Usuario**: eficacia
- **Contraseña**: 123456

## Características
- **Splash**: Visualización de video con espera de 3 segundos.
- **Pantalla de inicio**: Implementación de una pantalla de bienvenida.
- **Página de inicio de sesión**: Creación de una página de inicio de sesión.
- **Página de lista**: Visualización de una lista de Pokémons.
- **Página de detalles del Pokémon**: Visualización de detalles específicos de un Pokémon seleccionado.
- **Navegación**: Implementación de navegación desde la página de lista a la página de detalles del Pokémon.
- **Testing**: Pruebas unitarias e integrales de diferentes componentes y servicios de la aplicación.

## Información de versiones

```bash
Flutter 3.16.5

Dart 3.2.3
```
## Instalación
Sigue estos pasos para configurar y ejecutar el proyecto en tu entorno local:

1. **Clona el repositorio**:
   ```bash
   git clone https://github.com/cafoga98/pokeApp.git
   cd pokeApp
   ```

2. **Instala las dependencias**:
   ```bash
   flutter pub get
   ```

3. **Genera los archivos necesarios**:
   Ejecuta el siguiente comando para generar los archivos necesarios para la aplicación:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Ejecuta la aplicación**:
   ```bash
   flutter run
   ```

## Estructura del Proyecto
La estructura del proyecto está organizada de la siguiente manera:

```
lib/
├── core/
│   ├── data/
│   ├── di/
│   ├── presentation/
│   └── shared/
├── features/
│   └── login/
│       ├── domain/
│       ├── presentation/
│   └── pokemon_list/
│       ├── domain/
│       ├── presentation/
│       └── data/
├── l10n/
├── generated/
├── main.dart
└── main_intermediary.dart
```

## Pruebas
El proyecto incluye pruebas unitarias e integrales para asegurar la calidad del código y la funcionalidad de la aplicación. Las pruebas cubren diferentes aspectos como la configuración de la API, los servicios de Pokémon y el bloc de Pokémon.

Para ejecutar las pruebas, utiliza el siguiente comando:
```bash
flutter test
```

## Documentación y Pull Requests
Para obtener información detallada sobre el proceso de desarrollo de la aplicación, consulta los previews de cada pull request realizado:

- **Features/feature 1**: [Implementación de splash screen](https://github.com/cafoga98/pokeApp/pull/7)
- **Features/feature 2**: [Creación de la página de inicio de sesión](https://github.com/cafoga98/pokeApp/pull/8)
- **Features/feature 4**: [Creación de la página de lista para mostrar Pokémons](https://github.com/cafoga98/pokeApp/pull/9)
- **Integración de DevFabrica hacia main**: [Integración](https://github.com/cafoga98/pokeApp/pull/10)
- **Features/feature 6**: [Creación de la página de detalles del Pokémon](https://github.com/cafoga98/pokeApp/pull/11)
- **Features/feateure 5**: [Implementación de la navegación desde la página de lista a la página de detalles del Pokémon](https://github.com/cafoga98/pokeApp/pull/12)
- **DevFabrica**: [Integración](https://github.com/cafoga98/pokeApp/pull/13)
- **Testing/14**: [Pruebas de integración](https://github.com/cafoga98/pokeApp/pull/15)
- **Testing/16**: [Pruebas de ApiConfig](https://github.com/cafoga98/pokeApp/pull/17)
- **Testing/18**: [Pruebas de servicios de Pokémon](https://github.com/cafoga98/pokeApp/pull/19)
- **Test branch to DevFabrica**: [Integración](https://github.com/cafoga98/pokeApp/pull/20)
- **DevFabrica to main branch**: [Integración](https://github.com/cafoga98/pokeApp/pull/21)

## Contribución
Si deseas contribuir al proyecto, sigue estos pasos:

1. **Fork** el repositorio.
2. **Clona** tu fork.
3. Crea una nueva rama:
   ```bash
   git checkout -b feature/nueva-feature
   ```
4. Realiza tus cambios y haz commits descriptivos.
5. Empuja tus cambios a tu fork:
   ```bash
   git push origin feature/nueva-feature
   ```
6. Abre un pull request en el repositorio original.

## Licencia
Este proyecto está licenciado bajo la [MIT License](LICENSE).

---

¡Gracias por contribuir a PokeApp!
