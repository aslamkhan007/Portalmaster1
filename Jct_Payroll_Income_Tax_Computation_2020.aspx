<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="Jct_Payroll_Income_Tax_Computation_2020.aspx.cs" Inherits="Jct_Payroll_Income_Tax_Computation_2020" %>


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


        .tabs {
            width: 90%;
            height: auto;
            margin: 0 auto;
        }

            /* tab list item */
            .tabs .tabs-list {
                list-style: none;
                margin: 0px;
                padding: 0px;
            }

                .tabs .tabs-list li {
                    width: 33%;
                    float: left;
                    margin: 0px;
                    margin-right: 2px;
                    padding: 10px 5px;
                    text-align: center;
                    background-color: #C29B0E;
                    border-radius: 3px;
                    margin-top: 5px;
                }

                    .tabs .tabs-list li:hover {
                        cursor: pointer;
                    }

                    .tabs .tabs-list li a {
                        text-decoration: none;
                        color: white;
                    }

            /* Tab content section */
            .tabs .tab {
                display: none;
                clear: both;
            }

                .tabs .tab h3 {
                    border-bottom: 3px solid cornflowerblue;
                    letter-spacing: 1px;
                    font-weight: normal;
                    padding: 5px;
                }

                .tabs .tab p {
                    line-height: 20px;
                    letter-spacing: 1px;
                }

        /* When active state */
        .active {
            display: block !important;
        }

        .tabs .tabs-list li.active {
            background-color: lavender !important;
            color: black !important;
        }

        .active a {
            color: black !important;
            font-weight:bold;
        }
       

        /* media query */
        @media screen and (max-width:360px) {
            .tabs {
                margin: 0;
                width: 96%;
            }

                .tabs .tabs-list li {
                    width: 80px;
                }
        }


        #table10 {
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
            border: 1px solid #ddd;
            
        }
        div#one,div#two,div#three,div#four,div#five,div#six,div#seven,div#eight{
            margin-top: 0.9em;
        }

        div#two,div#four,div#six,div#eight{
            font-weight: bold;
        }


            #table10 th, #table10 td {
                text-align: left;
                padding: 8px;
            }

            #table10 > tbody > tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            #table10 thead {
                background-color: #f2f2f2;
            }


        div#7 > ul,  li {
            list-style-type : circle;
        }

.alert {
  padding: 10px;
  background-color: #6caa15;
  color: white;
  opacity: 1;
  transition: opacity 0.6s;
  margin-bottom: 15px;
}

.alert.success {background-color: #4CAF50;}



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



        var htmlToPrint = '' +
    '<style type="text/css">' +
    '.k {' +
     'text-align: right;' +
    '}' +
    '</style>';

        htmlToPrint += printContent.outerHTML;
        printWindow.document.write(htmlToPrint);
        printWindow.document.close();
        printWindow.focus();
        printWindow.print();
        printWindow.close();
    }
    </script>


    <script language="javascript" type="text/javascript">

        function AccessClipboardData() {
            try {
                window.clipboardData.setData('text', "No print data");
            } catch (err) {

            }

        }
    </script>


    <script type="text/javascript">
        $(document).ready(function () {

            $(".tabs-list li a").click(function (e) {
                e.preventDefault();
            });

            $(".tabs-list li").click(function () {
                var tabid = $(this).find("a").attr("href");
                $(".tabs-list li,.tabs div.tab").removeClass("active");   // removing active class from tab

                $(".tab").hide();   // hiding open tab
                $(tabid).show();    // show tab
                $(this).addClass("active"); //  adding active class to clicked tab

            });

        });
    </script>


    <div class="tabs">
        <ul class="tabs-list">
            <li class="active"><a href="#tab1">Instructions</a></li>
            <li><a href="#tab2">IncomeTax</a></li>
            <li><a href="#tab3">Acceptance</a></li>
        </ul>

        <div id="tab1" class="tab active">
        

                 <table style="width: 100%;">
                <tr>
                    <td class="content-sub-heading" style="text-align: left;" colspan="2">Instructions
                    </td>
                </tr>
            </table>

            <div id="one">
                It is informed that during FY 2020-21 one can opt for old or new scheme of tax calculation as per provisions of Income Tax Act . Tax calculation under both schemes are as per instruction sheet on the basis of details available in our system. Further, one can visit   <span style = "background-color:#eac8c8;  text-decoration:underline; "><b><a style="font-weight: bold;color:red !important; "  target="_blank" href="https://www.incometaxindiaefiling.gov.in/Tax_Calculator/index.html?lang=eng">www.incometaxindiaefiling.gov.in </a></b></span> to check the tax under old and new scheme after considering its further investments/ Deductions. Therefore, you are requested to go through the same give your consent and file your declaration for old or new scheme enabling us to deduct tax accordingly.
            </div>

            <div id="two">
                New Scheme:- The tax rates under new tax regime scheme have been given below : -
            </div>

            <div id="three">
                <table id="table10">
                    <thead>
                        <tr>
                            <th>Total income (Rs.)
                            </th>
                            <th>New Scheme    
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Upto 2,50,000
                            </td>
                            <td>Nil
                            </td>
                        </tr>

                        <tr>
                            <td>From 2,50,001 to 5,00,000
                            </td>
                            <td>5%
                            </td>

                        </tr>
                        <tr>
                            <td>From 5,00,001 to 7,50,000
                            </td>
                            <td>10%
                            </td>

                        </tr>

                        <tr>
                            <td>From 7,50,001 to 10,00,000
                            </td>
                            <td>15%
                            </td>
                        </tr>

                        <tr>
                            <td>From 10,00,001 to 12,50,000
                            </td>
                            <td>20%
                            </td>
                        </tr>

                        <tr>

                            <td>From 12,50,001 to 15,00,000
                            </td>
                            <td>25%
                            </td>
                        </tr>

                        <tr>
                            <td>Above 15,00,000
                            </td>
                            <td>30%
                            </td>

                        </tr>
                    </tbody>

                </table>
            </div>

            <div id="four">
                Under the new tax regime, taxpayers have to forgo the following exemptions and deductions:
            </div>



            <div id="five">
                <ul>
                    <li> Leave travel allowance</li>
                    <li>House rent allowance</li>
                    <li>Standard deduction/Professional tax deduction/Entertainment allowance</li>
                    <li>Interest on housing loan</li>
                    <li>Chapter VI-A deduction other than a contribution to the pension fund by employer and 80JJAA</li>
                    <li>No set-off of any loss under the head house property with any other head of income</li>                    
                </ul>               
                
            </div>


            <div id="six">
                But, Following are some of the Deductions/ Exemptions that can be claimed :-
            </div>


            <div id="seven">
                <ul>
                    
                <li>Agriculture Income </li>
                <li>Death cum Retirement Gratuity (Govt employees no limit, Other Rs.20 lakhs) </li>
                <li>Leave Encashment on retirement ( Govt employees no limit, Other Rs.3 lakhs) </li>
                <li>Commutation of Pension </li>
                <li>Standard Deduction of 30% of Rental Income, under House Property head </li>
                    </ul>
            </div>


            <div id="eight">
                Old Scheme:-In case person does not opt for the new scheme tax rate and deductions will be applicable as per earlier provisions of Income Tax Act.
            </div>

        </div>

        <div id="tab2" class="tab">
           <asp:Panel ID="pnlPerson" runat="server">
                <table class="mytable">
                    <tr>                        
                        <td class="content-sub-heading"  style="text-align: left;" colspan="4">Tax Computation :
                        </td>
                    </tr>

                </table>

                <div id="print_area">
                    <table style="width: 80%">

                        <tr>
                            <td class="mys" style="text-align: center;" colspan="8">JCT Limited</td>

                        </tr>
                        <tr>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">Financial Year
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label66" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells">Empcode
                            </td>
                            <td class="labelcells">&nbsp;</td>
                            <td class="labelcells">
                                <asp:Label ID="Label67" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells">&nbsp;</td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">EmployeeName
                            </td>
                            <td class="labelcells">Dept
                            </td>
                            <td class="labelcells">Desg
                            </td>
                            <td class="labelcells">&nbsp;</td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;</td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label68" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label70" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label69" runat="server"></asp:Label>
                                
                            </td>
                            <td class="labelcells">&nbsp;</td>
                            <td class="labelcells">
                                <asp:Label ID="Label103" runat="server">PrvCal</asp:Label>
                                <a></a>
                            </td>
                            <td class="labelcells">&nbsp;</td>
                            <td class="labelcells">NewCal
                        <a></a>
                            </td>
                        </tr>
                        <tr>
                            <td class="mys" colspan="6">Computation Of Tax On The Income Chargeable Under The Head 'Salaries' </td>
                            <td class="mys">&nbsp;</td>
                            <td class="mys">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells" colspan="5">&nbsp;
                            </td>
                            <td class="labelcells" rowspan="64">
                                <br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |</td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">Particulars
                            </td>
                            <td class="labelcells">Rupees
                            </td>
                            <td class="labelcells">Rupees
                            </td>
                            <td class="labelcells" rowspan="64">|<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |<br />
                                |</td>
                            <td class="labelcells">Rupees
                            </td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells">1
                            </td>
                            <td class="labelcells">Salary, Leave Encahment,VPA and Bonus etc.
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;</td>
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
                            <td class="labelcells">&nbsp;</td>
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
                            <td class="labelcells">&nbsp;</td>
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
                            <td class="labelcells"></td>
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
                            <td class="labelcells k">
                                <asp:Label ID="Label5001" runat="server"></asp:Label>
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
                            <td class="labelcells">&nbsp;</td>
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
                            <td class="labelcells">&nbsp;</td>
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
                            <td class="labelcells">&nbsp;</td>
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
                            <td class="labelcells">&nbsp;</td>
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
                            <td class="labelcells">&nbsp;</td>
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
                            <td class="labelcells" style="height: 17px">&nbsp;</td>
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
                            <td class="labelcells k">
                                <asp:Label ID="Label5002" runat="server"></asp:Label>
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
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp &nbsp &nbsp &nbsp A) Accomodation
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label17" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label50242" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp &nbsp &nbsp &nbsp B) Furniture
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label18" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label50243" runat="server"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp; &nbsp; &nbsp; &nbsp; C) Water
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label20" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label50244" runat="server"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp &nbsp &nbsp &nbsp D) LTA
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label22" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label50245" runat="server"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp &nbsp &nbsp &nbsp E) Conveyance
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label24" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label5003" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp; &nbsp; &nbsp; &nbsp; F) Reimb.of Ins &amp; Road Tax
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label25" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label50246" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">G) Int.Credited to PF A/C in excess of the rate
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label26" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells k">
                                <asp:Label ID="Label50241" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">fixed by the central government and gratuity
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>

                        <tr>
                            <td class="labelcells">&nbsp;</td>
                            <td class="labelcells">H) PF /Superanuation u/s&nbsp; 17(2)(Vii) Taxable above 750000</td>
                            <td class="labelcells">
                                <asp:Label ID="Labelrepeat" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells">&nbsp;</td>
                            <td class="labelcells">&nbsp;</td>
                            <td class="labelcells k">
                                <asp:Label ID="Label5011" runat="server"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">***sub total ****
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label27" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label50247" runat="server"></asp:Label>
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
                            <td class="labelcells k">
                                <asp:Label ID="Label5004" runat="server"></asp:Label>
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
                            <td class="labelcells">&nbsp;</td>
                        </tr>

                        <tr>
                            <td class="labelcells">12
                            </td>
                            <td class="labelcells">Std. Deduction of Rs. 50000 U/S 16(ia)
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label31" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label5005" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">Tax on Employment u/s 16(iii)
                            </td>
                            <td class="labelcells">

                                <asp:Label ID="Label63" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label32" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label5006" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells">13
                            </td>
                            <td class="labelcells">Deductions Eligible U/S 80C in respect
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">of following Investments/Savings
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp &nbsp &nbsp &nbsp A) Payment of Life Insurance Premium
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label50248" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp &nbsp &nbsp &nbsp B) Contribution to Unit Linked Ins. Plan
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label33" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp &nbsp &nbsp &nbsp C) Contributio to Provident Fund & V.P.F
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label34" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp &nbsp &nbsp &nbsp D) Contribution to Public Provident Fund
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label35" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">&nbsp;</td>
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
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp &nbsp &nbsp &nbsp F) Investment Made in Bank FDR Schema
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label38" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp &nbsp &nbsp &nbsp G) Re-payment of Housing Loan {HLA}
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label39" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp &nbsp &nbsp &nbsp H) Investment in ELSS (Infra)
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label40" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp &nbsp &nbsp &nbsp I) Tussion Fee
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label41" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp &nbsp &nbsp &nbsp J) Pension Fund u/s 80CCC
                            </td>
                            <td class="labelcells">

                                <asp:Label ID="Label50249" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>

                        <tr>
                            <td class="labelcells">14
                            </td>
                            <td class="labelcells">&nbsp; &nbsp; &nbsp; &nbsp; i) Total (A) to (J)
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label42" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells k">
                                <asp:Label ID="Label5007" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells">15
                            </td>
                            <td class="labelcells">Balance
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label43" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label5008" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">Deduction u/s 80CCF (Infra)
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label44" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells">16
                            </td>
                            <td class="labelcells">Deduction u/s 80D (Rest.to Rs.50000)
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label45" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells">17
                            </td>
                            <td class="labelcells">Deduction u/s 80DD(Restricted to Rs.100000)
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label46" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells">18
                            </td>
                            <td class="labelcells">Deduction u/s 80E
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label47" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells">19
                            </td>
                            <td class="labelcells">Deduction u/s 80G
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label48" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells">20
                            </td>
                            <td class="labelcells">Deduction u/s 80U (Restricted to Rs.100000)
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label49" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells">21
                            </td>
                            <td class="labelcells">Deduction u/s 80CCD (Restricted to Rs.50000)
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label50" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells">22
                            </td>
                            <td class="labelcells">** Total Admissible Deductions **
                            </td>
                            <td class="labelcells">
                                <asp:Label ID="Label51" runat="server"></asp:Label>
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells k"></td>
                        </tr>

                        <tr>
                            <td class="labelcells">23
                            </td>
                            <td class="labelcells">** Net Taxable Income **
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label52" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label5009" runat="server"></asp:Label>

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
                            <td class="labelcells k">
                                <asp:Label ID="Label5013" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells">24
                            </td>
                            <td class="labelcells">Income Tax on taxable income
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label53" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label5012" runat="server"></asp:Label>

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
                            <td class="labelcells k">
                                <asp:Label ID="Label5015" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells">25
                            </td>
                            <td class="labelcells">Health and Education Cess @4%
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label55" runat="server"></asp:Label>


                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label5014" runat="server"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells">26
                            </td>
                            <td class="labelcells">Total Income Tax(Incl.Surcharg &amp; Cess)
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label56" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label5016" runat="server"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells">27
                            </td>
                            <td class="labelcells"> Total Tax Deductible
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label57" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label5017" runat="server"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells">28
                            </td>
                            <td class="labelcells">i) Total Tax Deducted
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label58" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label5018" runat="server"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">ii) Balance
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label59" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label5019" runat="server"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells" style="height: 17px"></td>
                            <td class="labelcells" style="height: 17px">iii) Income Tax Installment
                            </td>
                            <td class="labelcells" style="height: 17px"></td>
                            <td class="labelcells" style="height: 17px"></td>
                            <td class="labelcells" style="height: 17px">
                                <asp:Label ID="Label60" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells k" style="height: 17px">
                                <asp:Label ID="Label5020" runat="server"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">iv) Cess Installment
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label61" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label5021" runat="server"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">v) Refund Amount
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">
                                <asp:Label ID="Label62" runat="server"></asp:Label>

                            </td>
                            <td class="labelcells k">
                                <asp:Label ID="Label5022" runat="server"></asp:Label>
                                <%--<asp:Label ID="Label5023" runat="server"></asp:Label>--%>
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
                            <td class="labelcells">&nbsp;</td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells"></td>
                            <td class="labelcells"></td>
                            <td class="labelcells">&nbsp;</td>
                            <td class="labelcells">&nbsp;
                            </td>
                            <td class="labelcells">&nbsp;</td>
                            <td class="labelcells">&nbsp;</td>
                        </tr>
                    </table>
                </div>
                <asp:Panel ID="Panel3" runat="server" Height="9px" Width="29px">
                </asp:Panel>
            </asp:Panel>

        </div>


        <div id="tab3" class="tab">


            <asp:Panel ID="Panel1" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td class="content-sub-heading" style="text-align: left;" colspan="2">Acceptance
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" Width="100%"
                                PageSize="15" CssClass="table" GridLines="None">
                                <HeaderStyle Wrap="False" BackColor="DarkGoldenrod" Font-Bold="True" ForeColor="#FFFFCC" />
                                <AlternatingRowStyle BackColor="WhiteSmoke" />
                            </asp:GridView>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <fieldset>
                                <div id="radiodiv">
                                    <asp:RadioButtonList ID="rblMeasurementSystem" runat="server" class="radio-input" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="OldMethod" Selected="True" Value="Old" />
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
                            <%--<label runat="server" id="lblcat" visible="false">Please Note: <b>term and coditions1 . </b></label>--%>
                            <br />
                            <%--<label runat="server" visible="false"  id="Label5"></label>--%>
                        </td>
                    </tr>

                </table>
             <div class="alert" runat ="server" id ="messagediv">
  
  <%--<strong>Danger!</strong> Indicates a dangerous or potentially negative action.--%>
                 <label runat="server" visible="false"  id="Label5"></label>
</div>


                <asp:Panel ID="Panel2" runat="server" Height="9px" Width="29px">
                </asp:Panel>
            </asp:Panel>

        </div>

    </div>
</asp:Content>


