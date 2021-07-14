<%@ Page Title="" Language="VB" MasterPageFile="Main2.master" AutoEventWireup="false" CodeFile="ReviewAppraisalYearly.aspx.vb" Inherits="EmpGateway_ReviewAppraisalYearly" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td  colspan="4" class="content-sub-heading">
                Review Appraisal</td>
        </tr>
        <tr>
             <td class="CellWidth10">       
                Year</td>
           <td class="CellWidth40">
                <asp:DropDownList ID="cboYear" runat="server" class="btn btn-default btn-sm"  >
                    <asp:ListItem>2019</asp:ListItem>                    
                    <asp:ListItem>2020</asp:ListItem>                    
                </asp:DropDownList>
            </td>
            <td>
              
            </td>
            <td>
                </td>
        </tr>

            <tr>
            <td  colspan="4" style="text-align:center;">                
                  
              <%--  <asp:LinkButton ID="lnkapply" runat="server" class="btn btn-brand"   ValidationGroup="mandatory"
                    onclick="lnkapply_Click">Apply</asp:LinkButton>
                <asp:LinkButton ID="lnkreset" runat="server"  class="btn btn-brand" 
                    onclick="lnkreset_Click">Reset</asp:LinkButton>--%>
                    

                  <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-brand" >Fetch</asp:LinkButton>

            </td>
        </tr>


        <tr>
            <td class="labelcells">
                EmpCode</td>
            <td>
                <asp:TextBox ID="txtEmpCode" runat="server" CssClass="textbox"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

