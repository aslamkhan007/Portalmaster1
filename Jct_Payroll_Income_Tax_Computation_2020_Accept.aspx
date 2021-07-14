<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="Jct_Payroll_Income_Tax_Computation_2020_Accept.aspx.cs" Inherits="Jct_Payroll_Income_Tax_Computation_2020_Accept" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style type="text/css">
        .mys {
            background-repeat: repeat-x;
            height: 25px;
            text-align: center;
            font-family: Tahoma;
            font-weight: bold;
            font-size: 10pt;
            color: #444444;
        }

     .radio-input {
   display: inline-block;
    vertical-align: top;
    margin-right : 3%;
}
fieldset {
    text-align: center;
}
#radiodiv {
    margin: auto;
    border: 1px solid black;
    width: 50%;
    margin-bottom : 1%;
}

    </style>

    <script language="javascript" type="text/javascript">
        function AccessClipboardData() {
            try {
                window.clipboardData.setData('text', "No print data");
            } catch (err) {

            }

        }
    </script>


    <script language="javascript" type="text/javascript">

    
<!--

    document.onselectstart = new Function('return false'); function ds(e) { return false; } function ra() { return true; } document.onmousedown = ds; document.onclick = ra;

    document.oncontextmenu = new Function('alert("Not Permitted"); return false')



    function printPartOfPage(elementId) {

        var printContent = document.getElementById(elementId);
        var windowUrl = 'about:blank';
        var uniqueName = new Date();
        var windowName = 'Print' + uniqueName.getTime();
        var printWindow = window.open(windowUrl, windowName, 'left=500000,top=500000,width=-12,height=-12');

        printWindow.document.write(printContent.innerHTML);
        printWindow.document.close();
        printWindow.focus();
        printWindow.print();
        printWindow.close();







    }
    // -->
    </script>
    <script language="javascript" type="text/javascript">

        function AccessClipboardData() {
            try {
                window.clipboardData.setData('text', "No print data");
            } catch (err) {

            }

        }
    </script>



    <asp:Panel ID="pnlPerson" runat="server">
        <table style="width: 100%;">
            <tr>
                <td class="content-sub-heading" style="text-align: left;" colspan="2">Test
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" Width="95%"
                        PageSize="15" CssClass="table" GridLines="None">
                        <HeaderStyle Wrap="False" BackColor="DarkGoldenrod" Font-Bold="True" ForeColor="#FFFFCC" />
                        <AlternatingRowStyle BackColor="WhiteSmoke" />
                    </asp:GridView>
                </td>

            </tr>
            <tr>
                <td>
                    <fieldset>                        
                        <div id ="radiodiv">
                            <asp:RadioButtonList  ID="rblMeasurementSystem" runat="server" class="radio-input" RepeatDirection="Horizontal">
                                <asp:ListItem  Text="OldMethod" Selected="True" Value="Old" />
                                <asp:ListItem Text="NewMethod" Value="New" />
                            </asp:RadioButtonList>
                        </div>
                    </fieldset>
                </td>
            </tr>

            <tr style="text-align: center">
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-brand"
                        ValidationGroup="A" OnClick="LinkButton1_Click">Submit</asp:LinkButton>
                </td>
            </tr>

            <tr>
                <td>
                    <label runat="server" id="lblcat" visible="false">Please Note: <b>term and coditions1 . </b></label>
                    <br />
                    <label runat="server" visible="false" id="Label5">Please Note: <b>term and coditions2 . </b></label>
                </td>
            </tr>

        </table>


        <asp:Panel ID="Panel3" runat="server" Height="9px" Width="29px">
        </asp:Panel>
    </asp:Panel>

</asp:Content>


