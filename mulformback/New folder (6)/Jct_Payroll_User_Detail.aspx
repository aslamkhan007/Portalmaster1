<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Jct_Payroll_User_Detail.aspx.cs" Inherits="Jct_Payroll_User_Detail" %>

<!DOCTYPE html>
<html>

<head>
    <title>HTML Document</title>
    <%--<link rel="stylesheet" href="styleMul.css" />--%>
</head>

<body>
    <div class="container">
        <form id="myform">
            <div id="Form1">
                <h3>CurrentAddress</h3>
                <input type="text" id="CurrentAddress1" name="CurrentAddress1" placeholder="Address Line 1" />
                <input type="text" id="CurrentAddress2" name="CurrentAddress2" placeholder="Address Line 2" />
                <input type="text" id="CurrentAddress3" name="CurrentAddress3" placeholder="Address Line 3" />
                <input type="text" id="Currentstate" name="Currentstate" placeholder="State" />
                <input type="text" id="Currentcity" name="Currentcity" placeholder="City" />
                <input type="text" id="CurrentMobile" name="CurrentMobile" placeholder="Mobile" />
                <input type="text" id="Currentlandline" name="Currentlandline" placeholder="PrimaryLandLine" />
                <input type="text" id="CurrentSecondaryLandline" name="CurrentSecondaryLandline" placeholder="SecondaryLandLine" />
                <input type="text" id="CurrentEmailID" name="CurrentEmailID" placeholder="Email" />
                <div class="btn-box">
                    <button type="button" id="Next1">Next</button>
                </div>
            </div>

            <div id="Form2">
                <h3>PermanentAddress</h3>
                <input type="text" id="PermanentAddress1" name="PermanentAddress1" placeholder="Address Line 1" />
                <input type="text" id="PermanentAddress2" name="PermanentAddress2" placeholder="Address Line 2" />
                <input type="text" id="PermanentAddress3" name="PermanentAddress3" placeholder="Address Line 3" />
                <input type="text" id="Permanentstate" name="Permanentstate" placeholder="State" />
                <input type="text" id="Permanentcity" name="Permanentcity" placeholder="City" />
                <input type="text" id="PermanentMobile" name="PermanentMobile" placeholder="Mobile" />
                <input type="text" id="Permanentandline" name="Permanentandline" placeholder="PrimaryLandLine" />
                <input type="text" id="PermanentSecondaryLandline" name="PermanentSecondaryLandline" placeholder="SecondaryLandLine" />
                <input type="text" id="PermanentEmailID" name="PermanentEmailID" placeholder="Email" />


                <div class="btn-box">
                    <button type="button" id="Back1">Back</button>
                    <button type="button" id="Next2">Next</button>
                </div>
            </div>


            <div id="Form3">
                <h3>Personal Info </h3>
                <input type="text" placeholder="First Name">
                <input type="text" placeholder="Last Name">
                <input type="text" placeholder="Mobile">


                <div class="btn-box">
                    <button type="button" id="Back2">Back</button>
                    <button type="button" id="Next3">Next</button>
                </div>
            </div>

            <div id="Form4">
                <h3>Final Info </h3>
                <input type="text" placeholder="Cash">
                <input type="text" placeholder="Amount">
                <input type="text" placeholder="City">
                <!-- <input type="text" placeholder="Cash">
            <input type="text" placeholder="Amount">
            <input type="text" placeholder="City">
            <input type="text" placeholder="Cash">
            <input type="text" placeholder="Amount">
            <input type="text" placeholder="City"> -->


                <div class="btn-box">
                    <button type="button" id="Back3">Back</button>
                    <button type="submit">Submit</button>
                </div>
            </div>
        </form>
        <div class="step-row">
            <div id="progress" class="progressclass"></div>
            <div class="step-col"><small>Step1</small></div>
            <div class="step-col"><small>Step2</small></div>
            <div class="step-col"><small>Step3</small></div>
            <div class="step-col"><small>Step4</small></div>

        </div>
    </div>
     <script src="js/jquery.min.2.2.0.js"></script>
    <script>

        $(document).ready(function () {
            GetInitialDetailsFun();
            //PostInitialDetailsFun();

            function GetInitialDetailsFun() {
                //$('#img0').show();
                $.ajax({
                    type: "POST",
                    url: "Jct_Payroll_User_Detail.aspx/GetInitialDetails",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccessGetInitialDetails,
                    error: function (response) {
                        debugger;
                        //                        var r =  JSON.parse(response.responseText);    
                        //$('#img0').hide();
                        //$("#lnkFetch").attr("disabled", false);
                        alert(response.responseText);
                    }
                });
            }

            function OnSuccessGetInitialDetails(response) {                                                
                $('#CurrentAddress1').val(response.d.CurrentAddress.CurrentAddress1);
                $('#CurrentAddress2').val(response.d.CurrentAddress.CurrentAddress2);
                $('#CurrentAddress3').val(response.d.CurrentAddress.CurrentAddress3);
                $('#Currentstate').val(response.d.CurrentAddress.Currentstate);
                $('#Currentcity').val(response.d.CurrentAddress.Currentcity);
                $('#CurrentMobile').val(response.d.CurrentAddress.CurrentMobile);
                $('#Currentlandline').val(response.d.CurrentAddress.Currentlandline);
                $('#CurrentSecondaryLandline').val(response.d.CurrentAddress.CurrentSecondaryLandline);
                $('#CurrentEmailID').val(response.d.CurrentAddress.CurrentEmailID);


                //Fill Permanent Address From Database                                     
                $('#PermanentAddress1').val(response.d.PermanentAddress.PermanentAddress1);
                $('#PermanentAddress2').val(response.d.PermanentAddress.PermanentAddress2);
                $('#PermanentAddress3').val(response.d.PermanentAddress.PermanentAddress3);
                $('#Permanentstate').val(response.d.PermanentAddress.Permanentstate);
                $('#Permanentcity').val(response.d.PermanentAddress.Permanentcity);
                $('#PermanentMobile').val(response.d.PermanentAddress.PermanentMobile);
                $('#Permanentandline').val(response.d.PermanentAddress.Permanentandline);
                $('#PermanentSecondaryLandline').val(response.d.PermanentAddress.PermanentSecondaryLandline);
                $('#PermanentEmailID').val(response.d.PermanentAddress.PermanentEmailID);

               
            }


            $('#myform').submit(function (e) {

                e.preventDefault();
                
                alert('hi');
                debugger;

              var user = [
              {
                  Username: "abc",
                  Password: "1"
              },
              {
                  Username: "def",
                  Password: "2"
              }
                ];

                //function PostInitialDetailsFun() {
                $.ajax({
                    type: "POST",
                    url: "Jct_Payroll_User_Detail.aspx/SaveUser",
                    //data: '{user: ' + JSON.stringify(user) + '}',
                    data: '{user: ' + JSON.stringify(user) + ', user1: ' + JSON.stringify(user) + ' }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert("User has been added successfully.");
                        window.location.reload();
                    }
                });

            });


            //var user = [
            //   {
            //       Username: "abc",
            //       Password: "1"
            //   },
            //   {
            //       Username: "def",
            //       Password: "2"
            //   }
            //];
                  
            ////function PostInitialDetailsFun() {
            //    $.ajax({
            //        type: "POST",
            //        url: "Jct_Payroll_User_Detail.aspx/SaveUser",
            //        //data: '{user: ' + JSON.stringify(user) + '}',
            //        data: '{user: ' + JSON.stringify(user) + ', user1: ' + JSON.stringify(user) + ' }',
            //        contentType: "application/json; charset=utf-8",
            //        dataType: "json",
            //        success: function (response) {
            //            alert("User has been added successfully.");
            //            window.location.reload();
            //        }
            //    });
            //}

            //function PostInitialDetailsFun() {
            //    //console.warn(JSON.stringify(MyViewModel1));
            //    //$('#img0').show();
            //    $.ajax({
            //        type: "POST",
            //        url: "Jct_Payroll_User_Detail.aspx/PostInitialDetails",
            //        contentType: "application/json; charset=utf-8",
            //        //data: "{ 'code': '" + code + "' ,'name': '" + name + "'}",
            //        //data: JSON.stringify(MyViewModel1s),
            //        //data: { CurrentAddress: JSON.stringify(CurrentAddress1) },
            //        //data: '{CurrentAddress: ' + JSON.stringify(CurrentAddress1) + '}',
            //        //data: '{user: ' + JSON.stringify(user) + '}',
            //        data: '{user: ' + JSON.stringify(user) + '}',
            //        dataType: "json",
            //        success: OnSuccessPostInitialDetails,
            //        error: function (response) {
            //            debugger;
            //            //                        var r =  JSON.parse(response.responseText);    
            //            //$('#img0').hide();
            //            //$("#lnkFetch").attr("disabled", false);
            //            alert(response.responseText);
            //        }
            //    });
            //}

            function OnSuccessPostInitialDetails(response) {
                debugger;
            }

        });



        var Form1 = document.getElementById("Form1");
        var Form2 = document.getElementById("Form2");
        var Form3 = document.getElementById("Form3");
        var Form4 = document.getElementById("Form4");

        var Next1 = document.getElementById("Next1");
        var Next2 = document.getElementById("Next2");
        var Back1 = document.getElementById("Back1");
        var Back2 = document.getElementById("Back2");

        var Next3 = document.getElementById("Next3");
        var Back3 = document.getElementById("Back3");

        var progress = document.getElementById("progress");


        Next1.onclick = function () {
            Form1.style.left = "-450px";
            Form2.style.left = "40px";
            progress.style.width = "180px"
        }

        Back1.onclick = function () {
            Form1.style.left = "40px";
            Form2.style.left = "450px";
            progress.style.width = "90px"
        }
        Next2.onclick = function () {
            Form2.style.left = "-450px";
            Form3.style.left = "40px";
            progress.style.width = "270px"
        }
        Back2.onclick = function () {
            Form2.style.left = "40px";
            Form3.style.left = "450px";
            progress.style.width = "180px"
        }

        Next3.onclick = function () {
            Form3.style.left = "-450px";
            Form4.style.left = "40px";
            progress.style.width = "360px"

            // progress.style.content = "none";
        }
        Back3.onclick = function () {
            Form3.style.left = "40px";
            Form4.style.left = "450px";
            progress.style.width = "270px"

        }


        

    </script>
    
   
</body>

</html>
