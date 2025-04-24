using EntityLayer.EventosDeportivosEx1.Util;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppEventosDeportivosEx1
{
    public partial class EventosDeportivos : System.Web.UI.Page
    {
        private BusinessLayer.EventosDeportivosEx1.EventoDeportivo business = new BusinessLayer.EventosDeportivosEx1.EventoDeportivo();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDeportes();
                CargarEventos();
            }

            if (Session[Constants.USER] != null && Session[Constants.USER].ToString() != "")
            {
                lblUserName.Text = Session[Constants.USER].ToString();
            }
            else
            {
                Response.Redirect("~/Login.aspx", true);
            }
        }

        private void CargarDeportes()
        {
            var eventos = business.GetEventos();
            var deportes = new List<string>();

            // Recopilar deportes únicos
            foreach (var evento in eventos)
            {
                if (!deportes.Contains(evento.NOMBRE_DEPORTE)) // Evitar duplicados
                {
                    deportes.Add(evento.NOMBRE_DEPORTE);
                }
            }

            deportes.Sort(); // Ordenar deportes alfabéticamente

            ddlDeporte.Items.Clear();
            ddlDeporte.Items.Add(new ListItem("Todos los deportes", ""));
            foreach (var deporte in deportes)
            {
                ddlDeporte.Items.Add(new ListItem(deporte, deporte));
            }
        }

        private void CargarEventos()
        {
            string deporteSeleccionado = ddlDeporte.SelectedValue;
            var eventos = business.GetEventosFiltrados(deporteSeleccionado);
            EventosGridView.DataSource = eventos;
            EventosGridView.DataBind();
        }

        protected void ddlDeporte_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarEventos();
        }
    }
}
