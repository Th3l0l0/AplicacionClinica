using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Dominio.Core.Entidades;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Infraestructura.Data.SqlServer
{
    public class PacientesDAL
    {

        string cad_cn = ConfigurationManager.ConnectionStrings["cn1"].ConnectionString;

        public List<Pacientes> ListarPacientes()
        {
            List<Pacientes> lista = new List<Pacientes>();
            SqlConnection cn = new SqlConnection(cad_cn);
            cn.Open();

            SqlCommand cmd = new SqlCommand("ListarPacientes", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader lector = cmd.ExecuteReader();

            while (lector.Read())
            {
                Pacientes pac = new Pacientes()
                {
                    codpac = lector.GetString(0),
                    nompac = lector.GetString(1),
                    dnipac = lector.GetString(2),
                    tel_cel = lector.GetString(3),
                    dirpac = lector.GetString(4),
                    coddis = lector["coddis"].ToString(),
                    nomdis = lector["distrito"].ToString()
                };

                lista.Add(pac);
            }

            cn.Close();
            return lista;
        }

        public List<Distritos> ListarDistritos()
        {
            List<Distritos> lista = new List<Distritos>();
            SqlConnection cn = new SqlConnection(cad_cn);
            cn.Open();

            SqlCommand cmd = new SqlCommand("ListarDistritos", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader lector = cmd.ExecuteReader();

            while (lector.Read())
            {
                Distritos dis = new Distritos()
                {
                    coddis = lector.GetString(0),
                    nomdis = lector.GetString(1)
                };

                lista.Add(dis);
            }

            cn.Close();
            return lista;
        }

        public void InsertarPaciente(Pacientes objPac)
        {
            try
            {
                SqlConnection cn = new SqlConnection(cad_cn);
                cn.Open();

                SqlCommand cmd = new SqlCommand("InsertarPaciente", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@codpac", objPac.codpac);
                cmd.Parameters.AddWithValue("@nompac", objPac.nompac);
                cmd.Parameters.AddWithValue("@dnipac", objPac.dnipac);
                cmd.Parameters.AddWithValue("@tel_cel", objPac.tel_cel);
                cmd.Parameters.AddWithValue("@dirpac", objPac.dirpac);
                cmd.Parameters.AddWithValue("@coddis", objPac.coddis);
                cmd.ExecuteNonQuery();        

                cn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void ActualizarPaciente(Pacientes objPac)
        {
            try
            {
                SqlConnection cn = new SqlConnection(cad_cn);
                cn.Open();

                SqlCommand cmd = new SqlCommand("ActualizarPaciente", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@codpac", objPac.codpac);
                cmd.Parameters.AddWithValue("@nompac", objPac.nompac);
                cmd.Parameters.AddWithValue("@dnipac", objPac.dnipac);
                cmd.Parameters.AddWithValue("@tel_cel", objPac.tel_cel);
                cmd.Parameters.AddWithValue("@dirpac", objPac.dirpac);
                cmd.Parameters.AddWithValue("@coddis", objPac.coddis);
                cmd.ExecuteNonQuery();
                cn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void EliminarPaciente(string codpac)
        {
            try
            {
                SqlConnection cn = new SqlConnection(cad_cn);
                cn.Open();

                SqlCommand cmd = new SqlCommand("EliminarPaciente", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@codpac", codpac);
                cmd.ExecuteNonQuery();
                cn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
