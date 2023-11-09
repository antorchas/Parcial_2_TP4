<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Frm_GestorArchivos.aspx.cs" Inherits="Parcial2.Frm_GestorArchivos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="row mt-3 margenes">
    <div class="col-4">
        <h3 style="color:dimgray">Gestión de Archivos</h3>
        </div>
  </div>
         <div class="row mt-3 margenes">
   <div class="col-6">
       <asp:FileUpload ID="FUARchivos" runat="server" />
       </div>
 </div>
             <div class="row mt-3 mb-3 margenes">


  <div class="col-6">
 
      <asp:Button CssClass="btn btn-primary mb-3" ID="btnConfirmar" runat="server" Text="Confirmar" OnClick="btnConfirmar_Click" />

  </div>
             </div>
     <div class="row mt-3 mb-3 margenes">
         <div class="col-11">

         <asp:Label ID="lblTitulo" runat="server" Text="" ForeColor="#333333" Font-Size="X-Large"></asp:Label>
         <asp:GridView ID="GVFiles" runat="server" HeaderText="Descargar" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" OnRowCommand="GVFiles_RowCommand">
             <Columns>
                 <asp:BoundField DataField="name" HeaderText="Nombre de Archivo" />
                 <asp:BoundField DataField="path" HeaderText="Ruta del Archivo" />
                 <asp:ButtonField  CommandName="Download" ButtonType="Image" HeaderText="Acción" ImageUrl="~/Images/Download.png"  />
             </Columns>
             <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
             <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
             <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F7F7F7" />
             <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
             <SortedDescendingCellStyle BackColor="#E5E5E5" />
             <SortedDescendingHeaderStyle BackColor="#242121" />
         </asp:GridView>
         </div>
 

         </div>
</asp:Content>
