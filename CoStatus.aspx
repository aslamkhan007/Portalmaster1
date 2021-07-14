<%@ Page Title="" Language="VB" MasterPageFile="~/Main2.master" AutoEventWireup="false" CodeFile="CoStatus.aspx.vb" Inherits="CoStatus" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="tile" style="height: 100%; vertical-align:top;">
    &nbsp;<table style="padding: 1px; margin: 1px; width: 100%" >
        <tr >
        <td class="content-sub-heading">Compensatory Leave Status</td>
        </tr>    
        <tr >
            <td  style="font-size:small; text-align:left;width:100%;overflow:scroll;height: 150px"  class="style1">
                <%--<div class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2">--%>
                &nbsp;
                 <%--<asp:Panel ID="panel1" ScrollBars="Both" runat="server" class="table-responsive" Width="90%"   >--%>
              <%--  <div style="overflow:scroll;">--%>
                <div style="width: 90%; height: 400px;">
                   
                <asp:GridView ID="GridView1" runat="server" Width="95%"
                    PageSize="15" CssClass="table" GridLines="None" >
                   <HeaderStyle Wrap="False" BackColor="DarkGoldenrod" Font-Bold="True" ForeColor="#FFFFCC" />
                    <AlternatingRowStyle BackColor="WhiteSmoke" />
                    
                   
                </asp:GridView>
                    <%--</asp:Panel>--%>
                    </div>
                    <%--</div>--%>
            </td>
        </tr>
    </table>



</asp:Content>


