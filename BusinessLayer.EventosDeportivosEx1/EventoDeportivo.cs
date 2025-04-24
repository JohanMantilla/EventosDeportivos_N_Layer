using System;
using System.Collections.Generic;
using System.Text;
using EntityLayer.EventosDeportivosEx1;
using DataAccess.EventosDeportivosEx1;

namespace BusinessLayer.EventosDeportivosEx1
{
    public class EventoDeportivo
    {
        private DataAccess.EventosDeportivosEx1.EventoDeportivo dataAccess = new DataAccess.EventosDeportivosEx1.EventoDeportivo();

        public List<EntityLayer.EventosDeportivosEx1.EventoDeportivo> GetEventos()
        {
            var eventos = dataAccess.GetEventos();
            var eventosFiltrados = new List<EntityLayer.EventosDeportivosEx1.EventoDeportivo>();

            // Filtrar eventos con estado "PROGRAMADO"
            foreach (var evento in eventos)
            {
                if (evento.ESTADO.Equals("PROGRAMADO", StringComparison.OrdinalIgnoreCase))
                {
                    eventosFiltrados.Add(evento);
                }
            }

            // Ordenar por fecha de inicio
            eventosFiltrados.Sort((e1, e2) =>
                DateTime.Parse(e1.FECHA_INICIO).CompareTo(DateTime.Parse(e2.FECHA_INICIO)));

            return eventosFiltrados;
        }

        public List<EntityLayer.EventosDeportivosEx1.EventoDeportivo> GetEventosFiltrados(string deporte = null)
        {
            var eventos = GetEventos();
            var eventosFiltrados = new List<EntityLayer.EventosDeportivosEx1.EventoDeportivo>();

            // Si no se especifica un deporte, devolver todos los eventos
            if (string.IsNullOrEmpty(deporte))
            {
                return eventos;
            }

            // Filtrar eventos por el deporte especificado
            foreach (var evento in eventos)
            {
                if (evento.NOMBRE_DEPORTE.Equals(deporte, StringComparison.OrdinalIgnoreCase))
                {
                    eventosFiltrados.Add(evento);
                }
            }

            return eventosFiltrados;
        }
    }
}
