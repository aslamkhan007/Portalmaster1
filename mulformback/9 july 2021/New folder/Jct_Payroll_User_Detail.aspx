<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Jct_Payroll_User_Detail.aspx.cs" Inherits="Jct_Payroll_User_Detail" %>

<!DOCTYPE html>
<html>

<head>

    <title>HTML Document</title>
    <link rel="stylesheet" href="Newfolder10/styleMul.css" />
    <link href="Newfolder10/jquery-ui.css" rel="stylesheet" />
    <link href="Newfolder10/css/fontawesome.css" rel="stylesheet" />
    <link href="Newfolder10/css/all.css" rel="stylesheet" />
    <script src="js/jquery.min.2.2.0.js"></script>
    <script src="Newfolder10/jquery-ui.min.js"></script>
    <script src="Newfolder10/sweetalert.min.js"></script>
    <script src="Newfolder10/js/fontawesome.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    <div class="container">
        <form id="myform" name="myform" autocomplete ="off">
            <div id="Form1">
                <h3>Current Address</h3>
                <input type="text" id="CurrentAddress1" maxlength = "30" name="CurrentAddress1" placeholder="Address Line 1" />
                <input type="text" id="CurrentAddress2" maxlength = "30" name="CurrentAddress2" placeholder="Address Line 2" />
                <input type="text" id="CurrentAddress3" maxlength = "30" name="CurrentAddress3" placeholder="Address Line 3" />
                <input type="text" id="Currentstate" maxlength = "30" name="Currentstate" placeholder="State" />
                <input type="text" id="Currentcity" maxlength = "30" name="Currentcity" placeholder="City" />
                <input type="text" id="CurrentPincode" maxlength = "10" name="CurrentPincode" placeholder="Pincode" />
                <input type="text" id="CurrentMobile" maxlength = "10" name="CurrentMobile" placeholder="Mobile" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                <input type="text" id="CurrentSecondaryMobileNo" maxlength = "10" name="CurrentSecondaryMobileNo" placeholder="SecondaryMobileNo" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                <input type="text" id="CurrentPrimaryLandline" maxlength = "12" name="CurrentPrimaryLandline" placeholder="LandLine"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                <input type="text" id="CurrentEmailID" maxlength = "20" name="CurrentEmailID" placeholder="Email" />
                <div class="btn-box">
                    <button type="button" id="Next1"><i class="fas fa-angle-double-right"></i>Next</button>
                </div>
            </div>

            <div id="Form2">
                <h3>Permanent Address</h3>
                <input type="text" id="PermanentAddress1" maxlength = "30" name="PermanentAddress1" placeholder="Address Line 1" />
                <input type="text" id="PermanentAddress2" maxlength = "30" name="PermanentAddress2" placeholder="Address Line 2" />
                <input type="text" id="PermanentAddress3" maxlength = "30" name="PermanentAddress3" placeholder="Address Line 3" />
                <input type="text" id="Permanentstate" maxlength = "30" name="Permanentstate" placeholder="State" />
                <input type="text" id="Permanentcity" maxlength = "30" name="Permanentcity" placeholder="City" />
                <input type="text" id="PermanentPincode" maxlength = "10" name="PermanentPincode" placeholder="Pincode" />
                <input type="text" id="PermanentMobile" maxlength = "10" name="PermanentMobile" placeholder="Mobile"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                <input type="text" id="PermanentSecondaryMobileNo" maxlength = "10" name="PermanentSecondaryMobileNo" placeholder="Mobile" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                <input type="text" id="PermanentPrimaryLandline" maxlength = "12" name="PermanentPrimaryLandline" placeholder="LandLine" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                <input type="text" id="PermanentEmailID" maxlength = "20" name="PermanentEmailID" placeholder="Email" />

                <div class="btn-box">
                    <button type="button" id="Back1"><i class="fas fa-angle-double-left"></i>Back</button>
                    <button id="submit" type="submit" onclick="return PermanentValidation()"><i class="fa fa-lock" aria-hidden="true"></i>Submit</button>
                </div>
            </div>
        </form>
        <div class="step-row">
            <div id="progress" class="progressclass"></div>
            <div class="step-col"><small>Step1</small></div>
            <div class="step-col"><small>Step2</small></div>
        </div>
    </div>

    <script>

        function CurrentValidation() {
            if ($('#CurrentAddress1').val() == '') {
                swal({ text: "Current Address Line 1 is Mandatory", timer: 2000 });
                $('#CurrentAddress1').focus();
                return false;
            }

            if ($('#CurrentAddress1').val().length > 30) {
                swal({ text: "Only 30 Characters Allowed In Current Address Line 1", timer: 2000 });
                $('#CurrentAddress1').focus();
                return false;
            }

            if ($('#Currentstate').val() == '') {
                swal({ text: "Current State is Mandatory ", timer: 2000 });
                $('#Currentstate').focus();
                return false;
            }
            if ($('#Currentcity').val() == '') {
                swal({ text: "Current City is Mandatory", timer: 2000 });
                $('#Currentcity').focus();
                return false;
            }
            if ($('#CurrentPincode').val() == '') {
                swal({ text: "Current Pincode is Mandatory", timer: 2000 });
                $('#CurrentPincode').focus();
                return false;
            }
            if ($('#CurrentMobile').val() == '') {
                swal({ text: "Current Mobile is Mandatory", timer: 2000 });
                $('#CurrentMobile').focus();
                return false;
            }
            if ($('#CurrentEmailID').val() != '') {
                if (!validateEmail($('#CurrentEmailID').val())) {
                    swal({ text: "InValid Current Email Format", timer: 2000 });
                    $('#CurrentEmailID').focus();
                    return false;
                }
            }
            return true;
        }


        function PermanentValidation() {
            if ($('#PermanentAddress1').val() == '') {
                swal({ text: "Permanent Address Line 1 is Mandatory", timer: 2000 });
                $('#PermanentAddress1').focus();
                return false;
            }
            if ($('#PermanentAddress1').val().length > 30) {
                swal({ text: "Only 30 Characters Allowed In Permanent Address Line 1", timer: 2000 });
                $('#PermanentAddress1').focus();
                return false;
            }

            if ($('#Permanentstate').val() == '') {
                swal({ text: "Permanent State is Mandatory", timer: 2000 });
                $('#Permanentstate').focus();
                return false;
            }
            if ($('#Permanentcity').val() == '') {
                swal({ text: "Permanent City is Mandatory", timer: 2000 });
                $('#Permanentcity').focus();
                return false;
            }
            if ($('#PermanentPincode').val() == '') {
                swal({ text: "Permanent Pincode is Mandatory", timer: 2000 });
                $('#PermanentPincode').focus();
                return false;
            }
            if ($('#PermanentMobile').val() == '') {
                swal({ text: "Permanent Mobile is Mandatory", timer: 2000 });
                $('#PermanentMobile').focus();
                return false;
            }

            if ($('#PermanentEmailID').val() != '') {
                if (!validateEmail($('#PermanentEmailID').val())) {
                    swal({ text: "InValid Permanent Email Format", timer: 2000 });
                    $('#PermanentEmailID').focus();
                    return false;
                }
            }
            return true;
        }


        function validateEmail(email) {
            const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;            
            return re.test(email);
        }


        $(document).ready(function () {
            $('input').css('text-transform', 'uppercase');
            $('#CurrentEmailID').css('text-transform', 'lowercase');
            $('#PermanentEmailID').css('text-transform', 'lowercase');

            GetInitialDetailsFun();
            function GetInitialDetailsFun() {
                swal({
                    text: "Loading.. Please Wait.. ",
                    closeOnClickOutside: false,
                    buttons: false
                });

                $.ajax({
                    type: "POST",
                    url: "Jct_Payroll_User_Detail.aspx/GetInitialDetails",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccessGetInitialDetails,
                    error: function (response) {
                        swal.close();
                        alert(response.responseText);
                    }                    
                });
            }

            //Response On Page Load
            function OnSuccessGetInitialDetails(response) {
                swal.close();
                //Fill Current Address From Database  
                $('#CurrentAddress1').val(response.d.CurrentAddress.CurrentAddress1);
                $('#CurrentAddress2').val(response.d.CurrentAddress.CurrentAddress2);
                $('#CurrentAddress3').val(response.d.CurrentAddress.CurrentAddress3);
                $('#Currentstate').val(response.d.CurrentAddress.Currentstate);
                $('#Currentcity').val(response.d.CurrentAddress.Currentcity);
                $('#CurrentPincode').val(response.d.CurrentAddress.CurrentPincode);
                $('#CurrentMobile').val(response.d.CurrentAddress.CurrentMobile);
                $('#CurrentSecondaryMobileNo').val(response.d.CurrentAddress.CurrentSecondaryMobileNo);
                $('#CurrentPrimaryLandline').val(response.d.CurrentAddress.CurrentPrimaryLandline);
                $('#CurrentEmailID').val(response.d.CurrentAddress.CurrentEmailID);

                //Fill Permanent Address From Database                                     
                $('#PermanentAddress1').val(response.d.PermanentAddress.PermanentAddress1);
                $('#PermanentAddress2').val(response.d.PermanentAddress.PermanentAddress2);
                $('#PermanentAddress3').val(response.d.PermanentAddress.PermanentAddress3);
                $('#Permanentstate').val(response.d.PermanentAddress.Permanentstate);
                $('#Permanentcity').val(response.d.PermanentAddress.Permanentcity);
                $('#PermanentPincode').val(response.d.PermanentAddress.PermanentPincode);
                $('#PermanentMobile').val(response.d.PermanentAddress.PermanentMobile);
                $('#PermanentSecondaryMobileNo').val(response.d.PermanentAddress.PermanentSecondaryMobileNo);
                $('#PermanentPrimaryLandline').val(response.d.PermanentAddress.PermanentPrimaryLandline);
                $('#PermanentEmailID').val(response.d.PermanentAddress.PermanentEmailID);

                
                //if (response.d.CurrentAddress.CurrentSubmitStatus == true && response.d.PermanentAddresss.PermanentSubmitStatus == true)
                if (response.d.PermanentAddress.PermanentSubmitStatus == true && response.d.CurrentAddress.CurrentSubmitStatus == true) {
                    swal({
                        //title: "Data Saved And Locked Successfully! ",
                        //title: "Data Saved And Locked Successfully! ",
                        title: "" + response.d.CurrentAddress.SelectedUser + "  YOUR DATA IS SUCCESSFULLY SAVED AND LOCKED! ",
                        text: "Please Contact IT Department To Unlock",
                        showConfirmButton: false,
                        icon: "success",
                        timer: 3000
                    });
                    $('input').prop('disabled', true).css('background-color', '#dbc2c2;');
                    $('#submit').prop('disabled', true);
                    $('#submit').text('Locked');

                }
            }

            //Submit the Form
            $('#myform').submit(function (e) {
                e.preventDefault();                                
                swal({
                    title: "Saving...",
                    text: "Please wait Your Data is Being Saved",
                    closeOnClickOutside: false,
                    buttons: false
                });

                var currentAddress = {};
                currentAddress.CurrentAddress1 = $('#CurrentAddress1').val();
                currentAddress.CurrentAddress2 = $('#CurrentAddress2').val();
                currentAddress.CurrentAddress3 = $('#CurrentAddress3').val();
                currentAddress.Currentstate = $('#Currentstate').val();
                currentAddress.Currentcity = $('#Currentcity').val();
                currentAddress.CurrentMobile = $('#CurrentMobile').val();
                currentAddress.CurrentSecondaryMobileNo = $('#CurrentSecondaryMobileNo').val();
                currentAddress.CurrentPincode = $('#CurrentPincode').val();
                currentAddress.CurrentPrimaryLandline = $('#CurrentPrimaryLandline').val();
                currentAddress.CurrentEmailID = $('#CurrentEmailID').val();

                var permanentAddress = {};
                permanentAddress.PermanentAddress1 = $('#PermanentAddress1').val();
                permanentAddress.PermanentAddress2 = $('#PermanentAddress2').val();
                permanentAddress.PermanentAddress3 = $('#PermanentAddress3').val();
                permanentAddress.Permanentstate = $('#Permanentstate').val();
                permanentAddress.Permanentcity = $('#Permanentcity').val();
                permanentAddress.PermanentMobile = $('#PermanentMobile').val();
                permanentAddress.PermanentSecondaryMobileNo = $('#PermanentSecondaryMobileNo').val();
                permanentAddress.PermanentPincode = $('#PermanentPincode').val();
                permanentAddress.PermanentPrimaryLandline = $('#PermanentPrimaryLandline').val();
                permanentAddress.PermanentEmailID = $('#PermanentEmailID').val();

                $.ajax({
                    type: "POST",
                    url: "Jct_Payroll_User_Detail.aspx/SaveUser",
                    //data: '{user: ' + JSON.stringify(user) + '}',
                    //data: '{user: ' + JSON.stringify(user) + ', user1: ' + JSON.stringify(user) + ' }',
                    //data: '{user: ' + JSON.stringify(currentAddress) + ', user1: ' + JSON.stringify(permanentAddress) + ', user2: ' + JSON.stringify(obj) + ' }',
                    data: '{user: ' + JSON.stringify(currentAddress) + ', user1: ' + JSON.stringify(permanentAddress) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        //swal({
                        //    title: "Data Saved Successfully!",
                        //    showConfirmButton: false,
                        //    timer: 3000
                        //});                                                                    
                    },
                    error: function (error) {                                                                                                                        

                    },
                    complete: function(xhr,textStatus)
                    {                        
                        if (textStatus == 'success')
                        {
                            window.location.reload();
                        }
                        else
                        {
                            swal({
                                text: "Time Out...Please Try After Sometime! ",
                                closeOnClickOutside: false,
                                buttons: false,
                                timer: 3000
                            });
                        }                        
                    }
                });
            });

            function OnSuccessPostInitialDetails(response) {

            }
        });

        //Start Logic
        var Form1 = document.getElementById("Form1");
        var Form2 = document.getElementById("Form2");
        var Next1 = document.getElementById("Next1");
        var Back1 = document.getElementById("Back1");
        var progress = document.getElementById("progress");


        Next1.onclick = function () {
            if (CurrentValidation()) {
                Form1.style.left = "-450px";
                Form2.style.left = "40px";
                progress.style.width = "360px"
            }
        }

        Back1.onclick = function () {
            Form1.style.left = "40px";
            Form2.style.left = "450px";
            progress.style.width = "180px"
        }

    </script>


</body>

</html>
