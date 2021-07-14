<%@ Page Title="" Language="VB" MasterPageFile="~/Main2.master" AutoEventWireup="false" CodeFile="Mytest.aspx.vb" Inherits="Mytest" %>


<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<script type="text/javascript">
        $(document).ready(function () {
            function blinker() {
                $('.blink_me').fadeOut(1000).css({ "color": "red" });
                $('.blink_me').fadeIn(500).css({ "color": "white" });
            }
            setInterval(blinker, 400);
        });
</script>

    <style type="text/css">
        table {
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
            border: 0.2em solid #ddd;
            font-weight: 500;
        }

        th, td {
            text-align: left;
            padding: 0.2em;
        }

        table, th, td {
            border: 0.2em solid lightgoldenrodyellow;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:nth-child(-n+4) td:nth-child(2n+1) {
            background-color: #b9b9b0;
        }

        tr:nth-child(5) {
            background-color: #b9b9b0;
        }

        tr:nth-child(6) {
            background-color: #b9b9b0;
        }

        tr:nth-child(7) td:nth-child(1) {
            background-color: #b9b9b0;
        }

        tr:nth-child(8) td:nth-child(1) {
            background-color: #b9b9b0;
        }

        tr:nth-child(9) td:nth-child(1) {
            background-color: #b9b9b0;
        }

        tr:nth-child(10) td:nth-child(1) {
            background-color: #b9b9b0;
        }

        tr:nth-child(11) td:nth-child(1) {
            background-color: #b9b9b0;
        }

        tr:nth-child(12) td:nth-child(1) {
            background-color: #b9b9b0;
        }

        tr:nth-child(13) td:nth-child(1) {
            background-color: #b9b9b0;
        }

        tr:nth-child(14) td:nth-child(1) {
            background-color: #b9b9b0;
        }

        tr:nth-child(15) td:nth-child(1) {
            background-color: #b9b9b0;
        }

        tr:nth-child(16) td:nth-child(1) {
            background-color: #b9b9b0;
        }

        tr:nth-child(17) td:nth-child(1) {
            background-color: #b9b9b0;
        }

        tr:nth-child(18) td:nth-child(1) {
            background-color: #b9b9b0;
        }


        tr:nth-child(19) td:nth-child(1) {
            background-color: #b9b9b0;
        }

        tr:nth-child(20) td:nth-child(1) {
            background-color: #b9b9b0;
        }

tr:nth-child(21) td:nth-child(n+1) {
    background-color: #b9b9b0;
    color: red;
    font-weight: 600;
}
         tr:nth-child(23)  {
            background-color: #b9b9b0;
            color:green;
             font-weight: 600;
        }


        /*tr:nth-child(n+7) td:nth-child(11n+1) {
            background-color: #b9b9b0;
        }*/

        tr:nth-child(24) {
   
     background-color: #C29B0E;
     font-weight: 600;
        }
        tr:nth-child(25) {
   
     background-color: #C29B0E;
     font-weight: 600;
        }
    </style>

    <div id="printDiv">

        <div class="tableheader">
            PF Statement               
        </div>

        <asp:Panel ID="Panel1" runat="server" Width="100%">
            <table>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label40" runat="server"
                            Text="Employee Name"></asp:Label></td>
                    <td colspan="3">
                        <asp:Label ID="EmpName" runat="server"
                            Text="  "></asp:Label></td>
                    <td colspan="2">
                        <asp:Label ID="Label41" runat="server"
                            Text="Father Name"></asp:Label></td>
                    <td colspan="3">
                        <asp:Label ID="FatName" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td
                        colspan="2">
                        <asp:Label ID="Label8" runat="server"
                            Text="Date of Joining Service "></asp:Label></td>
                    <td colspan="3">
                        <asp:Label ID="TxtDojs" runat="server"
                            Text="  "></asp:Label></td>
                    <td
                        colspan="2">
                        <asp:Label ID="Label3" runat="server"
                            Text="Name of Nominee :"></asp:Label></td>
                    <td colspan="3">
                        <asp:Label ID="TxtNominee" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server"
                            Text="Date of Joining PF       :"></asp:Label></td>
                    <td colspan="3">
                        <asp:Label ID="TxtDojp" runat="server"
                            Text="  "></asp:Label></td>
                    <td colspan="2">
                        <asp:Label ID="Label4" runat="server"
                            Text="PF/FPF No."></asp:Label></td>
                    <td colspan="3">
                        <asp:Label ID="TxtPfVpfNo" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label2" runat="server"
                            Text="Intrest Rate                   :"></asp:Label></td>
                    <td colspan="3">
                        <asp:Label ID="TxtRate" runat="server"
                            Text="  "></asp:Label></td>
                    <td colspan="2">

                        <asp:Label ID="Label122" runat="server"
                            Text="UAN/IFSC CODE"></asp:Label></td>
                    <td colspan="3">
                        <asp:Label ID="TxtUAN" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server"
                            Text="Month Year"></asp:Label></td>
                    <td colspan="2">
                        <asp:Label ID="Label6" runat="server"
                            Text="P.F. Contribution"></asp:Label></td>
                    <td colspan="2">
                        <asp:Label ID="Label7" runat="server"
                            Text="P.F. Interest"></asp:Label></td>
                    <td colspan="2">
                        <asp:Label ID="Label9" runat="server"
                            Text="Principal Amount"></asp:Label></td>
                    <td colspan="2">

                        <asp:Label ID="Label10" runat="server"
                            Text="V.P.F."></asp:Label></td>
                    <td>
                        <asp:Label ID="Label11" runat="server"
                            Text="V.P.F."></asp:Label></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="Label12" runat="server"
                            Text="Own"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label13" runat="server"
                            Text="Employer"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label14" runat="server"
                            Text="Own"></asp:Label></td>

                    <td>
                        <asp:Label ID="Label17" runat="server"
                            Text="Employer"></asp:Label>
                    </td>

                    <td>
                        <asp:Label ID="Label15" runat="server"
                            Text="Own"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label18" runat="server"
                            Text="Employer"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label16" runat="server"
                            Text="Own"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label19" runat="server"
                            Text="Interest"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label20" runat="server"
                            Text="Total"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label21" runat="server"
                            Text="Opening Balance"></asp:Label></td>
                    <td>
                        <asp:Label ID="ConOwnOBal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpOBal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnObal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpOBal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtOwnOBal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtEmpOBal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnOBal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfEmpOBal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOBal" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Apr" runat="server"
                            Text="April"></asp:Label></td>
                    <td>
                        <asp:Label ID="ConOwnApril" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpApril" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnApril" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpApril" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtOwnApril" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtEmpApril" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnApril" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfEmpApril" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfApril" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="May" runat="server"
                            Text="May"></asp:Label></td>
                    <td>
                        <asp:Label ID="ConOwnMay" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpMay" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnMay" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpMay" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtOwnMay" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtEmpMay" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnMay" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfEmpMay" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfMay" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Jun" runat="server"
                            Text="June"></asp:Label></td>
                    <td>
                        <asp:Label ID="ConOwnJune" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpJune" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnJune" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpJune" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtOwnJune" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtEmpJune" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnJune" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfEmpJune" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfJune" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Jul" runat="server"
                            Text="July"></asp:Label></td>
                    <td>
                        <asp:Label ID="ConOwnJuly" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpJuly" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnJuly" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpJuly" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtOwnJuly" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtEmpJuly" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnJuly" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfEmpJuly" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfJuly" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Aug" runat="server"
                            Text="August"></asp:Label></td>
                    <td>
                        <asp:Label ID="ConOwnAug" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpAug" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnAug" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpAug" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtOwnAug" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtEmpAug" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnAug" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfEmpAug" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfAug" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Sep" runat="server"
                            Text="September"></asp:Label>&nbsp;</td>
                    <td>
                        <asp:Label ID="ConOwnSep" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpSep" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnSep" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpSep" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtOwnSep" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtEmpSep" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnSep" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfEmpSep" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfSep" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Oct" runat="server"
                            Text="October"></asp:Label></td>
                    <td>
                        <asp:Label ID="ConOwnOct" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpOct" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnOct" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpOct" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtOwnOct" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtEmpOct" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnOct" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfEmpOct" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOct" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Nov" runat="server"
                            Text="November"></asp:Label></td>
                    <td>
                        <asp:Label ID="ConOwnNov" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpNov" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnNov" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpNov" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtOwnNov" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtEmpNov" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnNov" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfEmpNov" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfNov" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Dec" runat="server"
                            Text="December"></asp:Label></td>
                    <td>
                        <asp:Label ID="ConOwnDec" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpDec" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnDec" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpDec" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtOwnDec" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtEmpDec" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnDec" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfEmpDec" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfDec" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Jan" runat="server"
                            Text="January"></asp:Label></td>
                    <td>
                        <asp:Label ID="ConOwnJan" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpJan" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnJan" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpJan" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtOwnJan" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtEmpJan" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnJan" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfEmpJan" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfJan" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Feb" runat="server"
                            Text="February"></asp:Label></td>
                    <td>
                        <asp:Label ID="ConOwnFeb" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpFeb" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnFeb" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpFeb" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtOwnFeb" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtEmpFeb" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnFeb" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfEmpFeb" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfFeb" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Mar" runat="server"
                            Text="March"></asp:Label></td>
                    <td>
                        <asp:Label ID="ConOwnMar" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpMar" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnMar" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpMar" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtOwnMar" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtEmpMar" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnMar" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfEmpMar" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfMar" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label34" runat="server"
                            Text="Total"></asp:Label></td>
                    <td>
                        <asp:Label ID="ConOwnTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtOwnTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtEmpTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfEmpTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfTotal" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td rowspan="2">
                        <asp:Label ID="Label38" runat="server"
                            Text="Non Refundable Loan" Width="123px"></asp:Label>
                    </td>
                    <td colspan="4"></td>
                    <td>
                        <asp:Label ID="Label35" runat="server"
                            Text="SanctNo." Width="58px"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label39" runat="server"
                            Text="Sanct.Date"></asp:Label></td>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="ConOwnNonRefLoan" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpNonRefLoan" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnNonRefLoan" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpNonRefLoan" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="LoanNo" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="LoanTakenDate" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnNonRefLoan" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfIntNonRefLoan" runat="server"
                            Text="  "></asp:Label></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label36" runat="server"
                            Text="Grand Total"></asp:Label></td>
                    <td>
                        <asp:Label ID="ConOwnGTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="ConEmpGTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntOwnGTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="IntEmpGTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtOwnGTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="AmtEmpGTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfOwnGTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfEmpGTotal" runat="server"
                            Text="  "></asp:Label></td>
                    <td>
                        <asp:Label ID="VpfGTotal" runat="server"
                            Text="  "></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="10" style="text-align: center;">
                        <asp:Label ID="Label37" runat="server"
                            Text="Your Final Provident Fund Is :"></asp:Label><asp:Label ID="FinalAmount" runat="server" class="blink_me"
                                Text="  "></asp:Label></td>

                </tr>
                <tr >
                    <td colspan="10" style="text-align: center;">
                        <asp:Label ID="Label42" runat="server"
                            Text="Your Family Pension Is :"></asp:Label>
                        <asp:Label ID="Label44" runat="server"
                            Text="( Opening +Current Bal.)"></asp:Label>
                        <asp:Label ID="FinalFPOBal" runat="server"
                            Text="  "></asp:Label>
                        <asp:Label ID="Label43" runat="server"
                            Text="+"></asp:Label>
                        <asp:Label ID="FPFMonth" runat="server"
                            Text="  "></asp:Label>
                        <asp:Label ID="Label45" runat="server"
                            Text=" ="></asp:Label>
                        <asp:Label ID="FinalFPF" runat="server" class="blink_me"
                            Text="  "></asp:Label></td>
                </tr>
            </table>
        </asp:Panel>

        <br />
    </div>
</asp:Content>



