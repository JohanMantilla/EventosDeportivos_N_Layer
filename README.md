# 📅 Calendario de Eventos Deportivos

Aplicación web desarrollada en ASP.NET (.NET Framework 2.0) que permite a los usuarios consultar eventos deportivos próximos, registrarse, autenticarse y ver detalles de eventos con capacidades de filtrado.

## 🏗️ Arquitectura

Esta aplicación sigue un patrón de **arquitectura N-Layer** con clara separación de responsabilidades:

- **Capa de Entidad** (`EntityLayer.EventosDeportivosEx1`): Modelos del dominio y utilidades
- **Capa de Acceso a Datos** (`DataAccess.EventosDeportivosEx1`): Interacciones con SQL Server  
- **Capa de Negocio** (`BusinessLayer.EventosDeportivosEx1`): Lógica de negocio
- **Capa de Presentación** (`WebAppEventosDeportivosEx1`): Interfaz web

## 🛠️ Tecnologías Utilizadas

- **Framework**: ASP.NET Web Forms (.NET Framework 2.0)
- **Base de Datos**: Microsoft SQL Server
- **Autenticación**: Forms Authentication con sesiones
- **Seguridad**: Encriptación SHA1 para contraseñas
- **Frontend**: HTML, CSS, JavaScript con Font Awesome

## 📋 Requisitos Previos

- Visual Studio 2015 o superior
- SQL Server (cualquier versión)
- .NET Framework 2.0

## 🚀 Instalación y Configuración

### 1. Configuración de Base de Datos
Ejecute el script SQL (`SQL_EventosDeportivos_JohanMantilla.sql`) para crear:

- **Base de Datos**: `BDD_EventoDeportivo_GR2`
- **Login**: `usr_eventosdeportivos_gr2` / `Politecnica1`
- **Tablas**: Deportes, Lugares, Eventos, Participantes, Usuarios
- **Vista**: `VW_EVENTOS_COMPLETO`
- **Datos de Muestra**: Eventos y usuarios de prueba

### 2. Configuración de la Aplicación
1. Abrir `SlnAppEventosDeportivos.sln` en Visual Studio
2. Verificar la cadena de conexión en `Web.config`
3. Compilar la solución
4. Ejecutar la aplicación (F5)

## ⭐ Características Principales

### 🔐 Autenticación y Autorización
- **Registro** (`SignUp.aspx`): Crear cuentas con contraseñas encriptadas
- **Login** (`Login.aspx`): Autenticación segura con sesiones
- **Control de Acceso**: Redirección automática si no está autenticado
- **Roles**: Usuarios normales y administradores

### 📊 Gestión de Eventos
- **Listado** (`EventosDeportivos.aspx`): Eventos próximos en tabla responsiva
- **Filtrado**: Por tipo de deporte
- **Detalles**: Información completa de cada evento

### 🎨 Interfaz de Usuario
- **Diseño Moderno**: Layout responsivo con animaciones
- **Tema Deportivo**: Colores y iconos temáticos
- **Mobile-Friendly**: Adaptativo para móviles

## 📁 Estructura del Proyecto

```
SlnAppEventosDeportivos/
├── EntityLayer.EventosDeportivosEx1/     # Modelos
├── DataAccess.EventosDeportivosEx1/      # Acceso a datos
├── BusinessLayer.EventosDeportivosEx1/   # Lógica de negocio
└── WebAppEventosDeportivosEx1/           # Aplicación web
    ├── Login.aspx
    ├── SignUp.aspx
    ├── EventosDeportivos.aspx
    └── Web.config
```

## 🗄️ Base de Datos

### Tablas Principales
- **TBL_USER**: Usuarios con contraseñas encriptadas
- **TBL_DEPORTE**: Categorías de deportes
- **TBL_LUGAR**: Sedes de eventos  
- **TBL_EVENTO**: Eventos deportivos
- **TBL_PARTICIPANTE**: Participantes

## 🎯 Uso

### Para Usuarios
1. **Registro**: Crear cuenta en SignUp
2. **Login**: Ingresar con credenciales
3. **Explorar**: Ver calendario de eventos
4. **Filtrar**: Por deporte específico
5. **Logout**: Cerrar sesión

## ⚙️ Configuración

### Cadena de Conexión
```xml
<add name="BDD_EventoDeportivoConnectionString" 
     connectionString="Data Source=localhost;Initial Catalog=BDD_EventoDeportivo_GR2;User ID=usr_eventosdeportivos_gr2;Password=Politecnica1"/>
```

### Autenticación
- URL de Login: `Login.aspx`
- Timeout: 20 minutos

## 🧪 Usuarios de Prueba

- **Usuario**: `normal` | **Contraseña**: `12345678` | **Rol**: Normal
- **Usuario**: `Admin` | **Contraseña**: `12345678` | **Rol**: Admin

---

*Demostración de arquitectura N-Layer, autenticación segura y diseño web moderno en ASP.NET Web Forms.*
