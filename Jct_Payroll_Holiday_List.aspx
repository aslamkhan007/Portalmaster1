<%@ Page Title="" Language="VB" MasterPageFile="~/Main2.master" AutoEventWireup="false" CodeFile="Jct_Payroll_Holiday_List.aspx.vb" Inherits="Payroll_Jct_Payroll_Holiday_List" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="card" style="width: 100%">
        &nbsp;&nbsp;
    <table style="width: 100%; left:20px" class="tblMain">
        <tr>
            <td class="content-sub-heading">
                Holiday Calendar</td>
        </tr>
        <tr>
            <td >
    <asp:GridView ID="GridView1" runat="server"   Width="90%" 
                CssClass="table"    PageSize="15" GridLines="None" >
            <%--<RowStyle CssClass="RowStyle" />           
    <EmptyDataRowStyle CssClass="EmptyRowStyle" />

    <PagerStyle CssClass="PagerStyle" />

    <SelectedRowStyle CssClass="SelectedRowStyle" />

    <HeaderStyle CssClass="HeaderStyle" />

    <EditRowStyle CssClass="EditRowStyle" />

    <AlternatingRowStyle CssClass="AltRowStyle" />--%>
    </asp:GridView>
            </td>
        </tr>
    </table>
        </div>
  <div style="font-family :Tahoma; font-size : 8pt; color:Red ">
    Note: Birthday of Mahatma Gandhi Ji and Diwali fall on Sunday. Therefore, holidays in lieu thereof 
    will be observed on 16.06.2016 and 31.10.2016 on account of Martyrdom Day of Guru Arjun Dev Ji and
    Vishwakarma Day respectively.
    </div>

</asp:Content>
