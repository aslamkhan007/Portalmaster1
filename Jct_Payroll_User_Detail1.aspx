<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="Jct_Payroll_User_Detail1.aspx.cs" Inherits="Jct_Payroll_User_Detail1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
        <style>

            .CheckboxClass {
                display: flex;
                justify-content: center;
                font-size: 12px;
                margin-bottom: 16px;
                font-weight: 700;
                align-content: center;
            }

            table {
                border-collapse: collapse;
                border-spacing: 0;
                width: 100%;
                border: 1px solid #ddd;
            }

            th, td {
                text-align: left;
                padding: 0px;
                border: 1px solid #dddddd;
                font-size: 10.8px;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2
            }

            .clsDelete{
                cursor:pointer
            }

            .ui-datepicker .ui-datepicker-title select {
    color: #000;
} 
        </style>
    </head>


    <body>
        <div id ="containers" class="container" style="padding-left: 0px;">
            <form id="myform" name="myform" autocomplete="off">
                <div id="Form1">
                    <h3 style="font-size: 20px; margin: 20px;">CURRENT ADDRESS</h3>
                    <input type="text" id="CurrentAddress1" maxlength="60" name="CurrentAddress1" placeholder="*Address Line 1" />
                    <input type="text" id="CurrentAddress2" maxlength="60" name="CurrentAddress2" placeholder=" Address Line 2" />
                    <input type="text" id="CurrentAddress3" maxlength="60" name="CurrentAddress3" placeholder=" Address Line 3" />
                    <select id="Currentstate" name="Currentstate">
                        <option selected>*SELECT STATE</option>
                    </select>
                    <select id="Currentcity" name="Currentcity">
                        <option selected>*SELECT CITY</option>
                    </select>
                    <input type="text" id="CurrentPincode" maxlength="10" name="CurrentPincode" placeholder="*Pincode" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                    <input type="text" id="CurrentMobile" maxlength="10" name="CurrentMobile" placeholder="*Mobile" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                    <input type="text" id="CurrentSecondaryMobileNo" maxlength="10" name="CurrentSecondaryMobileNo" placeholder="SecondaryMobileNo" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                    <input type="text" id="CurrentPrimaryLandline" maxlength="12" name="CurrentPrimaryLandline" placeholder="LandLine" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                    <input type="text" id="CurrentEmailID" maxlength="35" name="CurrentEmailID" placeholder="Email" />
                    <div class="btn-box">
                        <button type="button" id="Next1"><i class="fas fa-angle-double-right"></i>Next</button>
                    </div>
                </div>

                <div id="Form2">
                    <h3 style="font-size: 20px; margin: 20px;">PERMANENT ADDRESS</h3>
                    <div class="CheckboxClass">
                        <label for="CheckBoxSelection" style="font-weight: 700;">
                            Same As Current
                        <input type="checkbox" name="CheckBoxSelection" id="CheckBoxSelection" title="Same As Current" /></label>
                    </div>
                    <input type="text" id="PermanentAddress1" maxlength="60" name="PermanentAddress1" placeholder="*Address Line 1" />
                    <input type="text" id="PermanentAddress2" maxlength="60" name="PermanentAddress2" placeholder=" Address Line 2" />
                    <input type="text" id="PermanentAddress3" maxlength="60" name="PermanentAddress3" placeholder=" Address Line 3" />
                    <select id="Permanentstate" name="Permanentstate">
                        <option selected>*SELECT STATE</option>
                    </select>

                    <select id="Permanentcity" name="Permanentcity">
                        <option>*SELECT CITY</option>
                    </select>

                    <input type="text" id="PermanentPincode" maxlength="10" name="PermanentPincode" placeholder="*Pincode" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                    <input type="text" id="PermanentMobile" maxlength="10" name="PermanentMobile" placeholder="*Mobile" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                    <input type="text" id="PermanentSecondaryMobileNo" maxlength="10" name="PermanentSecondaryMobileNo" placeholder="Mobile" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                    <input type="text" id="PermanentPrimaryLandline" maxlength="12" name="PermanentPrimaryLandline" placeholder="LandLine" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                    <input type="text" id="PermanentEmailID" maxlength="35" name="PermanentEmailID" placeholder="Email" />

                    <div class="btn-box">
                        <button type="button" id="Back1"><i class="fas fa-angle-double-left"></i>Back</button>
                        <button type="button" id="Next2"><i class="fas fa-angle-double-right"></i>Next</button>
                        <%--<button id="submit" type="submit" onclick="return PermanentValidation()"><i class="fa fa-lock" aria-hidden="true"></i>Submit</button>--%>
                    </div>
                </div>


                <div id="Form3">
                    <%--<h3>Family Details</h3>--%>
                    
                    <h3>FAMILY DETAILS</h3>
                    <div style ="display: flex;">
                        <select id="RelationDropdown" style ="width: 50%;">
                        <option value="RELATION">RELATION</option>
                        <option value="SELF">SELF</option>
                        <option value="SPOUSE">SPOUSE</option>
                        <option value="FATHER">FATHER</option>
                        <option value="MOTHER" >MOTHER</option>
                        <option value="DAUGHTER">DAUGHTER</option>
                        <option value="SON">SON</option>
                        <option value="FATHERINLAW">FATHERINLAW</option>
                        <option value="MOTHERINLAW">MOTHERINLAW</option>
                    </select>
                         <input style ="width: 50%;" type="text" id="dobtext" maxlength="35" readonly="readonly" placeholder="DOB" autocomplete="off" />
                        </div>
                    
                    <input type="text" id="nametext" maxlength="35" placeholder="NAME" autocomplete="off" />
                   
                     <div style ="display: flex;">
                          <select id="Disabled" style ="width: 50%;">
                        <option value="NO">DISABLED-NO</option>
                        <option value="YES">DISABLED-YES</option>
                    
                    </select>
                    
                        <%--<div  id="AddRowbtn">--%>
                        <button style ="width: 50%;" type="button" id="AddRowbtn">
                                <i class="fas fa-user-plus"></i> ADD

                           </button>
                      <%--  </div>--%>
                         </div>
                    <%--                <table id="AddRowTable">
                    <tr>
                        <td>
                            <label>Relation</label>
                           
                        </td>

                    </tr>

                    <tr>
                        <td>
                            <label>Name</label>
                           
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label>DOB</label>
                            

                        </td>
                    </tr>

                    <tr>
                        <td>

                            
                            <button id="submit" type="submit" onclick="return PermanentValidation()"><i class="fa fa-lock" aria-hidden="true"></i>Submit</button>

                        </td>
                    </tr>
                </table>--%>

                    <div style="overflow-x: auto;margin-top: 12px;">
                    <table id="FamilyDetailTable" >
                        <thead>
                            <tr>
                                <th>
                                    <i class="fas fa-user-times"></i>
                                </th>
                                <th>Relation
                                </th>
                                <th>Name
                                </th>
                                <th>Age
                                </th>
                                <th>Disabled
                                </th>
                                
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                        </div>

                    <div class="btn-box">
                        <button type="button" id="Back2"><i class="fas fa-angle-double-left"></i>Back</button>
                        <button id="submit" type="submit"><i class="fa fa-lock" aria-hidden="true"></i>Submit</button>
                    </div>
                </div>

            </form>
            <div class="step-row">
                <div id="progress" class="progressclass"></div>
                <div class="step-col"><small>Step1</small></div>
                <div class="step-col"><small>Step2</small></div>
                <div class="step-col"><small>Step3</small></div>
            </div>
        </div>

        <script>
            //Current Address Validations            
            function CurrentValidation() {
                if ($('#CurrentAddress1').val() == '') {
                    swal({ text: "Current Address Line 1 is Mandatory", timer: 2000 });
                    $('#CurrentAddress1').focus();
                    return false;
                }

                if ($('#CurrentAddress1').val().length > 60) {
                    swal({ text: "Only 60 Characters Allowed In Current Address Line 1", timer: 2000 });
                    $('#CurrentAddress1').focus();
                    return false;
                }

                if ($('#Currentstate').val() == '0') {
                    swal({ text: "Current State is Mandatory ", timer: 2000 });
                    $('#Currentstate').focus();
                    return false;
                }
                if ($('#Currentcity').val() == '0') {
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

                if ($('#CurrentMobile').val().length != 10) {
                    swal({ text: "Invalid Current Mobile", timer: 2000 });
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

            //Permanent Address Validations
            function PermanentValidation() {
                if ($('#PermanentAddress1').val() == '') {
                    swal({ text: "Permanent Address Line 1 is Mandatory", timer: 2000 });
                    $('#PermanentAddress1').focus();
                    return false;
                }
                if ($('#PermanentAddress1').val().length > 60) {
                    swal({ text: "Only 60 Characters Allowed In Permanent Address Line 1", timer: 2000 });
                    $('#PermanentAddress1').focus();
                    return false;
                }

                if ($('#Permanentstate').val() == '0') {
                    swal({ text: "Permanent State is Mandatory", timer: 2000 });
                    $('#Permanentstate').focus();
                    return false;
                }

                if ($('#Permanentcity').val() == '0') {
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

                if ($('#PermanentMobile').val().length != 10) {
                    swal({ text: "Invalid Permanent Mobile", timer: 2000 });
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

            //Email Validation  
            function validateEmail(email) {
                const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return re.test(email);
            }

            $(document).ready(function () {
                //Jquery DatePicker Added
                $('#dobtext').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: "dd/mm/yy",
                    yearRange: "-90:+00"});
                var StoreAllCitiesList = [];
                var StoreAllStatesList = [];
                $('input').css('text-transform', 'uppercase');
                $('#CurrentEmailID').css('text-transform', 'lowercase');
                $('#PermanentEmailID').css('text-transform', 'lowercase');
                GetInitialDetailsFun();
                var obj = [];

                function GetInitialDetailsFun() {
                    swal({
                        text: "Loading.. Please Wait.. ",
                        closeOnClickOutside: false,
                        buttons: false
                    });

                    $.ajax({
                        type: "POST",
                        url: "Jct_Payroll_User_Detail1.aspx/GetInitialDetails",
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

                    //Current All Cities Loaded
                    $('#Currentcity').find('option').remove().end().append('<option value="0">*SELECT CITY</option>');
                    if (response.d.Cities) {
                        $.each(response.d.Cities, function (data, value) {
                            $("#Currentcity").append($("<option></option>").val(value).html(value));
                        })
                    }

                    //Set Current selectedCity
                    $.each(response.d.Cities, function (data, value) {
                        if (value == response.d.CurrentAddress.Currentcity) {
                            $('#Currentcity').val(response.d.CurrentAddress.Currentcity);
                        }
                    })

                    //Permanent All Cities Loaded
                    $('#Permanentcity').find('option').remove().end().append('<option value="0">*SELECT CITY</option>');
                    if (response.d.Cities) {
                        $.each(response.d.Cities, function (data, value) {
                            $("#Permanentcity").append($("<option></option>").val(value).html(value));
                        })
                    }

                    //Set Permanent selectedCity
                    $.each(response.d.Cities, function (data, value) {
                        if (value == response.d.PermanentAddress.Permanentcity) {
                            $('#Permanentcity').val(response.d.PermanentAddress.Permanentcity);
                        }
                    })

                    //Current All States Loaded
                    $('#Currentstate').find('option').remove().end().append('<option value = "0">*SELECT STATE</option>')
                    $.each(response.d.States, function (data, value) {
                        $('#Currentstate').append($('<option></option>').val(value.state).html(value.state));
                    });

                    //Set Current selectedState
                    $.each(response.d.States, function (data, value) {
                        if (value.state == response.d.CurrentAddress.Currentstate) {
                            $('#Currentstate').val(response.d.CurrentAddress.Currentstate)
                        }
                    })

                    $('#Permanentstate').find('option').remove().end().append('<option value = "0">*SELECT STATE</option>')
                    $.each(response.d.States, function (data, value) {
                        $('#Permanentstate').append($('<option></option>').val(value.state).html(value.state));
                    });

                    //Set Permanent selectedState
                    $.each(response.d.States, function (data, value) {
                        if (value.state == response.d.PermanentAddress.Permanentstate) {
                            $('#Permanentstate').val(response.d.PermanentAddress.Permanentstate);
                        }
                    })

                    //StoreAllCitiesList For Statemanagement
                    $.each(response.d.Cities, function (data, value) {
                        StoreAllCitiesList.push(value);
                    })

                    //StoreAllCitiesList For Statemanagement
                    $.each(response.d.States, function (data, value) {
                        StoreAllStatesList.push(value);
                    })


                    //Fill Current Address From Database  
                    $('#CurrentAddress1').val(response.d.CurrentAddress.CurrentAddress1);
                    $('#CurrentAddress2').val(response.d.CurrentAddress.CurrentAddress2);
                    $('#CurrentAddress3').val(response.d.CurrentAddress.CurrentAddress3);
                    //$('#Currentstate').val(response.d.CurrentAddress.Currentstate);
                    //$('#Currentcity').val(response.d.CurrentAddress.Currentcity);
                    $('#CurrentPincode').val(response.d.CurrentAddress.CurrentPincode);
                    $('#CurrentMobile').val(response.d.CurrentAddress.CurrentMobile);
                    $('#CurrentSecondaryMobileNo').val(response.d.CurrentAddress.CurrentSecondaryMobileNo);
                    $('#CurrentPrimaryLandline').val(response.d.CurrentAddress.CurrentPrimaryLandline);
                    $('#CurrentEmailID').val(response.d.CurrentAddress.CurrentEmailID);

                    //Fill Permanent Address From Database                                     
                    $('#PermanentAddress1').val(response.d.PermanentAddress.PermanentAddress1);
                    $('#PermanentAddress2').val(response.d.PermanentAddress.PermanentAddress2);
                    $('#PermanentAddress3').val(response.d.PermanentAddress.PermanentAddress3);
                    //$('#Permanentstate').val(response.d.PermanentAddress.Permanentstate);
                    //$('#Permanentcity').val(response.d.PermanentAddress.Permanentcity);
                    $('#PermanentPincode').val(response.d.PermanentAddress.PermanentPincode);
                    $('#PermanentMobile').val(response.d.PermanentAddress.PermanentMobile);
                    $('#PermanentSecondaryMobileNo').val(response.d.PermanentAddress.PermanentSecondaryMobileNo);
                    $('#PermanentPrimaryLandline').val(response.d.PermanentAddress.PermanentPrimaryLandline);
                    $('#PermanentEmailID').val(response.d.PermanentAddress.PermanentEmailID);




                    //Fill Family Detail Table From Database  
                    if (response.d.FamilyDetails.length > 0) {
                        for (var i = 0; i < response.d.FamilyDetails.length; i++) {
                            //$('#FamilyDetailTable').append('<tr><td>' + response.d.FamilyDetails[i].Relation + '</td><td>' + response.d.FamilyDetails[i].Name + '</td><td>' + response.d.FamilyDetails[i].dob + '</td></tr>');
                            //$('#FamilyDetailTable').append('<tr><td>' + response.d.FamilyDetails[i].Relation + '</td><td>' + response.d.FamilyDetails[i].Name + '</td><td>' + response.d.FamilyDetails[i].dob + '</td><td><input type="button" class = "clsDelete"><i class="fa fa-trash" aria-hidden="true"></i></input></td></tr>');
                            $('#FamilyDetailTable').append('<tr><td><div class="clsDelete"><i class="fas fa-trash-alt" aria-hidden="true"></i></div></td><td>' + response.d.FamilyDetails[i].Relation + '</td><td>' + response.d.FamilyDetails[i].Name + '</td><td>' + response.d.FamilyDetails[i].dob + '</td><td>NO</td></tr>');
                        }
                    }


                    //if (response.d.CurrentAddress.CurrentSubmitStatus == true && response.d.PermanentAddresss.PermanentSubmitStatus == true)
                    if (response.d.PermanentAddress.PermanentSubmitStatus == true && response.d.CurrentAddress.CurrentSubmitStatus == true) {
                        swal({
                            //title: "Data Saved And Locked Successfully! ",
                            //title: "Data Saved And Locked Successfully! ",
                            title: "" + response.d.CurrentAddress.SelectedUser + "  YOUR DATA IS SUCCESSFULLY SAVED AND LOCKED! ",
                            text: "Please Contact IT Department At 1661 To Unlock",
                            showConfirmButton: false,
                            icon: "success",
                            timer: 5000
                        });
                        $('input').prop('disabled', true).css('background-color', '#e6d596;');
                        $('select').prop('disabled', true).css('background-color', '#e6d596;');
                        $('#submit').prop('disabled', true);
                        $('#submit').text('Locked');

                    }
                }


                // Logic to iterate and make array of objects for insert for table records
                function tablerowsdata() {
                    var table = document.getElementById('FamilyDetailTable');
                    for (let i = 0; i < table.rows.length; i++) {
                        var tr = table.rows[i];
                        let myarr = [];
                        for (var j = 0; j < tr.cells.length; j++) {
                            var td = tr.cells[j].innerText;
                            myarr.push(td)
                        }
                        if (i > 0) {
                            obj.push({
                                Relation: myarr[1],
                                Name: myarr[2],
                                dob: myarr[3]
                            });
                        }
                    }
                }

                //Add Rows
                $('#AddRowbtn').click(function () {
                    debugger;
                    console.log($('#dobtext').val());
                    //var date = new Date('2010-10-11T00:00:00+05:30');
                    //var date = new Date('2021-06-25');

                    var dateParts = $('#dobtext').val().split("/");

                    // month is 0-based, that's why we need dataParts[1] - 1
                    var date = new Date(+dateParts[2], dateParts[1] - 1, +dateParts[0]);

                    var dateObject = ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())) + '/' + ((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '/' + date.getFullYear();
                    var cusdate = dateObject.toString();

                    //document.body.innerHTML = dateObject.toString();

                    //var date = new Date($('#dobtext').val());
                    console.log(cusdate.toString());
                    //alert(((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '/' + ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())) + '/' + date.getFullYear());

                    //mm/dd/yyyy working
                    //var cusdate = ((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '/' + ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())) + '/' + date.getFullYear();
                    //modified not working
                   // var cusdate = ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())) + '/' + ((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '/' + date.getFullYear();
                    //if (((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '/' + ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())) + '/' + date.getFullYear() == "Invalid Date")
                    //    return false;
                    //;


                    $('#FamilyDetailTable > tbody:last-child').append('<tr><td><div class="clsDelete"><i class="fas fa-trash-alt" aria-hidden="true"></i></div></td><td>' + $('#RelationDropdown option:selected').text() + '</td><td>' + $('#nametext').val() + '</td><td>' + cusdate + '</td><td>NO</td></tr>');

                    //last value before adding thrash
                    //$('#FamilyDetailTable > tbody:last-child').append('<tr><td>' + $('#RelationDropdown option:selected').text() + '</td><td>' + $('#nametext').val() + '</td><td>' + date + '</td><td><input type="button" value="Delete Row1"></td></tr>');

                    //$('#FamilyDetailTable > tbody:last-child').append('<tr><td>' + $('#RelationDropdown option:selected').text() + '</td><td>' + $('#nametext').val() + '</td><td>' + date + '</td></tr>');

                    //$('#FamilyDetailTable > tbody:last-child').append('<tr><td>' + $('#RelationDropdown option:selected').text() + '</td><td>' + $('#nametext').val() +  '<td></td>'+ $('#dobtext').val() + '</td></tr>');
                });



                //Submit the Form
                $('#submit').click(function (e) {
                    if (PermanentValidation()) {

                        //$('#myform').submit(function (e) {
                        debugger;
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


                        debugger;

                        obj = [];
                        tablerowsdata();
                        console.log(currentAddress);
                        console.log(permanentAddress);
                        console.log(obj);




                        $.ajax({
                            type: "POST",
                            url: "Jct_Payroll_User_Detail1.aspx/SaveUser",
                            //data: '{user: ' + JSON.stringify(user) + '}',
                            //data: '{user: ' + JSON.stringify(user) + ', user1: ' + JSON.stringify(user) + ' }',
                            //data: '{user: ' + JSON.stringify(currentAddress) + ', user1: ' + JSON.stringify(permanentAddress) + ', user2: ' + JSON.stringify(obj) + ' }',
                            //Before Adding third Form Worked 
                            //data: '{user: ' + JSON.stringify(currentAddress) + ', user1: ' + JSON.stringify(permanentAddress) + '}',
                            data: '{user: ' + JSON.stringify(currentAddress) + ', user1: ' + JSON.stringify(permanentAddress) + ', user2: ' + JSON.stringify(obj) + ' }',
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
                            complete: function (xhr, textStatus) {
                                debugger;
                                if (textStatus == 'success') {
                                    window.location.reload();
                                }
                                else {
                                    swal({
                                        text: "Time Out...Please Try After Sometime! ",
                                        closeOnClickOutside: false,
                                        buttons: false,
                                        timer: 3000
                                    });
                                }
                            }
                        });
                    }
                });

                $('input[type="checkbox"]').click(function () {
                    if ($(this).is(":checked")) {

                        ////Set Permanent States Again
                        //$('#Permanentstate').find('option').remove().end().append('<option value = "0">SELECT STATE</option>')
                        //$.each(StoreAllStatesList, function (data, value) {
                        //    $('#Permanentstate').append($('<option></option>').val(value.state).html(value.state));
                        //});

                        //Set Permanent Cities Again
                        $('#Permanentcity').find('option').remove().end().append('<option value="0">*SELECT CITY</option>');
                        $.each(StoreAllCitiesList, function (data, value) {
                            $("#Permanentcity").append($("<option></option>").val(value).html(value));
                        });

                        $('#PermanentAddress1').val($('#CurrentAddress1').val());
                        $('#PermanentAddress2').val($('#CurrentAddress2').val());
                        $('#PermanentAddress3').val($('#CurrentAddress3').val());
                        $('#Permanentstate').val($('#Currentstate').val());
                        $('#Permanentcity').val($('#Currentcity').val());
                        $('#PermanentPincode').val($('#CurrentPincode').val());
                        $('#PermanentMobile').val($('#CurrentMobile').val());
                        $('#PermanentSecondaryMobileNo').val($('#CurrentSecondaryMobileNo').val());
                        $('#PermanentPrimaryLandline').val($('#CurrentPrimaryLandline').val());
                        $('#PermanentEmailID').val($('#CurrentEmailID').val());
                    }
                    else {
                        $('#PermanentAddress1').val('');
                        $('#PermanentAddress2').val('');
                        $('#PermanentAddress3').val('');
                        $('#Permanentstate').val('0');
                        $('#Permanentcity').val('0');
                        $('#PermanentPincode').val('');
                        $('#PermanentMobile').val('');
                        $('#PermanentSecondaryMobileNo').val('');
                        $('#PermanentPrimaryLandline').val('');
                        $('#PermanentEmailID').val('');
                    }
                });

                $("#Currentstate").change(function () {
                    $('#Currentcity').find('option').remove().end().append('<option value="0">*SELECT CITY</option>');
                    SearchCurrentCity();
                });

                function SearchCurrentCity() {
                    //swal({
                    //    text: "Please wait Loading Cities",
                    //    closeOnClickOutside: false,
                    //    buttons: false
                    //});


                    $.ajax({
                        type: "POST",
                        url: "Jct_Payroll_User_Detail1.aspx/CityList",
                        data: '{statename: "' + $("#Currentstate option:selected").text() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: OnSuccessCurrentCity,
                        error: function (response) {
                            swal.close();
                        },
                        complete: function (xhr, textStatus) {
                            if (textStatus == 'error') {
                                swal({
                                    text: "Error In Loading City! ",
                                    closeOnClickOutside: false,
                                    buttons: false,
                                    timer: 3000
                                });
                            }
                            else {
                                swal.close();
                            }
                        }
                    });
                }

                function OnSuccessCurrentCity(response) {

                    if (response.d) {
                        $.each(response.d, function (data, value) {
                            $("#Currentcity").append($("<option></option>").val(value.city_name).html(value.city_name));
                        })
                    }
                    else {
                        alert('No City Found For This Category');
                    }
                }

                $("#Permanentstate").change(function () {
                    $('#Permanentcity').find('option').remove().end().append('<option value="0">*SELECT CITY</option>');
                    SearchCity();
                });

                function SearchCity() {
                    //swal({
                    //    text: "Please wait Loading Cities",
                    //    closeOnClickOutside: false,
                    //    buttons: false
                    //});

                    $.ajax({
                        type: "POST",
                        url: "Jct_Payroll_User_Detail1.aspx/CityList",
                        data: '{statename: "' + $("#Permanentstate option:selected").text() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: OnSuccessCity,
                        error: function (response) {
                            swal.close();
                        },
                        complete: function (xhr, textStatus) {
                            if (textStatus == 'error') {
                                swal({
                                    text: "Error In Loading City! ",
                                    closeOnClickOutside: false,
                                    buttons: false,
                                    timer: 3000
                                });
                            }
                            else {
                                swal.close();
                            }
                        }
                    });
                }

                function OnSuccessCity(response) {
                    if (response.d) {
                        $.each(response.d, function (data, value) {
                            $("#Permanentcity").append($("<option></option>").val(value.city_name).html(value.city_name));
                        })
                    }
                    else {
                        alert('No City Found For This Category');
                    }
                }

            });

            //Start Logic
            var Form1 = document.getElementById("Form1");
            var Form2 = document.getElementById("Form2");
            var Form3 = document.getElementById("Form3");

            var Next1 = document.getElementById("Next1");
            var Next2 = document.getElementById("Next2");

            var Back1 = document.getElementById("Back1");
            var Back2 = document.getElementById("Back2");

            var progress = document.getElementById("progress");
            var c = document.getElementById("containers");
            


            Next1.onclick = function () {
                if (CurrentValidation()) {
                    Form1.style.left = "-450px";
                    Form2.style.left = "40px";
                    progress.style.width = "240px"
                }
            }

            Back1.onclick = function () {
                Form1.style.left = "40px";
                Form2.style.left = "450px";
                progress.style.width = "120px"
            }

            Next2.onclick = function () {
                Form2.style.left = "-450px";
                Form3.style.left = "40px";
                progress.style.width = "360px"
                containers.style.height = "720px"
            }

            Back2.onclick = function () {
                Form3.style.left = "450px";
                Form2.style.left = "40px";
                progress.style.width = "180px"
                containers.style.height = "620px"
            }


            //Delete Family Details Rows Delete
            $(document).on('click', '.clsDelete', function () {
                alert('hi');
                $(this).closest('tr').remove()
            });

        </script>


    </body>

    </html>

</asp:Content>

