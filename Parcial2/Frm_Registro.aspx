<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Frm_Registro.aspx.cs" Inherits="Parcial2.Frm_Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row mt-3 margenes">
           <div class="col-4">
               <h3 style="color:dimgray">Registro de Usuario</h3>
               </div>
         </div>
   <div class="row mt-3 margenes">

  <div class="col-4">
 
      <asp:Label CssClass="col-sm-2 col-form-label" ID="Label2" runat="server" Text="Nombre de Usuario"></asp:Label>
      <asp:TextBox CssClass="form-control inputbox"  ID="txtUserName" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RVUser" ForeColor="Red" runat="server" ErrorMessage="Debe Ingresar el Nombre de Usuario" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>

  </div>
      <div class="col-4">
 
      <asp:Label CssClass="col-sm-2 col-form-label" ID="Label3" runat="server" Text="Correo electrónico"></asp:Label>
      <asp:TextBox CssClass="form-control inputbox" ID="txtmail" runat="server"></asp:TextBox>
    
            <asp:RequiredFieldValidator ID="RVMail" ForeColor="Red" runat="server" ErrorMessage="Debe Ingresar el correo electrónico" ControlToValidate="txtmail" Display="Dynamic"></asp:RequiredFieldValidator>
    
            <asp:RegularExpressionValidator ID="REVMail" runat="server" ForeColor="Red" ErrorMessage="El formato ingresado no es un Email." ControlToValidate="txtmail" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"  Display="Dynamic"></asp:RegularExpressionValidator>
     
                      

      

  </div>
               <div class="col-3">
 
    <asp:Label CssClass="col-sm-2 col-form-label" ID="Label4" runat="server" Text="Edad"></asp:Label>
    <asp:TextBox CssClass="form-control inputbox" TextMode="Number" ID="txtEdad"  runat="server" Width="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RVEdad" ForeColor="Red" runat="server" ErrorMessage="Debe ingresar la edad." ControlToValidate="txtEdad" Display="Dynamic"></asp:RequiredFieldValidator>

       <asp:RangeValidator ID="RangVEdad" runat="server" ForeColor="Red" ErrorMessage="La edad debe ser mayor a 15 años." MaximumValue="99" ControlToValidate="txtEdad" MinimumValue="16" Display="Dynamic" ></asp:RangeValidator>
</div>
   </div>
     <div class="row mt-3 mb-3 margenes">

  <div class="col-4">
 
      <asp:Label CssClass="col-sm-2 col-form-label" ID="Label1" runat="server" Text="Contraseña"></asp:Label>
      <asp:TextBox CssClass="form-control inputbox" TextMode="Password" ID="txtPassword" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RVPassword" ForeColor="Red" runat="server" ErrorMessage="Debe ingresar la Contraseña." ControlToValidate="txtPassword" Display="Dynamic"></asp:RequiredFieldValidator>

  </div>
      <div class="col-4">
 
      <asp:Label CssClass="col-sm-2 col-form-label" ID="Label5" runat="server" Text="Reingrese la Contraseña"></asp:Label>
      <asp:TextBox CssClass="form-control inputbox"  TextMode="Password" ID="txtRepassword" runat="server"></asp:TextBox>
          <asp:CompareValidator ID="CVPassword" ForeColor="Red" runat="server"  ControlToCompare="txtRepassword" ControlToValidate="txtPassword"  ErrorMessage="Las Contraseñas ingresadas no coinciden."></asp:CompareValidator>

  </div>
       
         </div>
         <div class="row mt-3 mb-3 margenes">


  <div class="col-6">
 
      <asp:Button CssClass="btn btn-primary" ID="btnConfirmar" runat="server" Text="Confirmar" OnClick="btnConfirmar_Click" />

  </div>
             </div>

</asp:Content>
