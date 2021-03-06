<%@ Page Title="" Language="VB" MasterPageFile="~/Main2.master" AutoEventWireup="false"
    CodeFile="Jct_Payroll_SalarySlip_View.aspx.vb" Inherits="Payroll_Jct_Payroll_SalarySlip_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
    <script type ="text/javascript">


        document.addEventListener("keyup", function (e) {
            var keyCode = e.keyCode ? e.keyCode : e.which;
            if (keyCode == 44) {
                stopPrntScr();
            }
        });
        function stopPrntScr() {

            var inpFld = document.createElement("input");
            inpFld.setAttribute("value", ".");
            inpFld.setAttribute("width", "0");
            inpFld.style.height = "0px";
            inpFld.style.width = "0px";
            inpFld.style.border = "0px";
            document.body.appendChild(inpFld);
            inpFld.select();
            document.execCommand("copy");
            inpFld.remove(inpFld);
        }
        function AccessClipboardData() {
            try {
                window.clipboardData.setData('text', "Access   Restricted");
            } catch (err) {
            }
        }
        setInterval("AccessClipboardData()", 300);


        $(document).on('keydown', function (e) {
            if (e.ctrlKey && (e.key == "p" || e.charCode == 16 || e.charCode == 112 || e.keyCode == 80)) {
                alert("Sorry, you are not authorized to take a Print");
                e.cancelBubble = true;
                e.preventDefault();
                e.stopImmediatePropagation();
            }
        });
 </script>
 
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="divmaster" class="noprint">
               <div class="tileTable"  style="height: 100%;width: 100%" >
                <table cellpadding="2" cellspacing="1" style="width: 100%" class="tblMain">
                    <div id="printDiv" >
                  
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="1" style="width: 100%" class="tblMain">
                                <tr>
                                    <td class="content-sub-heading" colspan="2">Salary Slip </td>
                                </tr>
                                <tr>
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="CellWidth20">
                                        <asp:Label ID="Label52" runat="server" Text="Select Month-Year"></asp:Label>
                                    </td>
                                    <td class="CellWidth80">
                                        <div style="text-align:left;">
                                        <asp:DropDownList ID="DTP2" runat="server" AutoPostBack="True" class="btn btn-default btn-sm alignleft" >
                                            <asp:ListItem Value="January">January</asp:ListItem>
                                            <asp:ListItem Value="February">February</asp:ListItem>
                                            <asp:ListItem Value="March">March</asp:ListItem>
                                            <asp:ListItem Value="April">April</asp:ListItem>
                                            <asp:ListItem Value="May">May</asp:ListItem>
                                            <asp:ListItem Value="June">June</asp:ListItem>
                                            <asp:ListItem Value="July">July</asp:ListItem>
                                            <asp:ListItem Value="August">August</asp:ListItem>
                                            <asp:ListItem Value="September">September</asp:ListItem>
                                            <asp:ListItem Value="October">October</asp:ListItem>
                                            <asp:ListItem Value="November">November</asp:ListItem>
                                            <asp:ListItem Value="December">December</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="DTP3" runat="server" AutoPostBack="True" CssClass="btn btn-default btn-sm" >
                                            <asp:ListItem>2020</asp:ListItem>
                                            <asp:ListItem>2019</asp:ListItem>
                                        </asp:DropDownList>
                                        </div>
                                        <asp:Label ID="display" runat="server" BackColor="Transparent" ForeColor="WhiteSmoke" Visible="False" Width="103px"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>

                        </td>
                    </tr>
                        <tr>
                            <td>
                            <div id="print_area">
                                <table id="Panel2" cellpadding="10" cellspacing="10" style="width: 100%; height: 1px" >
                                    <tr>
                                        <td style="width: 100%; height: 21px">
                                            <asp:Panel ID="Panel1" runat="server" Width="100%">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label8" runat="server" Height="13px" Text="Month"></asp:Label>
                                                        </td>
                                                        <td colspan="3">
                                                            <asp:Label ID="Month" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label17" runat="server" Height="13px" Text="Year"></asp:Label>
                                                        </td>
                                                        <td colspan="3" style="height: 10px;">
                                                            <asp:Label ID="Year" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 10px">
                                                            <asp:Label ID="Label23" runat="server" Height="13px" Text="Name"></asp:Label>
                                                        </td>
                                                        <td colspan="3" style="height: 10px;">
                                                            <asp:Label ID="Empname" runat="server"></asp:Label>
                                                        </td>
                                                        <td style="width: 108px; height: 10px">
                                                            <asp:Label ID="Label24" runat="server" Height="13px" Text="Designation" Visible ="false"></asp:Label>
                                                        </td>
                                                        <td colspan="3" style="height: 10px;">
                                                            <asp:Label ID="Desg" runat="server" Visible ="false" Height="13px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 1px">
                                                            <asp:Label ID="Label26" runat="server" Height="13px" Text="A/C No."></asp:Label>
                                                        </td>
                                                        <td colspan="2">
                                                            <asp:Label ID="BcodeNo" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                        <td style="width: 51px; height: 1px;"></td>
                                                        <td style="width: 108px; height: 1px">
                                                            <asp:Label ID="Label27" runat="server" Height="13px" Text="PAN"></asp:Label>
                                                        </td>
                                                        <td style="width: 2px; height: 1px;">
                                                            <asp:Label ID="Pan" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                        <td style="width: 102px; height: 1px"></td>
                                                        <td style="width: 85px; height: 1px;"></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 10px;">
                                                            <asp:Label ID="Label3" runat="server" Height="13px" Text="Days Att."></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="daysattnd" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                        <td style="width: 55px; height: 10px;">
                                                            <asp:Label ID="Label12" runat="server" Height="13px" Text="Basic"></asp:Label>
                                                        </td>
                                                        <td style="width: 51px; height: 10px;">
                                                            <asp:Label ID="Salary" runat="server" Height="13px" Text="Label"></asp:Label>
                                                        </td>
                                                        <td >
                                                            <asp:Label ID="Salary1lbl" runat="server" Height="13px" Text="Salary Advance"></asp:Label>
                                                        </td>
                                                        <td style="width: 2px; height: 10px;">
                                                            <asp:Label ID="Salary1" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                        <td style="width: 102px; height: 10px;">
                                                            <asp:Label ID="Label39" runat="server" Height="13px" Text="PF"></asp:Label>
                                                        </td>
                                                        <td style="width: 85px; height: 10px;">
                                                            <asp:Label ID="PF" runat="server" Height="13px" Width="65px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 13px;">
                                                            <asp:Label ID="Label5" runat="server" Height="13px" Text="PL"></asp:Label>
                                                        </td>
                                                        <td style="width: 59px; height: 13px;">
                                                            <asp:Label ID="Pl" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                        <td style="width: 55px; height: 13px;"><%--<asp:Label ID="Label2" runat="server" Height="13px" Text="DA"></asp:Label>--%>
                                                            <asp:Label ID="Label13" runat="server" Height="13px" Text="FDA"></asp:Label>
                                                        </td>
                                                        <td style="width: 51px; height: 13px;">
                                                            <asp:Label ID="FDA" runat="server" Height="13px" Text="Label"></asp:Label>
                                                        </td>
                                                        <td style="width: 108px; height: 13px;"><%--<asp:Label ID="Label29" runat="server" Height="13px" Text="Cycle Rent" 
                                                        ></asp:Label>--%>
                                                            <asp:Label ID="Label89" runat="server" Height="13px" Text="Adv. StaffExp."></asp:Label>
                                                        </td>
                                                        <td style="width: 2px; height: 13px;"><%--<asp:Label ID="cyclerent" runat="server" Height="13px"></asp:Label>--%>
                                                            <asp:Label ID="AdvanceStaffExp" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                        <td style="width: 102px; height: 13px;">
                                                            <asp:Label ID="Label40" runat="server" Height="13px" Text="VPF"></asp:Label>
                                                        </td>
                                                        <td style="width: 85px; height: 13px;">
                                                            <asp:Label ID="VPF" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px;">
                                                            <asp:Label ID="Label6" runat="server" Height="13px" Text="CL"></asp:Label>
                                                        </td>
                                                        <td style="width: 59px;">
                                                            <asp:Label ID="Cl" runat="server" Text="Label" Width="48px"></asp:Label>
                                                        </td>
                                                        <td style="width: 70px;"><%--<asp:Label ID="Label4" runat="server" Height="13px" Text="SPL D.A." 
                                                        Width="56px"></asp:Label>--%>
                                                            <asp:Label ID="Label15" runat="server" Height="13px" Text="Pers Allwnce"></asp:Label>
                                                        </td>
                                                        <td style="width: 51px;">
                                                            <asp:Label ID="perallow" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                        <td style="width: 108px;"><%--<asp:Label ID="Label30" runat="server" Height="13px" Text="Furn. Rent" 
                                                        ></asp:Label>--%>
                                                            <asp:Label ID="Label91" runat="server" Height="13px" Text="BankLoan."></asp:Label>
                                                        </td>
                                                        <td style="width: 2px;"><%--<asp:Label ID="FurRent" runat="server" Height="13px" ></asp:Label>--%>
                                                            <asp:Label ID="BankLoan" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                        <td style="width: 102px;"><%--<asp:Label ID="Label41" runat="server" Height="13px" Text="F.P.F." Width="48px"></asp:Label>--%>
                                                            <asp:Label ID="Label44" runat="server" Height="13px" Text="E.S.I"></asp:Label>
                                                        </td>
                                                        <td style="width: 85px;"><%--<asp:Label ID="FPF" runat="server" Height="13px" ></asp:Label>--%>
                                                            <asp:Label ID="ESI" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 1px;">
                                                            <asp:Label ID="Label7" runat="server" Height="13px" Text="SL"></asp:Label>
                                                        </td>
                                                        <td style="width: 59px; height: 1px;">
                                                            <asp:Label ID="SL" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                        <td style="width: 55px; height: 1px;">
                                                            <asp:Label ID="Label18" runat="server" Height="13px" Text="House Rent" Width="71px"></asp:Label>
                                                        </td>
                                                        <td style="width: 51px; height: 1px;">
                                                            <asp:Label ID="HouseRent" runat="server" Height="13px" Text="Label"></asp:Label>
                                                        </td>
                                                        <td style="width: 108px; height: 1px;"><%--<asp:Label ID="Label31" runat="server" Height="13px" Text="Tel. Charge" 
                                                        ></asp:Label>--%>
                                                            <asp:Label ID="Label42" runat="server" Height="13px" Text="P.F.Loan"></asp:Label>
                                                        </td>
                                                        <td style="width: 2px; height: 1px;"><%--<asp:Label ID="TelChrg" runat="server" Height="13px" Width="2px"></asp:Label>--%>
                                                            <asp:Label ID="PFLoan" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                        <td style="width: 102px; height: 1px;">
                                                            <asp:Label ID="Label43" runat="server" Height="13px" Text=" LIC&RD&TataAg"></asp:Label>
                                                        </td>
                                                        <td style="width: 85px; height: 1px;">
                                                            <asp:Label ID="LIC" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 2px;">
                                                            <asp:Label ID="Label77" runat="server" Height="13px" Text="Absent"></asp:Label>
                                                        </td>
                                                        <td style="width: 59px; height: 2px;">
                                                            <asp:Label ID="Absent" runat="server" Text="Label" Width="43px"></asp:Label>
                                                        </td>
                                                        <td style="width: 55px; height: 2px;"><%-- <asp:Label ID="Label14" runat="server" Height="13px" Text="WB/AD/Inc." 
                                                        Width="72px"></asp:Label>--%>
                                                            <asp:Label ID="Label21" runat="server" Height="13px" Text="ColonyAlw."></asp:Label>
                                                        </td>
                                                        <td style="width: 51px; height: 2px;"><%--<asp:Label ID="WBADHOC" runat="server" Height="13px" Text="Label" ></asp:Label>--%>
                                                            <asp:Label ID="ColonyElec" runat="server" Height="13px" Text="Label"></asp:Label>
                                                        </td>
                                                        <td style="width: 108px; height: 2px;">
                                                            <asp:Label ID="Label46" runat="server" Height="13px" Text="Society Loan"></asp:Label>
                                                        </td>
                                                        <td style="width: 2px; height: 2px;">
                                                            <asp:Label ID="TWCCSOCIETY" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                        <td style="width: 102px; height: 2px;">
                                                            <asp:Label ID="Label45" runat="server" Height="13px" Text="Rent Receivable"></asp:Label>
                                                        </td>
                                                        <td style="width: 85px; height: 2px;">
                                                            <asp:Label ID="RentRece" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 7px;">
                                                            <asp:Label ID="Label9" runat="server" Height="13px" Text="LWP"></asp:Label>
                                                        </td>
                                                        <td style="width: 59px; height: 7px;">
                                                            <asp:Label ID="LWP" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                        <td style="width: 55px; height: 7px;">
                                                            <asp:Label ID="Label10" runat="server" Height="13px" Text="Uniform Allw"></asp:Label>
                                                        </td>
                                                        <td style="width: 51px; height: 7px;">
                                                            <asp:Label ID="Uniform" runat="server" Height="13px" Text=" "></asp:Label>
                                                        </td>
                                                        <td style="width: 108px; height: 7px;">
                                                            <asp:Label ID="Lable91" runat="server" Height="13px" Text="Vehicle Crg."></asp:Label>
                                                        </td>
                                                        <td style="width: 2px; height: 7px;">
                                                            <asp:Label ID="VehicleCrg" runat="server" Height="13px" Text="Label"></asp:Label>
                                                        </td>
                                                        <td style="width: 102px; height: 7px;">
                                                            <asp:Label ID="Label90" runat="server" Height="13px" Text="Prof Tax"></asp:Label>
                                                        </td>
                                                        <td style="width: 85px; height: 7px;">
                                                            <asp:Label ID="ProfessionalTax" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 11px;">
                                                            <asp:Label ID="Label11" runat="server" Height="13px" Text="Pays Days"></asp:Label>
                                                        </td>
                                                        <td style="width: 59px; height: 11px;">
                                                            <asp:Label ID="PaysDays" runat="server" Text="Label" Width="46px"></asp:Label>
                                                        </td>
                                                        <td style="width: 55px; height: 11px;">
                                                            <asp:Label ID="Label88" runat="server" Height="13px" Text="Furnit Allw"></asp:Label>
                                                        </td>
                                                        <td style="width: 51px; height: 11px;">
                                                            <asp:Label ID="FurRentallw" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                        <td style="width: 108px; height: 11px;">
                                                            <asp:Label ID="Label87" runat="server" Height="13px" Text="Tea Crg."></asp:Label>
                                                        </td>
                                                        <td style="width: 2px; height: 11px;">
                                                            <asp:Label ID="lblBusTea" runat="server"></asp:Label>
                                                        </td>
                                                        <td style="width: 102px; height: 11px;">
                                                            <asp:Label ID="Label48" runat="server" Height="13px" Text="Income-Tax"></asp:Label>
                                                        </td>
                                                        <td style="width: 85px; height: 11px;">
                                                            <asp:Label ID="IncomeTax" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 10px;"><%--<asp:Label ID="Label28" runat="server" BackColor="Transparent" Height="13px" 
                                                        Text="Actual Basic" ></asp:Label>--%></td>
                                                        <td style="width: 59px; height: 10px;"><%--<asp:Label ID="Basic" runat="server" Text="Label" ></asp:Label>--%></td>
                                                        <td style="width: 55px; height: 10px;">
                                                            <asp:Label ID="Label83" runat="server" Text="LTAAlw."></asp:Label>
                                                        </td>
                                                        <td style="width: 51px; height: 10px;">
                                                            <asp:Label ID="LTAMED" runat="server" Height="13px" Text="Label"></asp:Label>
                                                        </td>
                                                        <td style="width: 108px; height: 10px;">
                                                            <asp:Label ID="Label94" runat="server" Text="Elec Chrg."></asp:Label>
                                                        </td>
                                                        <td style="width: 2px; height: 10px;">
                                                            <asp:Label ID="electric" runat="server" Height="13px" Text="Label"></asp:Label>
                                                        </td>
                                                        <td style="width: 102px; height: 10px;">

                                                        <asp:Label ID="Label1" runat="server" Height="13px" Text="Mob+Tel Crg."></asp:Label>

                                                        </td>
                                                        <td style="width: 85px; height: 10px;">
                                                            
                                                            <asp:Label ID="lblmobtelcrg" runat="server" Height="13px" ></asp:Label>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 9px;"></td>
                                                        <td style="width: 59px; height: 9px;"></td>
                                                        <td style="width: 55px; height: 9px;"><%--<asp:Label ID="Label19" runat="server" Height="13px" Text="Tran Allow" 
                                                        Width="67px"></asp:Label>--%>
                                                            <asp:Label ID="Label16" runat="server" Height="13px" Text="Arrear"></asp:Label>
                                                        </td>
                                                        <td style="width: 51px; height: 9px;"><%--<asp:Label ID="lbl2" runat="server" Height="13px" Text="Label" ></asp:Label>--%>
                                                            <asp:Label ID="Arrear" runat="server" Height="13px" Text="Label"></asp:Label>
                                                        </td>
                                                        <td style="width: 108px; height: 9px;">
                                                            <asp:Label ID="Label34" runat="server" Height="13px" Text="Mess Expenses"></asp:Label>
                                                        </td>
                                                        <td style="width: 2px; height: 9px;">
                                                            <asp:Label ID="Messexpense" runat="server" Height="13px" Text="Label"></asp:Label>
                                                        </td>
                                                        <td style="width: 102px; height: 9px;"><%--<asp:Label ID="Label82" runat="server" Height="13px" Text="C.T.D./R.D." 
                                                        Width="95px"></asp:Label>--%>
                                                            <asp:Label ID="Labelasdasd984" runat="server" Height="13px" Text="BankLoanCovid"></asp:Label>
                                                        </td>
                                                        <td style="width: 85px; height: 9px;"><%--<asp:Label ID="CTDRD" runat="server" Height="13px" ></asp:Label>--%>
                                                            <asp:Label ID="lblBankLoanCovid" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 8px;"></td>
                                                        <td style="width: 59px; height: 8px;"></td>
                                                        <td style="width: 55px; height: 5px;"> 
                                                            <asp:Label ID="Label983" runat="server" Height="13px" Text="Spl.Alw"></asp:Label>
                                                        </td>
                                                        <td style="width: 51px; height: 5px;">
                                                            <asp:Label ID="lblSplAlw" runat="server" Height="13px" Text=""></asp:Label>
                                                        </td>
                                                        <td style="width: 108px; height: 8px;"><%--<asp:Label ID="Label80" runat="server" Height="13px" Text="ABP Install." 
                                                        ></asp:Label>--%>
                                                            <asp:Label ID="Label95" runat="server" Height="13px" Text="Medicine Crg."></asp:Label>
                                                        </td>
                                                        <td style="width: 2px; height: 8px;"><%--<asp:Label ID="ABPINST" runat="server" Height="13px" Text="Label" ></asp:Label>--%>
                                                            <asp:Label ID="Medicine" runat="server" Height="13px" Text="Label"></asp:Label>
                                                        </td>
                                                        <td style="width: 102px; height: 8px;">&nbsp; </td>
                                                        <td style="width: 85px; height: 8px;">&nbsp; </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 2px;"></td>
                                                        <td style="width: 59px; height: 2px;"></td>
                                                        <td style="width: 55px; height: 2px;">&nbsp; </td>
                                                        <td style="width: 51px; height: 2px;">&nbsp; </td>
                                                        <td style="width: 108px; height: 2px;"><%--<asp:Label ID="Label34" runat="server" Height="13px" Text="Security Deposit" 
                                                        ></asp:Label>--%>
                                                            <asp:Label ID="Label35" runat="server" Height="13px" Text="Club+Cafe.Crg."></asp:Label>
                                                        </td>
                                                        <td style="width: 2px; height: 2px;">
                                                            <asp:Label ID="Clubcrg" runat="server" Height="13px" Text="Label"></asp:Label>
                                                        </td>
                                                        <td style="width: 102px; height: 2px;">&nbsp; </td>
                                                        <td style="width: 85px; height: 2px;">&nbsp; </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 5px;"></td>
                                                        <td style="width: 59px; height: 5px;"></td>
                                                        <td style="width: 55px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 51px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 108px; height: 5px;"><%--<asp:Label ID="Label84" runat="server" Text="Int. Con. Charges" Width="120px"></asp:Label>--%>
                                                            <asp:Label ID="Label85" runat="server" Style="height: 13px" Text="Internet Crg." Width="120px"></asp:Label>
                                                        </td>
                                                        <td style="width: 2px; height: 5px;"><%--<asp:Label ID="LblIntConChr" runat="server" Height="13px" Text="Label" 
                                                        ></asp:Label>--%>
                                                            <asp:Label ID="Internet" runat="server" Height="13px" Text="Label"></asp:Label>
                                                        </td>
                                                        <td style="width: 102px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 85px; height: 5px;">&nbsp; </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 59px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 55px; height: 5px;"> 
                                                            <asp:Label ID="Label79" runat="server" Height="13px" Text="Other Earnings"></asp:Label>

                                                        </td>
                                                        <td style="width: 51px; height: 5px;"><asp:Label ID="othallow" runat="server" Height="13px"></asp:Label> </td>
                                                        <td style="width: 108px; height: 5px;">
                                                            <asp:Label ID="Label96" runat="server" Height="13px" Text="Med Insur."></asp:Label>
                                                        </td>
                                                        <td style="width: 2px; height: 5px;">
                                                            <asp:Label ID="MedicalInsurance" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                        <td style="width: 102px; height: 5px;">
                                                            <asp:Label ID="Label49" runat="server" Height="13px" Text="Other Ded."></asp:Label>
                                                        </td>
                                                        <td style="width: 85px; height: 5px;">
                                                            <asp:Label ID="OTH" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 59px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 55px; height: 5px;">
                                                            <%--<asp:Label ID="Label2as0" runat="server"  Font-Names="Tahoma" 
                                                         ForeColor="#404040" Height="19px" 
                                                        Text="NetGrossSalary" Width="115px"></asp:Label>--%>
                                                             <asp:Label ID="Label22" runat="server" CssClass="HighlightLabel" Height="17px" Text="Gross Salary"></asp:Label>
                                                            
                                                        </td>
                                                        <td style="width: 51px; height: 5px;">
                                                           <%--  <asp:Label ID="netgrosssalary" runat="server" Font-Names="Tahoma" 
                                                        ForeColor="#404040" Height="13px" ></asp:Label>--%>

                                                          <asp:Label ID="GrossSal" runat="server" CssClass="HighlightLabel" ForeColor="Green" Height="17px" Text="0"></asp:Label>
                                                            
                                                        </td>
                                                        <td style="width: 108px; height: 5px;"><%--<asp:Label ID="Label86" runat="server" Text="Claim Deduction" Width="120px"></asp:Label>--%>
                                                            <asp:Label ID="Label97" runat="server" Height="13px" Text="WorkerWelf+Club"></asp:Label>
                                                        </td>
                                                        <td style="width: 2px; height: 5px;"><%--<asp:Label ID="Lblclaimded" runat="server" Height="13px" ></asp:Label>--%>
                                                            <asp:Label ID="LabourWelfare" runat="server" Height="13px"></asp:Label>
                                                        </td>
                                                        <td style="width: 102px; height: 5px;">
                                                            <asp:Label ID="Label50" runat="server" CssClass="HighlightLabel" Height="17px" Text="Total Deductions"></asp:Label>
                                                        </td>
                                                        <td style="width: 85px;">
                                                            <asp:Label ID="totaldeductions" runat="server" CssClass="HighlightLabel" ForeColor="Red" Height="17px" Width="100%">0</asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 5px;"></td>
                                                        <td style="width: 59px; height: 5px;"></td>
                                                        <td style="width: 55px; height: 5px;">

                                                            <asp:Label ID="Label2as0" runat="server"  Font-Names="Tahoma" 
                                                         ForeColor="#404040" Height="19px" 
                                                        Text="NetGrossSalary" Width="115px"></asp:Label>


                                                           <%-- <asp:Label ID="Label22" runat="server" CssClass="HighlightLabel" Height="17px" Text="Gross Salary"></asp:Label>--%>
                                                        </td>
                                                        <td style="width: 51px; height: 5px;">

                                                               <asp:Label ID="netgrosssalary" runat="server" Font-Names="Tahoma" 
                                                        ForeColor="#404040" Height="13px" ></asp:Label>


                                                           <%-- <asp:Label ID="GrossSal" runat="server" CssClass="HighlightLabel" ForeColor="Green" Height="17px" Text="0"></asp:Label>--%>
                                                        </td>
                                                        <td style="width: 108px; height: 5px;"></td>
                                                        <td style="width: 2px; height: 5px;"></td>
                                                        <td style="width: 102px; height: 5px;">
                                                            <asp:Label ID="Label51" runat="server" CssClass="HighlightLabel" Height="17px" Text="Net Salary"></asp:Label>
                                                        </td>
                                                        <td style="width: 85px; height: 5px;">
                                                            <asp:Label ID="NetSalary" runat="server" CssClass="HighlightLabel" ForeColor="Blue" Height="17px" Width="100%">0</asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 59px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 55px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 51px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 108px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 2px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 102px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 85px; height: 5px;">&nbsp; </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 77px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 59px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 55px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 51px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 108px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 2px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 102px; height: 5px;">&nbsp; </td>
                                                        <td style="width: 85px; height: 5px;">&nbsp; </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                                </td>
                        </tr>
                    
                </table>
                    </div>
                <asp:Panel ID="Panel3" runat="server" Height="9px" Width="29px">
                    <img id="IMG1" alt="Print Salary Slip" onclick="JavaScript:printPartOfPage('print_area');"
                        src="print_ico.gif" />
                </asp:Panel>
                <!-- <input type = "button" ID="Button1" runat="server" Value="Print" onclick="JavaScript:printPartOfPage('print_area');" /></td> -->
            </div>
            <br />
            <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="2000" OnTick="Timer1_Tick">
            </asp:Timer>
            <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        <br />
    </p>
</asp:Content>
