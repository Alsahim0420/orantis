# Archivos de Audio para Oraciones

Esta carpeta contiene los archivos de audio para las oraciones de la Coronilla.

## Estructura de archivos recomendada:

```
assets/audio/
├── senal_cruz.mp3
├── padre_nuestro.mp3
├── ave_maria.mp3
├── credo.mp3
├── gloria.mp3
├── oracion_final.mp3
└── decena_1.mp3
    decena_2.mp3
    decena_3.mp3
    decena_4.mp3
    decena_5.mp3
```

## Formato de archivos:
- Formato: MP3 (recomendado) o WAV
- Calidad: 128kbps o superior
- Duración: Según la duración de cada oración

## Cómo agregar nuevos archivos:
1. Coloca el archivo de audio en esta carpeta
2. Asegúrate de que el nombre del archivo coincida con el que se usa en el código
3. Ejecuta `flutter pub get` para actualizar los assets

## Nota:
Los archivos de audio deben ser de buena calidad y tener una duración apropiada para cada oración. Es recomendable que sean narrados por una voz clara y pausada para facilitar el seguimiento de la oración. 