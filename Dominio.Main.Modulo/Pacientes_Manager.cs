using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using Dominio.Core.Entidades;
using Infraestructura.Data.SqlServer;

namespace Dominio.Main.Modulo
{
    public class Pacientes_Manager
    {

        //
        PacientesDAL objDAL = new PacientesDAL();

        public List<Pacientes> ListarPacientes_MM()
        {
            return objDAL.ListarPacientes();
        }

        public List<Distritos> ListarDistritos_MM()
        {
            return objDAL.ListarDistritos();
        }

        public void InsertarPaciente_MM(Pacientes objPac)
        {
            objDAL.InsertarPaciente(objPac);
        }

        public void ActualizarPaciente_MM(Pacientes objPac)
        {
            objDAL.ActualizarPaciente(objPac);
        }

        public void EliminarPaciente_MM(string codpac)
        {
            objDAL.EliminarPaciente(codpac);
        }
    }
}
