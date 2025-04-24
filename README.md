## 📅Calendario de Eventos Deportivos 
Aplicación web desarrollada en ASP.NET (.NET Framework 2.0) que permite a los usuarios consultar eventos deportivos próximos, registrarse, autenticarse y visualizar detalles de cada evento.

## 🧩Estructura del Proyecto 
La aplicación está estructurada en arquitectura N-Layer, con las siguientes capas:

* Entity Layer: Contiene clases como User, EventoDeportivo, y utilitarios (Constants, Hash).

* Data Access Layer: Maneja la interacción con la base de datos SQL Server.

* Business Layer: Procesa la lógica de negocio.

* WebApp: Capa de presentación con páginas como Login.aspx, SignUp.aspx, EventosDeportivos.aspx.

## 🧾Requisitos 
* ASP.NET (.NET Framework 2.0)

* SQL Server (cualquier versión)

* Visual Studio

## 🛠Instalación 
1. Ejecuta el script SQL para crear:

   * Base de datos: BDD_EventoDeportivo_GR2

   * Usuario: usr_eventosdeportivos_gr2

   * Tablas: TBL_DEPORTE, TBL_LUGAR, TBL_EVENTO, TBL_PARTICIPANTE, TBL_USER

   * Vista: VW_EVENTOS_COMPLETO

   * Datos de prueba (insertados)

2. Abre la solución en Visual Studio:

   * Asegúrate de configurar la cadena de conexión en Web.config.

3. Ejecuta el proyecto iniciando en Default.aspx.

## 🔐Funcionalidades 
* Registro de usuarios (SignUp.aspx) con contraseña encriptada (SHA1).

* Autenticación (Login.aspx) y control de acceso a EventosDeportivos.aspx.

* Listado de eventos deportivos (filtrable por tipo de deporte).

* Sesión protegida: redirección al login si no está autenticado.

* Roles de usuario (admin y normal).

* Diseño visual moderno con animaciones y estilo deportivo.

<br></br>

## 📅 Sports Events Calendar  
Web application developed in ASP.NET (.NET Framework 2.0) that allows users to view upcoming sports events, register, authenticate, and see details of each event.

## 🧩 Project Structure  
The application follows an **N-Layer architecture**, with the following layers:

- **Entity Layer**: Contains classes like `User`, `EventoDeportivo`, and utilities (`Constants`, `Hash`).
- **Data Access Layer**: Handles interaction with the SQL Server database.
- **Business Layer**: Processes business logic.
- **WebApp**: Presentation layer with pages like `Login.aspx`, `SignUp.aspx`, and `EventosDeportivos.aspx`.

## 🧾 Requirements  
- ASP.NET (.NET Framework 2.0)  
- SQL Server (any version)  
- Visual Studio  

## 🛠 Installation  
1. Run the SQL script to create:
   - Database: `BDD_EventoDeportivo_GR2`  
   - User: `usr_eventosdeportivos_gr2`  
   - Tables: `TBL_DEPORTE`, `TBL_LUGAR`, `TBL_EVENTO`, `TBL_PARTICIPANTE`, `TBL_USER`  
   - View: `VW_EVENTOS_COMPLETO`  
   - Sample data (inserted)

2. Open the solution in Visual Studio:
   - Make sure to configure the connection string in `Web.config`.

3. Run the project starting from `Default.aspx`.

## 🔐 Features  
- User registration (`SignUp.aspx`) with encrypted password (SHA1).  
- Authentication (`Login.aspx`) and access control for `EventosDeportivos.aspx`.  
- List of upcoming sports events (filterable by sport type).  
- Protected session: redirects to login page if not authenticated.  
- User roles (admin and normal).  
- Modern visual design with animations and a sporty style.
