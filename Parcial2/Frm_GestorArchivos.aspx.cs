using Parcial2.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial2
{
    public partial class Frm_GestorArchivos : System.Web.UI.Page
    {
        string path = string.Empty;
        string fileName = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
           
                if (!(this.Session["userName"] != null))
                {
                    string mensaje = $"Mensaje('Información!', 'Para utilizar esta sección necesita registrar un Usuario primero.', 'info', 'Frm_Registro.aspx');";
                    ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", mensaje, true);
                    //this.Response.Redirect("Frm_Registro.aspx");


                }
                else
            {
                path = $"{Server.MapPath(".")}\\{this.Session["userName"]}";
                FillGridViewFiles();

            }

        }
        public void FillGridViewFiles()
        {
 
            if (Directory.Exists(path))
            {
                string[] files = Directory.GetFiles(path);
                List<FilesModel> fileList = new List<FilesModel>();
                foreach (string file in files)
                {

                    var newFile = new FilesModel {
                    name = Path.GetFileName(file),
                    path =file,
                    };
                  
                    fileList.Add(newFile);
                }
                GVFiles.DataSource = fileList;
                GVFiles.DataBind();
                lblTitulo.Text = $"Listado de archivos registrados por el usuario {this.Session["userName"]}";
            }
        }

        private int LoadFiles()
        {
      
          

            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            int result = 2;
            foreach (HttpPostedFile archivo in FUARchivos.PostedFiles)
            {


                if (File.Exists($"{path}\\{archivo.FileName}"))
                {
                    fileName = archivo.FileName;
                    result = 0;

                }
                else
                {
                    if ( FUARchivos.HasFile)
                    {
                        FUARchivos.SaveAs($"{path}\\{archivo.FileName}");
                        result = 1;
                    }
                    else
                    {
                        result = 2;
                    }
                   
                }
             

            }

            return result;


        }

        private bool Validar()
        {
            if(!(this.Session["userName"] != null))
            {
                string mensaje = $"Mensaje('Información!', 'No se ha registrado un Usuario, registre primero un Usuario.', 'info');";
                ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", mensaje, true);
                return false;
            }
            return true;
        }
        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            if(Validar())
            {
                int Result = LoadFiles();


                if (Result == 1)
                {
                    string mensaje = $"Mensaje('Correcto!', 'El archivo se descargo correctamente.', 'success');";
                    ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", mensaje, true);

                
                }

                else if(Result == 0)
                {
                    string mensaje = $"Mensaje('Error!', 'Ya existe un archivo con el nombre {fileName}.', 'error');";
                    ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", mensaje, true);
                }
                else
                {
                    string mensaje = $"Mensaje('Información', 'Debe seleccionar un archivo.', 'Info');";
                    ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", mensaje, true);
                }
                FillGridViewFiles();
            }
        }

        protected void GVFiles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                GridViewRow row = GVFiles.Rows[Convert.ToInt32(e.CommandArgument)];
                string filePath = row.Cells[1].Text;

                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.TransmitFile(filePath);
                Response.End();
            }
        }
    }
}