# Guía para Jules

Este archivo documenta las instrucciones clave para el proyecto de Habilidades ("Skills") con el objetivo de asegurar consistencia, escalabilidad y un flujo de trabajo fluido en futuras tareas.

## Environment Setup (Script de Inicialización)

Si necesitas arrancar una nueva máquina virtual, ejecuta el siguiente script desde la raíz del proyecto para instalar las dependencias del sistema requeridas (`ffmpeg`, `libsndfile1`, `portaudio` y `graphviz`):

```bash
./setup-env.sh
```

El script también configurará utilidades como `pnpm` y `yarn` globalmente usando `npm`. Actualmente, el proyecto no utiliza un archivo global de dependencias como `package.json` o `requirements.txt` en la raíz. Las dependencias locales, cuando existan, se manejan carpeta por carpeta.

## Estructura del Código

Este repositorio está organizado por **habilidades ("skills")**, contenidas en directorios separados (ej., `brainstorming`, `copywriting`, `writing-skills`, etc.).

Cada directorio de habilidad puede contener:
- Archivos `.md` (como `SKILL.md`) que describen el flujo de la tarea.
- Un directorio `scripts/` o archivos `.js`/`.sh` en la raíz de la habilidad que implementan las acciones de la misma.

## Scripts y Herramientas

### Generación de Diagramas

Los archivos `SKILL.md` suelen incluir bloques ````dot```. Existe una herramienta global `render-graphs.js` (ubicada en `writing-skills/`) que extrae esos bloques para generar archivos SVG o crear un gráfico combinado.

**Ejemplo de uso:**
```bash
./writing-skills/render-graphs.js brainstorming
```
Para combinar varios gráficos en uno solo:
```bash
./writing-skills/render-graphs.js brainstorming --combine
```
El script generará los archivos correspondientes en la carpeta `diagrams/` del directorio de destino (ej., `brainstorming/diagrams/`).

## Reglas de Estilo

- **Modularidad:** Mantén cada habilidad lo más desacoplada posible del resto del sistema.
- **Node.js/JS:** Al agregar scripts en JS, utiliza los módulos de Node que sean necesarios (como `fs`, `path`, `child_process`). El proyecto usa scripts de estilo CommonJS o shell (`.cjs`, `.sh`, `.js`).
- **Commits y PR:** Asegúrate de verificar tus cambios con los comandos adecuados antes de crear un PR y seguir los pasos de pre-commit (`pre_commit_instructions`). Todo cambio significativo debe ser verificado con un script o inspección local.
