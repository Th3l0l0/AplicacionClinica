using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
//
using Dominio.Core.Entidades;
using Dominio.Main.Modulo;

namespace AplicacionClinica.Controllers
{
    public class PacientesController : Controller
    {

        Pacientes_Manager objPM = new Pacientes_Manager();

        // GET: Pacientes
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult List()
        {
            return Json(objPM.ListarPacientes_MM(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult ListDistritos()
        {
            return Json(objPM.ListarDistritos_MM(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult Add(Pacientes pac)
        {
            objPM.InsertarPaciente_MM(pac);
            return Json(pac, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetbyID(object codpac)
        {
            var Paciente = objPM.ListarPacientes_MM().Find(x => x.codpac.Equals(codpac));
            return Json(Paciente, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Update(Pacientes pac)
        {
            objPM.ActualizarPaciente_MM(pac);
            return Json(pac, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Delete(string codpac)
        {
            objPM.EliminarPaciente_MM(codpac);
            return Json(codpac, JsonRequestBehavior.AllowGet);
        }
    }
}