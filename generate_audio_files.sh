#!/bin/bash

# Script para generar archivos de audio sintetizados para las oraciones
# Estos archivos son para pruebas - en producción deberías usar archivos de audio reales

echo "🎵 Generando archivos de audio para las oraciones..."

# Crear la carpeta de audio si no existe
mkdir -p assets/audio

# Función para generar un archivo de audio sintetizado
generate_audio() {
    local filename=$1
    local duration=$2
    local frequency=$3
    
    echo "Generando $filename (${duration}s)..."
    
    # Generar un tono sinusoidal con ffmpeg
    ffmpeg -f lavfi -i "sine=frequency=$frequency:duration=$duration" \
           -acodec libmp3lame -ab 128k \
           "assets/audio/$filename" \
           -y -loglevel error
    
    if [ $? -eq 0 ]; then
        echo "✅ $filename generado exitosamente"
    else
        echo "❌ Error generando $filename"
    fi
}

# Generar archivos de audio con diferentes duraciones y frecuencias
# para simular diferentes oraciones

# Señal de la Cruz (corta)
generate_audio "senal_cruz.mp3" 3 440

# Credo (más larga)
generate_audio "credo.mp3" 15 523

# Padre Nuestro (media)
generate_audio "padre_nuestro.mp3" 12 494

# Ave María (corta, se repite)
generate_audio "ave_maria.mp3" 8 587

# Gloria (media)
generate_audio "gloria.mp3" 10 659

# Oración Final (larga)
generate_audio "oracion_final.mp3" 20 440

# Decenas (diferentes duraciones)
generate_audio "decena_1.mp3" 25 523
generate_audio "decena_2.mp3" 25 494
generate_audio "decena_3.mp3" 25 587
generate_audio "decena_4.mp3" 25 659
generate_audio "decena_5.mp3" 25 440

# Archivos genéricos
generate_audio "decena_generica.mp3" 20 523
generate_audio "oracion_generica.mp3" 15 494

echo ""
echo "🎉 ¡Archivos de audio generados exitosamente!"
echo ""
echo "📁 Archivos creados en assets/audio/:"
ls -la assets/audio/*.mp3
echo ""
echo "🔧 Para usar estos archivos:"
echo "1. Ejecuta 'flutter pub get'"
echo "2. Reinicia la aplicación"
echo "3. Ve a la página de rezar la Coronilla"
echo "4. Los controles de audio ahora deberían funcionar"
echo ""
echo "⚠️  Nota: Estos son archivos de prueba con tonos sintetizados."
echo "   Para producción, reemplázalos con archivos de audio reales de las oraciones." 