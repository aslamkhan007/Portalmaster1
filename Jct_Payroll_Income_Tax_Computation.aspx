<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true"
    CodeFile="Jct_Payroll_Income_Tax_Computation.aspx.cs" Inherits="Payroll_Jct_Payroll_Income_Tax_Computation" %>

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
    </style>

    <script language="javascript" type="text/javascript">
        function AccessClipboardData() {
            try {
                window.clipboardData.setData('text', "No print data");
            } catch (err) {
                // txt = "There was an error on this page.\n\n";
                // txt += "Error description: " + err.description + "\n\n";
                // txt += "Click OK to continue.\n\n";
                //  alert(txt);
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
                // txt = "There was an error on this page.\n\n";
                // txt += "Error description: " + err.description + "\n\n";
                // txt += "Click OK to continue.\n\n";
                //  alert(txt);
            }

        }
    </script>
    <%--      <script language="JavaScript" type="text/javascript">

                    setInterval("AccessClipboardData()", 300);
                    var ClipBoardText = "";

                    if (window.clipboardData) {
                        ClipBoardText = window.clipboardData.getData('text');
                        if (ClipBoardText == "") {
                            alert('Sorry you have to allow the page to access clipboard');
                            // hide the div which contains your data
                            document.all("divmaster").style.display = "none"
                        } else {

                            document.onkeydown = function (ev) {
                                var a;
                                ev = window.event;
                                if (typeof ev == "undefined") {
                                    alert("PLEASE DON'T USE KEYBORD");
                                }
                                a = ev.keyCode;
                                alert("PLEASE DON'T USE KEYBORD");
                                return false;
                            }
                            document.onkeyup = function (ev) {
                                var charCode;
                                if (typeof ev == "undefined") {
                                    ev = window.event;
                                    alert("PLEASE DON'T USE KEYBORD");
                                } else {
                                    alert("PLEASE DON'T USE KEYBORD");
                                }
                                return false;
                            }
                        }
                    }
       
                </script>--%>


    <%--  <table class="tile">--%>

    <%-- </table>--%>

    <asp:Panel ID="pnlPerson" runat="server">


        <table>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" Width="95%"
                        PageSize="15" CssClass="table" GridLines="None">
                        <HeaderStyle Wrap="False" BackColor="DarkGoldenrod" Font-Bold="True" ForeColor="#FFFFCC" />
                        <AlternatingRowStyle BackColor="WhiteSmoke" />
                    </asp:GridView>
                </td>

            </tr>
            <tr style="text-align: center">
                <td>

                    <%--<label runat="server" id="lblcat">Category</label>--%>
                    <asp:RadioButtonList ID="rblMeasurementSystem" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="OldMethod" Selected="True" Value="Old" />
                        <asp:ListItem Text="NewMethod" Value="New" />
                    </asp:RadioButtonList>
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
                    <label runat="server" id="lblcat" visible ="false">Please Note: <b> term and coditions1 . </b></label>
                    <br />
                    <label runat="server" visible ="false" id="Label5">Please Note: <b> term and coditions2 . </b></label>
                </td>
            </tr>

        </table>

        <%--  <table class="mytable">
            <tr>
                <td class="tableheader" colspan="4">
                    Tax Computation :
                </td>
            </tr>
            <tr>
                <td class="labelcells">
                    YearMonth
                </td>
                <td class="NormalText">
                    <asp:TextBox ID="txttodate" runat="server" CssClass="textbox" Width="80px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txttodate"
                        ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>
                </td>
                <td class="labelcells">
                    &nbsp;
                </td>
                <td class="NormalText">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="labelcells">
                    Search Emplyoee Name
                </td>
                <td class="NormalText">
                    <asp:TextBox ID="txtEmployee" runat="server" CssClass="textbox" AutoPostBack="True"
                        OnTextChanged="txtEmployee_TextChanged" Width="300px"></asp:TextBox>
                    <cc1:AutoCompleteExtender ID="txtEmployee_AutoCompleteExtender" runat="server" CompletionInterval="10"
                        CompletionListCssClass="AutoExtender" CompletionListElementID="divwidth" CompletionListHighlightedItemCssClass="AutoExtenderHighlight"
                        CompletionListItemCssClass="AutoExtenderList" CompletionSetCount="5" MinimumPrefixLength="3"
                        ServiceMethod="GetEmployee_sh_Common" ServicePath="~/WebService.asmx" TargetControlID="txtEmployee">
                    </cc1:AutoCompleteExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmployee"
                        ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>
                </td>
                <td class="labelcells">
                    &nbsp;
                </td>
                <td class="labelcells">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="buttonbackbar" colspan="4">
                    <asp:LinkButton ID="lnkadd" runat="server" CssClass="buttonc" OnClick="lnkadd_Click"
                        ValidationGroup="A">Fetch</asp:LinkButton>
                    <asp:LinkButton ID="lnkreset" runat="server" CssClass="buttonc" OnClick="lnkreset_Click">Reset</asp:LinkButton>
                </td>
            </tr>
        </table>--%>
        <%--  <table style="width: 100%;">
            <tr>
                <td colspan="3" class="tableheader">
                    
                </td>
            </tr>
        </table>
        --%>
        <div class="tile">
            <div id="print_area">
                <table style="width: 100%">

                    <tr>
                        <td class="mys" colspan="5">JCT Limited</td>
                    </tr>
                    <tr>
                        <td class="labelcells">&nbsp;
                        </td>
                        <td class="labelcells">
                            <%-- <table style="width: 100%">
        <tr>
        <td class="labelcells">
            <asp:Label ID="Label65" runat="server"></asp:Label>
        </td>
        <td class="labelcells">
        <asp:Label ID="Label13" runat="server"></asp:Label>
        </td>
        <td class="labelcells">
        <asp:Label ID="Label19" runat="server"></asp:Label>
        </td>
        <td class="labelcells">
        <asp:Label ID="Label21" runat="server"></asp:Label>
        </td>
         <td class="labelcells">
         <asp:Label ID="Label23" runat="server"></asp:Label>
        </td>
        </tr>
        </table>--%>
		Financial Year
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label66" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells">Empcode
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label67" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <%-- <table style="width: 100%">
        <tr>
        <td class="labelcells">
            <asp:Label ID="Label65" runat="server"></asp:Label>
        </td>
        <td class="labelcells">
        <asp:Label ID="Label13" runat="server"></asp:Label>
        </td>
        <td class="labelcells">
        <asp:Label ID="Label19" runat="server"></asp:Label>
        </td>
        <td class="labelcells">
        <asp:Label ID="Label21" runat="server"></asp:Label>
        </td>
         <td class="labelcells">
         <asp:Label ID="Label23" runat="server"></asp:Label>
        </td>
        </tr>
        </table>--%>EmployeeName
                        </td>
                        <td class="labelcells">Dept
                        </td>
                        <%--<td class="labelcells">Desg
                        </td>--%>
                        <td></td>
                        <td class="labelcells" ></td>
                    </tr>
                    <tr>
                        <td class="labelcells">&nbsp;
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label68" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label69" runat="server" Visible = "false"></asp:Label>
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label70" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="mys" colspan="5">Computation Of Tax On The Income Chargeable Under The Head 'Salaries' </td>
                    </tr>
                    <tr>
                        <td class="labelcells">&nbsp;
                        </td>
                        <td class="labelcells" colspan="4">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">Particulars
                        </td>
                        <td class="labelcells">Rupees
                        </td>
                        <td class="labelcells">Rupees
                        </td>
                        <td class="labelcells">Rupees
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">1
                        </td>
                        <td class="labelcells">Salary, Leave Encahment and Bonus etc.
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells">2
                        </td>
                        <td class="labelcells">Other Allowances
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label2" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells">3
                        </td>
                        <td class="labelcells">House Rent allowance
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label3" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells">4
                        </td>
                        <td class="labelcells">Entertainment Allowance
                        </td>
                        <td class="labelcells">&nbsp;
                        </td>
                        <td class="labelcells">
                        <td class="labelcells">
                            <asp:Label ID="Label4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">5
                        </td>
                        <td class="labelcells">** Total **
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                        <td class="labelcells">
                            <asp:Label ID="Label6" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">6
                        </td>
                        <td class="labelcells">i)Deduct amount of HRA exempt u/s 10(13A)
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label7" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells">7
                        </td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp A) HRA as per 3 above
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label8" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp B) Actual Rent paid as per Receipts
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label9" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">Less 10% of Salary
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label10" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp C) 40% / 50% of the Salary
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label11" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells" style="height: 17px"></td>
                        <td class="labelcells" style="height: 17px">Amount exempt (least of a,b & c) min( a,b,c)
                        </td>
                        <td class="labelcells" style="height: 17px"></td>
                        <td class="labelcells" style="height: 17px">
                            <asp:Label ID="Label12" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells" style="height: 17px"></td>
                    </tr>
                    <%--            <tr>
                <td class="labelcells">
                </td>
                <td class="labelcells">
                    ii) Transport Allowance
                </td>
                <td class="labelcells">
                </td>
                <td class="labelcells">
                </td>
                <td class="labelcells">
                    <asp:Label ID="Label13" runat="server"></asp:Label>
                </td>
            </tr>--%>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">ii) Uniform Allowance
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label14" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label15" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">8
                        </td>
                        <td class="labelcells">** Balance **
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label16" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">9
                        </td>
                        <td class="labelcells">Value of Perquisites'
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp A) Accomodation
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label17" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp B) Furniture
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label18" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <%--          <tr>
                <td class="labelcells">
                </td>
                <td class="labelcells">
                    &nbsp &nbsp &nbsp &nbsp *C) Electricity
                </td>
                <td class="labelcells">
                </td>
                <td class="labelcells">
                </td>
                <td class="labelcells">
                    <asp:Label ID="Label19" runat="server"></asp:Label>
                </td>
            </tr>--%>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp D) Water
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label20" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <%--            <tr>
                <td class="labelcells">
                </td>
                <td class="labelcells">
                    &nbsp &nbsp &nbsp &nbsp E) Interest Free Loan
                </td>
                <td class="labelcells">
                </td>
                <td class="labelcells">
                </td>
                <td class="labelcells">
                    <asp:Label ID="Label21" runat="server"></asp:Label>
                </td>
            </tr>--%>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp F) LTA
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label22" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <%--            <tr>
                <td class="labelcells">
                </td>
                <td class="labelcells">
                    &nbsp &nbsp &nbsp &nbsp G) Reimb. of med. exp.in excess of Rs 15000' Amedical
                </td>
                <td class="labelcells">
                </td>
                <td class="labelcells">
                </td>
                <td class="labelcells">
                    <asp:Label ID="Label23" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>--%>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp H) Conveyance
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label24" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp I) Reimb.of Ins & Road Tax
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label25" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp; &nbsp; &nbsp; &nbsp; J) Int.Credited to PF A/C in excess of the rate
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label26" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fixed by the central government and gratuity
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp ***sub total ****
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label28" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label27" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">10
                        </td>
                        <td class="labelcells">Gross Income from Salaries
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label29" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">11
                        </td>
                        <td class="labelcells">Add any other income reported by the employee
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label30" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <%--  <tr>
                <td class="labelcells">
                    *12
                </td>
                <td class="labelcells">
                    (a)Interest Accrued on NSC VI/VIII issue
                </td>
                <td class="labelcells">
                </td>
                <td class="labelcells">
                </td>
                
                
                <td class="labelcells">
                    <asp:Label ID="Label31" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="labelcells">
                    *
                </td>
                <td class="labelcells">
                    Interest Accrued on NSC for 6th Year
                </td>
                <td class="labelcells">
                </td>
                <td class="labelcells">
                </td>
                <td class="labelcells">
                    <asp:Label ID="Label32" runat="server"></asp:Label>
                </td>
            </tr>--%>
                    <tr>
                        <td class="labelcells">13
                        </td>
                        <td class="labelcells">Std. Deduction of Rs. 40000 U/S 16(IA)
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label31" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells">&nbsp;
                        </td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">&nbsp;
                        </td>
                        <td class="labelcells">Tax on Employment u/s 16(iii)
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label64" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells">&nbsp;
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label32" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">14
                        </td>
                        <td class="labelcells">Deductions Eligible U/S 80C in respect
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">of following Investments/Savings
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp A) Payment of Life Insurance Premium
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label33" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp B) Contribution to Unit Linked Ins. Plan
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label34" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp C) Contributio to Provident Fund & V.P.F
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label35" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp D) Contribution to Public Provident Fund
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label36" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp E) Subscription to N.S.C VIII Issue
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label37" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <%--   &nbsp &nbsp &nbsp &nbsp *F) Interest accured on N.S.C VIII issue--%>
                        &nbsp &nbsp &nbsp &nbsp G) Investment Made in Bank FDR Schema
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label38" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp H) Re-payment of Housing Loan {HLA}
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label39" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp I) Investment in ELSS (Infra)
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label40" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp J) Tussion Fee
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label41" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp K) Pension Fund u/s 80CCC
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label42" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">15
                        </td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp i) Total (A) to (K)
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label43" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">16
                        </td>
                        <td class="labelcells">Balance
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label44" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">Deduction u/s 80CCF (Infra)
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label45" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells">17
                        </td>
                        <td class="labelcells">Deduction u/s 80D (Rest.to Rs.50000)
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label46" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells">18
                        </td>
                        <td class="labelcells">Deduction u/s 80DD(Restricted to Rs.100000)
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label47" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells">19
                        </td>
                        <td class="labelcells">Deduction u/s 80E
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label48" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells">20
                        </td>
                        <td class="labelcells">Deduction u/s 80G
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label49" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells">21
                        </td>
                        <td class="labelcells">Deduction u/s 80U (Restricted to Rs.100000)
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label50" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells">22
                        </td>
                        <td class="labelcells">Deduction u/s 80CCD (Restricted to Rs.50000)
                        </td>
                        <td class="labelcells">
                            <asp:Label ID="Label51" runat="server"></asp:Label>
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                    </tr>
                    <tr>
                        <td class="labelcells">23
                        </td>
                        <td class="labelcells">** Total Admissible Deductions **
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label52" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">24
                        </td>
                        <td class="labelcells">** Net Taxable Income **
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label53" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp &nbsp &nbsp &nbsp (i) Rebate u/s 87A
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label54" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">25
                        </td>
                        <td class="labelcells">Income Tax on taxable income
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label55" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">(a)</td>
                        <td class="labelcells">Surcharge</td>
                        <td class="labelcells">&nbsp;</td>
                        <td class="labelcells">&nbsp;</td>
                        <td class="labelcells">
                            <asp:Label ID="Label71" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">26
                        </td>
                        <td class="labelcells">Health and Education Cess @4%
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label56" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">27
                        </td>
                        <td class="labelcells">Total Income Tax(Incl.Surcharg &amp; Cess)
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label57" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">28
                        </td>
                        <td class="labelcells">i) Total Tax Deductible
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label58" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells">29
                        </td>
                        <td class="labelcells">ii) Total Tax Deducted
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label59" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">iii) Balance
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label60" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells" style="height: 17px"></td>
                        <td class="labelcells" style="height: 17px">iv) Income Tax Installment
                        </td>
                        <td class="labelcells" style="height: 17px"></td>
                        <td class="labelcells" style="height: 17px"></td>
                        <td class="labelcells" style="height: 17px">
                            <asp:Label ID="Label61" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">v) Cess Installment
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label62" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">vii) Refund Amount
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">
                            <asp:Label ID="Label63" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                        <td class="labelcells"></td>
                        <td class="labelcells"></td>
                        <td class="labelcells">&nbsp;
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <asp:Panel ID="Panel3" runat="server" Height="9px" Width="29px">
            <img id="IMG1" alt="Print Salary Slip" onclick="JavaScript:printPartOfPage('print_area');"
                src="print_ico.gif" />
        </asp:Panel>
    </asp:Panel>
    <%--<asp:Button ID="btnExport" runat="server" Text="Export" OnClick="btnExport_Click" />--%>
</asp:Content>
