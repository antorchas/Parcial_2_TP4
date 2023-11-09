using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial2
{
    public partial class Frm_Registro : System.Web.UI.Page
    {
        string passOld = "";
        protected void Page_Load(object sender, EventArgs e)
        {
          
                if (this.Request.Cookies["password"] == null)
                {
                    passOld = "no hay contraseña anterior guardada";
                }
                passOld = this.Request.Cookies["password"].Value;
         
        }
        private void crearCookePassword()
        {
            HttpCookie cookePass = new HttpCookie("password", this.txtPassword.Text);
            cookePass.Expires = new DateTime(2023, 12, 25);
            this.Response.Cookies.Add(cookePass);
        }
        private void CrearSessionUser()
        {
            this.Session["userName"] = this.txtUserName.Text;
        }
        private void CleanForm()
        {
            txtEdad.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtmail.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtRepassword.Text = string.Empty;  

        }
        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            crearCookePassword();
            CrearSessionUser();
            if (this.Request.Cookies["password"] != null && this.Session["userName"] != null)
            {
                CleanForm();
                string mensaje = $"Mensaje('Correcto!', 'El Usuario se registró correctamente!', 'success', 'index.aspx');";
                ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", mensaje, true);
            }
            else
            {
                string mensaje = $"Mensaje('Error!', 'El Usuario no se pudo registrar', 'error');";
                ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", mensaje, true);
            }




        }
    }
}