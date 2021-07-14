<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JqueryAjaxLanguageTech.aspx.cs" Inherits="JqueryAjaxLanguageTech" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%--<!DOCTYPE html >--%>
<%--<!DOCTYPE html>--%>

<%--    <link href="css/base.css" rel="stylesheet">
    <link href="css/project.css" rel="stylesheet">--%>

<script src="js/jquery.min.2.2.0.js"></script>
<style type="text/css">
    #tbl {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 70%;
    }

        #tbl td, #tbl th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #tbl tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #tbl tr:hover {
            background-color: #ddd;
        }

        #tbl th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }

    .modal {
        /*background: green;
  position: absolute;
  float: left;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);*/
        display: none; /* Hidden by default */
        position: absolute; /* Stay in place */
        /*z-index: 1;*/ /* Sit on top */
        /*padding-top: 100px;*/ /* Location of the box */
        left: 50%;
        top: 50%;
        /*width: 100%;*/ /* Full width */
        /*height: 100%;*/ /* Full height */
        /*overflow: auto;*/ /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4);
        transform: translate(-50%, -50%); /* Black w/ opacity */
        width: 100%;
        height: 100%;
    }


    .modal-content {
        /*background-color:red;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;*/
        background-color: slategrey;
        margin: auto;
        padding: 40px;
        border: 1px solid #888;
        width: 77%;
        left: 50%;
        top: 50%;
        position: absolute;
        transform: translate(-50%, -50%);
    }

    /* The Close Button */
    .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }

    .modal-body {
        position: relative; /* This avoids image to go off the container */
        height: 250px;
        border: 1px solid #ff0000;
    }

    .img-responsive {
        width: 50px;
        height: 50px;
        position: absolute;
        left: 50%;
        top: 50%;
        margin-top: -25px;
        margin-left: -25px;
    }

    #processing {
        width: 300px;
        height: 300px;
        border: 1px solid #000;
        padding: 15px;
        margin: 0 auto;
    }

    #loading {
        font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", "Helvetica", "Arial", "Lucida Grande", sans-serif;
        font-weight: 200;
        font-size: 1.1em;
        padding: 0;
        margin: 0;
        -webkit-tap-highlight-color: rgba(0,0,0,0);
        min-height: 500px;
        position: relative;
        display: none;
    }

        #loading div {
            font-weight: 200;
            padding: 0;
            margin: 0;
            -webkit-tap-highlight-color: rgba(0,0,0,0);
            display: block;
            position: absolute;
            top: 100px;
            left: 50%;
            width: 100px;
            height: 100px;
            margin-left: -50px;
            font-family: html5test;
            font-size: 100px;
            line-height: 100px;
            text-align: center;
            color: #bbb;
            animation: loader 1s steps(8) infinite;
        }
</style>



<script type="text/javascript">
    $(document).ready(function () {
     
        $("input").prop('required', true);
    //In url write your page name like"WebForm1.aspx" and Webmethod name "InsertData".
    //Write jQuery Ajax to call WebMethod(InsertData)
    //function SaveData() {

        $("#btnsubmit").click(function () {

            //GetData();
            debugger;

            //if ($("#btnsubmit").val() == "Submit") {
            //$(".modal").show();
            //debugger;

            alert('1');
            $("#loading").show();
            $.ajax({

                url: 'JqueryAjaxLanguageTech.aspx/InsertData',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                //data: "{name:'" + $("#txtName").val() + "',age:'" + $("#txtAge").val() + "',address:'" + $("#txtAddress").val() + "'}",
                data: "{name:'" + $("#txtName").val() + "',age:'" + $("#txtAge").val() + "',address:'" + $("#txtAddress").val() + "' , salary: '" + $("#txtSalary").val() + "' , dob: '" + $("#txtDob").val() + "'}",
                success: function () {
                    //alert("Insert data Successfully");
                    GetData();
                    //$(".modal").hide();
                    $("#loading").hide();
                },
                error: function () {
                    alert("Insert Error");
                    $("#loading").hide();
                }

            });

            //}
            //else {
            //    $("#loading").show();
            //    $.ajax({
            //        url: 'JqueryAjaxLanguageTech.aspx/Update',
            //        type: 'post',
            //        contentType: 'application/json;charset=utf-8',
            //        dataType: 'json',
            //        //data: "{ID:'" + idd + "',name:'" + $("#txtName").val() + "',age:'" + $("#txtAge").val() + "',address:'" + $("#txtAddress").val() + "'}",
            //        data: "{ID:'" + idd + "',name:'" + $("#txtName").val() + "',age:'" + $("#txtAge").val() + "',address:'" + $("#txtAddress").val() + "' , salary: '" + $("#txtSalary").val() + "' , dob: '" + $("#txtDob").val() + "'}",
            //        success: function () {
            //            alert("Update data Successfully");
            //            GetData();
            //            $("#loading").hide();
            //        },
            //        error: function () {
            //            alert("Update Error");
            //            $("#loading").hide();
            //        }

            //    });
            //}

            //}
            //Retreive Record

        });






        $("#btnsubmit1").click(function () {

            //GetData();
            debugger;

            //if ($("#btnsubmit").val() == "Submit") {
            //$(".modal").show();
            //debugger;

            alert('2');
            $("#loading").show();
            $.ajax({

                url: 'JqueryAjaxLanguageTech.aspx/InsertData',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                //data: "{name:'" + $("#txtName").val() + "',age:'" + $("#txtAge").val() + "',address:'" + $("#txtAddress").val() + "'}",
                data: "{name:'" + $("#txtName").val() + "',age:'" + $("#txtAge").val() + "',address:'" + $("#txtAddress").val() + "' , salary: '" + $("#txtSalary").val() + "' , dob: '" + $("#txtDob").val() + "'}",
                success: function () {
                    //alert("Insert data Successfully");
                    GetData();
                    //$(".modal").hide();
                    $("#loading").hide();
                },
                error: function () {
                    alert("Insert Error");
                    $("#loading").hide();
                }

            });

            //}
            //else {
            //    $("#loading").show();
            //    $.ajax({
            //        url: 'JqueryAjaxLanguageTech.aspx/Update',
            //        type: 'post',
            //        contentType: 'application/json;charset=utf-8',
            //        dataType: 'json',
            //        //data: "{ID:'" + idd + "',name:'" + $("#txtName").val() + "',age:'" + $("#txtAge").val() + "',address:'" + $("#txtAddress").val() + "'}",
            //        data: "{ID:'" + idd + "',name:'" + $("#txtName").val() + "',age:'" + $("#txtAge").val() + "',address:'" + $("#txtAddress").val() + "' , salary: '" + $("#txtSalary").val() + "' , dob: '" + $("#txtDob").val() + "'}",
            //        success: function () {
            //            alert("Update data Successfully");
            //            GetData();
            //            $("#loading").hide();
            //        },
            //        error: function () {
            //            alert("Update Error");
            //            $("#loading").hide();
            //        }

            //    });
            //}

            //}
            //Retreive Record

        });

        $('#form1').submit(function (e) {
            e.preventDefault();
            debugger;




            function GetData() {
                $("#loading").show();
                $.ajax({
                    url: 'JqueryAjaxLanguageTech.aspx/GetEmpData',
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    data: "{}",
                    success: function (_data) {
                        _data = JSON.parse(_data.d);
                        $("#tbl").find("tr:gt(0)").remove();
                        for (var i = 0; i < _data.length; i++) {
                            $("#tbl").append('<tr><td>' + _data[i].EmpName + '</td><td>' + _data[i].EmpAge + '</td><td>' + _data[i].EmpAddress + '</td><td><input type="button" id="btndelete" value="Delete" onclick="DeleteData(' + _data[i].EmpId + ')" /></td>  <td><input type="button" id="btnedit" value="Edit" onclick="EditData(' + _data[i].EmpId + ')" /></td>  </tr>');
                        }
                        $("#loading").hide();
                    },
                    error: function () {
                        alert("Get Error");
                        $("#loading").hide();
                    }

                });

            }
            //Edit Record 
            function EditData(empid) {
                $("#loading").show();
                $.ajax({
                    url: 'JqueryAjaxLanguageTech.aspx/Edit',
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    data: "{Id : '" + empid + "'}",
                    success: function (_dt) {
                        _dt = JSON.parse(_dt.d);
                        $("#txtName").val(_dt[0].EmpName);
                        $("#txtAddress").val(_dt[0].EmpAddress);
                        $("#txtAge").val(_dt[0].EmpAge);

                        $("#btnsubmit").val("Update");
                        idd = empid;
                        $("#loading").hide();
                    },
                    error: function () {
                        alert('edit error !!');
                        $("#loading").hide();
                    }
                });
            }
            //Delete Record
            function DeleteData(empid) {
                $("#loading").show();
                $.ajax({
                    url: 'JqueryAjaxLanguageTech.aspx/Delete',
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    data: "{Id : '" + empid + "'}",
                    success: function () {
                        alert('delete success !!');
                        GetData();
                    },
                    error: function () {
                        alert('delete error !!');
                        $("#loading").hide();
                    }
                });
            }
        });
    });
</script>


<html>

<head runat="server">
    <title></title>
</head>
<%--<body>--%>
<body>
    <form id="form1" runat ="server" >
<%--        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <telerik:RadNumericTextBox ID="txtNoOfItems" runat="server" Width="80px"
            InputType="Number" MaxLength="10" DataType="System.Int32" MinValue="1"
            Culture="en-US" DbValueFactor="1" EmptyMessage="Invalid Quantity"
            LabelWidth="32px" MaxValue="100" CausesValidation="True"
            ValidationGroup="mandatory">
            <NumberFormat DecimalDigits="0" />
        </telerik:RadNumericTextBox>--%>

        <div>
            <%--<img id="loading" src="Image/load.gif" /> <!-- Loading Image -->--%>
            <div id="myModal" class="modal">

                <!-- Modal content -->
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <p>Some text in the Modal..</p>
                </div>

            </div>
            Lorem ipsum
        </div>
        <table>
            <tr>
                <td>Name:
                </td>
                <td>
                    <input type="text" id="txtName" /></td>
            </tr>

            <tr>
                <td>Age:</td>
                <td>
                    <input type="number" id="txtAge" /></td>
            </tr>

            <tr>
                <td>Address:</td>
                <td>
                    <input type="text" id="txt" /></td>

            </tr>

            <tr>
                <td>Salary:</td>
                <td>
                    <input type="number" step="0.01" id="txtSalary" /></td>
            </tr>

            <tr>
                <td>Date Of Birth:</td>
                <td>
                    <input type="date" id="txtDob" /></td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <%--<input type="submit" id="btnsubmit" value="Submit" onclick="SaveData()" /></td>--%>
                    <input type="submit" id="btnsubmit" value="Submit"  />
                    <input type="submit" id="btnsubmit1" value="Submit1"  />
                </td>

            </tr>
        </table>
        <table id="tbl">
            <tr>
                <th>Enmployee Name</th>
                <th>Employee Age</th>
                <th>Employee Address</th>
                <th></th>
                <th></th>
            </tr>

        </table>
        <%--</div>--%>


        <%--        <div id="processing" class="modal fade">
    <div class="modal-dialog" style="max-width: 350px">
        <div class="modal-content">
            <div class="panel-heading modal-header dialog-header">
                <h4 class="modal-title">Please Wait...</h4>
            </div>
            <div class="modal-body">
                <img src="http://media.jumpingjack.com/JumpingJack/loading.gif" class="img-responsive" />
            </div>
        </div>
    </div>
</div>--%>

        <div id="loading" style="display: none;">
            <div></div>
        </div>
        <%--  <div id="loading" style="display: none;"><div><img id="loading1" src="Image/load.gif" /> </div></div>--%>
    </form>
</body>
</html>


<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>--%>
