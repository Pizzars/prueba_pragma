# Proyecto de Raza de Gatos

## Introducción

Esta aplicación consume una API para obtener las razas de los gatos. En cada elemento de la lista, puedes ver información detallada sobre cada raza.

## Requisitos

- Flutter 3.7.12

## Estructura de Carpetas

La estructura de carpetas de la aplicación es la siguiente:

lib
├── config
│   ├── helpers              # Contains helper files with useful functionalities
│   ├── router               # Application routing files
│   ├── theme                # Theme-related files
│   └── config.dart          # General configuration settings
├── data
│   └── preferences.dart      # User preferences management
├── domain
│   └── models               # Data models used within the app
├── presentation
│   ├── blocs
│   │   ├── data_cubit.dart   # File containing Cubit functions
│   │   └── data_state.dart    # File defining the state
│   └── screens               # User interface files or folders
├── presenters                # Presenter layer components
├── repositories              # Data repositories
└── services                  # API connection and verification files


## Instrucciones de Instalación

Para descargar el repositorio, ejecuta el siguiente comando en tu consola:

```bash
git clone https://github.com/Pizzars/prueba_pragma.git
```
Navega al directorio del proyecto:
```bash
cd prueba_pragma
```
Luego, instala las dependencias:
```bash
flutter pub get
```
Finalmente, para correr la aplicación, utiliza el siguiente comando:
```bash
flutter run
```
## Descarga de la APK

Puedes descargar la APK de la aplicación desde el siguiente enlace:

[Descargar APK](https://drive.google.com/file/d/1eZ-EbhpkgTCgVg1FTgD5DLF3aYErczKX/view?usp=sharing)

