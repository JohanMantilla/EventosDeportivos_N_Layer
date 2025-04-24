using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;

namespace DataAccess.EventosDeportivosEx1
{

    public class EventoDeportivo
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["BDD_EventoDeportivoConnectionString"].ConnectionString;

        public List<EntityLayer.EventosDeportivosEx1.EventoDeportivo> GetEventos()
        {
            List<EntityLayer.EventosDeportivosEx1.EventoDeportivo> eventos = new List<EntityLayer.EventosDeportivosEx1.EventoDeportivo>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM VW_EVENTOS_COMPLETO", conn))
                {
                    try
                    {
                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                eventos.Add(new EntityLayer.EventosDeportivosEx1.EventoDeportivo
                                {
                                    ID_EVENTO = Convert.ToInt32(reader["ID_EVENTO"]),
                                    NOMBRE_EVENTO = reader["NOMBRE_EVENTO"].ToString(),
                                    FECHA_INICIO = reader["FECHA_INICIO"].ToString(),
                                    FECHA_FIN = reader["FECHA_FIN"].ToString(),
                                    HORA = reader["HORA"].ToString(),
                                    ESTADO = reader["ESTADO"].ToString(),
                                    DESCRIPCION = reader["DESCRIPCION"].ToString(),
                                    NOMBRE_DEPORTE = reader["NOMBRE_DEPORTE"].ToString(),
                                    NOMBRE_LUGAR = reader["NOMBRE_LUGAR"].ToString()
                                });
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error al obtener eventos: " + ex.Message);
                    }
                }
            }
            return eventos;
        }
    }

}
