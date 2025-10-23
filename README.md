# 🍽️ Sistema de Reservas de Restaurante

Sistema web de gestión de reservas para restaurantes desarrollado con Ruby on Rails 8. Permite a los clientes realizar reservas de mesas de forma intuitiva y eficiente, con gestión en tiempo real de la disponibilidad de mesas.

## 📋 Descripción

Esta aplicación web permite gestionar el sistema de reservas de un restaurante, facilitando:
- Visualización de mesas disponibles con su capacidad
- Realización de reservas indicando nombre, número de comensales y hora
- Gestión del estado de las mesas (disponible/reservada)
- Liberación de mesas después del servicio
- Interfaz moderna y responsive con Tailwind CSS

## 🚀 Tecnologías Utilizadas

- **Ruby** 3.3.0
- **Ruby on Rails** 8.0.2
- **SQLite3** - Base de datos
- **Tailwind CSS** - Framework CSS para diseño moderno
- **Hotwire** (Turbo & Stimulus) - Para interactividad sin JavaScript complejo
- **Puma** - Servidor web
- **Docker** - Containerización (opcional)

### Gemas destacadas:
- `turbo-rails` - Navegación SPA sin escribir JavaScript
- `stimulus-rails` - Framework JavaScript minimalista
- `solid_cache`, `solid_queue`, `solid_cable` - Stack moderno de Rails 8
- `brakeman` - Análisis de seguridad
- `rubocop` - Linter de código Ruby

## 📦 Requisitos Previos

Antes de comenzar, asegúrate de tener instalado:

- Ruby 3.3.0
- Rails 8.0.2 o superior
- SQLite3
- Node.js (para asset pipeline)
- Git

## 🔧 Instalación

Sigue estos pasos para configurar el proyecto en tu máquina local:

### 1. Clonar el repositorio

```bash
git clone https://github.com/fmatiasb01/reserva_restaurantes.git
cd reserva_restaurantes
```

### 2. Instalar dependencias

```bash
bundle install
```

### 3. Configurar la base de datos

```bash
# Crear la base de datos
rails db:create

# Ejecutar las migraciones
rails db:migrate

# (Opcional) Cargar datos de ejemplo
rails db:seed
```

### 4. Compilar assets de Tailwind CSS

```bash
rails tailwindcss:build
```

## ▶️ Ejecución

### Modo desarrollo

Para iniciar el servidor en modo desarrollo:

```bash
# Opción 1: Usando el script de desarrollo (incluye Tailwind en modo watch)
bin/dev

# Opción 2: Solo el servidor Rails
rails server
```

La aplicación estará disponible en `http://localhost:3000`

### Usando Docker

Si prefieres usar Docker:

```bash
# Construir la imagen
docker build -t reserva_restaurantes .

# Ejecutar el contenedor
docker run -p 3000:3000 reserva_restaurantes
```

## 🎯 Uso de la Aplicación

### Flujo de trabajo típico:

1. **Página principal** (`/`): Formulario para crear una nueva reserva
   - Selecciona una mesa disponible del listado
   - Ingresa el nombre del cliente
   - Especifica el número de comensales
   - Define la hora de la reserva

2. **Confirmación** (`/reservations/:id`): Visualiza los detalles de la reserva creada
   - Información del cliente
   - Mesa asignada
   - Hora de la reserva
   - Número de comensales

3. **Gestión de mesas** (`/tables`): Visualiza todas las mesas del restaurante
   - Estado actual (disponible/reservada)
   - Capacidad de cada mesa
   - Opción para liberar mesas ocupadas

## 🗂️ Estructura del Proyecto

```
reserva_restaurantes/
├── app/
│   ├── controllers/        # Controladores de la aplicación
│   │   ├── reservations_controller.rb
│   │   └── tables_controller.rb
│   ├── models/            # Modelos de datos
│   │   ├── reservation.rb
│   │   └── table.rb
│   └── views/             # Vistas ERB
│       ├── reservations/
│       └── tables/
├── config/                # Configuración de Rails
├── db/                    # Base de datos y migraciones
│   ├── migrate/
│   └── schema.rb
├── test/                  # Tests
└── public/               # Archivos estáticos
```

## 🧪 Testing

Ejecutar los tests:

```bash
# Todos los tests
rails test

# Tests específicos
rails test test/models/
rails test test/controllers/
```

## 🔒 Seguridad

El proyecto incluye:
- Análisis de seguridad con Brakeman: `bin/brakeman`
- Validaciones en modelos para prevenir datos inválidos
- Content Security Policy configurada
- Protección CSRF habilitada por defecto en Rails

## 📊 Modelos de Datos

### Table (Mesa)
- `name`: Nombre/identificador de la mesa
- `capacity`: Capacidad de comensales
- `timestamps`: Creación y actualización

### Reservation (Reserva)
- `table_id`: Referencia a la mesa
- `name`: Nombre del cliente
- `people_count`: Número de comensales
- `reservation_time`: Hora de la reserva
- `timestamps`: Creación y actualización

## 🚢 Deployment

El proyecto incluye configuración para deployment con:
- **Kamal**: Para deploy en cualquier servidor con Docker
- **Thruster**: Para optimización de assets y HTTP caching

```bash
# Deploy con Kamal
kamal deploy
```

## 🛠️ Desarrollo

### Linting y Code Quality

```bash
# RuboCop (linter de Ruby)
bin/rubocop

# Brakeman (análisis de seguridad)
bin/brakeman
```

### Compilar CSS en modo watch

```bash
rails tailwindcss:watch
```

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📝 Licencia

Este proyecto es parte de un portafolio personal y está disponible como código abierto.

## 👤 Autor

**Facundo Matias Bertoldo**
- GitHub: [@fmatiasb01](https://github.com/fmatiasb01)
- Email: fmatiasb01@uda.edu.ar

---

⭐️ Si este proyecto te fue útil, no olvides darle una estrella en GitHub!
