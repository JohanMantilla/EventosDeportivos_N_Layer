using System;
using System.Collections.Generic;
using System.Text;

namespace EntityLayer.EventosDeportivosEx1
{
    public class EventoDeportivo
    {
        public int ID_EVENTO { get; set; }
        public string NOMBRE_EVENTO { get; set; }
        public string FECHA_INICIO { get; set; }
        public string FECHA_FIN { get; set; }
        public string HORA { get; set; }
        public string ESTADO { get; set; }
        public string DESCRIPCION { get; set; }
        public string NOMBRE_DEPORTE { get; set; }
        public string NOMBRE_LUGAR { get; set; }
    }

}
