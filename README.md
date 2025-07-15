# Orantis - Tu Compañero de Oración

Una aplicación católica desarrollada en Flutter para acompañarte en tus oraciones diarias.

## 🎯 Características

- **El Santo Rosario** - Reza el Rosario completo con todos sus misterios
- **La Coronilla** - Reza la Coronilla de la Divina Misericordia
- **Navegación fluida** - Interfaz intuitiva y fácil de usar
- **Diseño moderno** - Material 3 con colores inspirados en la fe católica

## 🏗️ Arquitectura

El proyecto está estructurado siguiendo los principios de **Clean Architecture**:

```
lib/
├── app/
│   └── router.dart          # Configuración de navegación con go_router
├── data/                    # Capa de datos
│   ├── datasources/         # Fuentes de datos (local, remoto)
│   ├── repositories/        # Implementaciones de repositorios
│   └── models/             # Modelos de datos
├── domain/                  # Capa de dominio
│   ├── entities/           # Entidades del negocio
│   └── usecases/           # Casos de uso
├── presentation/            # Capa de presentación
│   └── pages/              # Pantallas de la aplicación
│       ├── welcome_page.dart
│       ├── rosario_page.dart
│       └── coronilla_page.dart
└── main.dart               # Punto de entrada de la aplicación
```

## 🚀 Rutas Disponibles

- `/` - Página de bienvenida con opciones de oración
- `/rosario` - Página del Santo Rosario
- `/coronilla` - Página de la Coronilla

## 🛠️ Tecnologías

- **Flutter** - Framework de desarrollo
- **Material 3** - Sistema de diseño
- **go_router** - Navegación declarativa
- **Clean Architecture** - Arquitectura limpia y escalable

## 📱 Instalación

1. Clona el repositorio
2. Instala las dependencias:
   ```bash
   flutter pub get
   ```
3. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

## 🎨 Diseño

La aplicación utiliza un esquema de colores inspirado en la tradición católica:
- **Azul principal** (#1976D2) - Representa la devoción mariana
- **Material 3** - Diseño moderno y accesible
- **Iconografía católica** - Símbolos familiares para los usuarios

## 🔮 Próximas Funcionalidades

- [ ] Implementación completa del Rosario con misterios
- [ ] Funcionalidad de la Coronilla de la Divina Misericordia
- [ ] Notificaciones para recordatorios de oración
- [ ] Modo oscuro
- [ ] Personalización de oraciones
- [ ] Estadísticas de oración

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.

---

*"Orad sin cesar" - 1 Tesalonicenses 5:17*
