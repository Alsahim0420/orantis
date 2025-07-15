# Capa de Dominio

Esta carpeta contiene las entidades y casos de uso de la aplicación Orantis.

## Estructura

- `entities/` - Entidades del dominio (modelos de datos)
- `usecases/` - Casos de uso (lógica de negocio)

## Entidades

Las entidades representan los conceptos principales de la aplicación:

- `Oracion` - Representa una oración individual
- `Misterio` - Representa un misterio del Rosario
- `Coronilla` - Representa la estructura de la Coronilla

## Casos de Uso

Los casos de uso implementan la lógica de negocio:

- `GetRosarioUseCase` - Obtiene el Rosario completo
- `GetCoronillaUseCase` - Obtiene la Coronilla completa
- `GetMisteriosUseCase` - Obtiene los misterios del día 