<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventosDeportivos.aspx.cs" Inherits="WebAppEventosDeportivosEx1.EventosDeportivos" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Próximos Eventos Deportivos</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            min-height: 100vh;
            padding: 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-image: 
                url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><path d="M50,10 L90,50 L50,90 L10,50 Z" fill="rgba(255,255,255,0.03)"/></svg>'),
                url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="30" fill="none" stroke="rgba(255,255,255,0.05)" stroke-width="5"/></svg>');
            background-size: 200px 200px;
            animation: backgroundMove 15s linear infinite;
        }

        @keyframes backgroundMove {
            from { background-position: 0 0; }
            to { background-position: 200px 200px; }
        }

        .container {
            max-width: 1200px;
            width: 100%;
            background: rgba(255, 255, 255, 0.95);
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding: 1rem;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            border-radius: 15px;
            color: white;
        }

        .username {
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .username::before {
            content: '\f007';
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
        }

        .filters {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            position: relative;
        }

        .filter-select {
            padding: 0.8rem 1rem;
            border-radius: 10px;
            border: 2px solid #e0e0e0;
            min-width: 200px;
            font-size: 1rem;
            background: white;
            cursor: pointer;
            transition: all 0.3s ease;
            appearance: none;
            padding-right: 2.5rem;
        }

        .filters::after {
            content: '\f078';
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #1e3c72;
            pointer-events: none;
        }

        .filter-select:focus {
            border-color: #1e3c72;
            box-shadow: 0 0 0 3px rgba(30, 60, 114, 0.2);
            outline: none;
        }

        .gridview-eventos {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 0.5rem;
            background: transparent;
        }

        .gridview-eventos th {
            background: #1e3c72;
            color: white;
            padding: 1rem;
            text-align: left;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.9rem;
        }

        .gridview-eventos th:first-child {
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }

        .gridview-eventos th:last-child {
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .gridview-eventos td {
            padding: 1rem;
            background: white;
            border-top: 1px solid #eef2ff;
            transition: all 0.3s ease;
        }

        .gridview-eventos tr td:first-child {
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }

        .gridview-eventos tr td:last-child {
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .gridview-eventos tr:hover td {
            background: #f8f9ff;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(30, 60, 114, 0.1);
        }

        .estado-programado {
            background: #e3f2fd;
            color: #1e3c72;
            padding: 0.5rem 1rem;
            border-radius: 999px;
            font-size: 0.875rem;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .estado-programado::before {
            content: '\f017';
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
        }

        .logout-btn {
            background: transparent;
            color: white;
            padding: 0.5rem 1.5rem;
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.3s ease;
            border: 2px solid rgba(255, 255, 255, 0.3);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .logout-btn::before {
            content: '\f2f5';
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
        }

        .logout-btn:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: white;
        }

        .page-title {
            font-size: 2rem;
            color: #1e3c72;
            font-weight: 800;
            margin-bottom: 2rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 1rem;
        }

        .page-title::before {
            content: '\f073';
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
        }

        .no-events {
            text-align: center;
            padding: 3rem;
            color: #718096;
            font-size: 1.1rem;
            background: #f8f9ff;
            border-radius: 10px;
            margin: 1rem 0;
        }

        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }

            .container {
                padding: 1rem;
            }

            .header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .gridview-eventos {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <div class="username">
                    <asp:Label ID="lblUserName" runat="server"></asp:Label>
                </div>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Logout.aspx" CssClass="logout-btn">Cerrar Sesión</asp:HyperLink>
            </div>
            
            <h1 class="page-title">Próximos Eventos Deportivos</h1>
            
            <div class="filters">
                <asp:DropDownList ID="ddlDeporte" runat="server" CssClass="filter-select" AutoPostBack="true" 
                    OnSelectedIndexChanged="ddlDeporte_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

            <asp:GridView ID="EventosGridView" runat="server" AutoGenerateColumns="False" 
                CssClass="gridview-eventos" GridLines="None" EmptyDataText="No hay eventos próximos programados"
                EmptyDataRowStyle-CssClass="no-events">
                <Columns>
                    <asp:BoundField DataField="NOMBRE_EVENTO" HeaderText="Evento" />
                    <asp:BoundField DataField="NOMBRE_DEPORTE" HeaderText="Deporte" />
                    <asp:BoundField DataField="FECHA_INICIO" HeaderText="Fecha Inicio" />
                    <asp:BoundField DataField="FECHA_FIN" HeaderText="Fecha Fin" />
                    <asp:BoundField DataField="HORA" HeaderText="Hora" />
                    <asp:TemplateField HeaderText="Estado">
                        <ItemTemplate>
                            <span class="estado-programado">PROGRAMADO</span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NOMBRE_LUGAR" HeaderText="Lugar" />
                    <asp:BoundField DataField="DESCRIPCION" HeaderText="Descripción" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>