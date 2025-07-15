# Capa de Datos

Esta carpeta contiene las fuentes de datos y repositorios de la aplicación Orantis.

## Estructura

- `datasources/` - Fuentes de datos (local, remoto)
- `repositories/` - Implementaciones de repositorios
- `models/` - Modelos de datos para la capa de datos

## Fuentes de Datos

- `LocalDataSource` - Datos almacenados localmente
- `RemoteDataSource` - Datos obtenidos desde servidor (futuro)

## Repositorios

- `OracionRepository` - Manejo de oraciones
- `MisterioRepository` - Manejo de misterios
- `CoronillaRepository` - Manejo de coronillas

## Modelos

Los modelos de datos representan cómo se almacenan y transmiten los datos:

- `OracionModel` - Modelo de datos para oraciones
- `MisterioModel` - Modelo de datos para misterios
- `CoronillaModel` - Modelo de datos para coronillas 