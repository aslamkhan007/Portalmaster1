<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Jct_Payroll_User_Detail.aspx.cs" Inherits="Jct_Payroll_User_Detail" %>

<!DOCTYPE html>
<html>

<head>
    <title>HTML Document</title>
    <link rel="stylesheet" href="styleMul.css" />
    <link href="Newfolder10/jquery-ui.css" rel="stylesheet" />
    <link href="Newfolder10/css/fontawesome.css" rel="stylesheet" />
    <link href="Newfolder10/css/all.css" rel="stylesheet" />
    <script src="js/jquery.min.2.2.0.js"></script>
    <script src="Newfolder10/jquery-ui.min.js"></script>
    <script src="Newfolder10/sweetalert.min.js"></script>
    <script src="Newfolder10/js/fontawesome.js"></script>
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
                <input type="text" id="CurrentPincode" name="CurrentPincode" placeholder="Pincode" />
                <input type="text" id="CurrentMobile" name="CurrentMobile" placeholder="Mobile" />
                <input type="text" id="CurrentSecondaryMobileNo" name="CurrentSecondaryMobileNo" placeholder="SecondaryMobileNo" />
                <input type="text" id="CurrentPrimaryLandline" name="CurrentPrimaryLandline" placeholder="LandLine" />
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
                <input type="text" id="PermanentPincode" name="PermanentPincode" placeholder="Pincode" />
                <input type="text" id="PermanentMobile" name="PermanentMobile" placeholder="Mobile" />
                <input type="text" id="PermanentSecondaryMobileNo" name="PermanentSecondaryMobileNo" placeholder="Mobile" />
                <input type="text" id="PermanentPrimaryLandline" name="PermanentPrimaryLandline" placeholder="LandLine" />
                <input type="text" id="PermanentEmailID" name="PermanentEmailID" placeholder="Email" />

                <div class="btn-box">
                    <button type="button" id="Back1">Back</button>
                    <button type="button" id="Next2">Next</button>
                </div>
            </div>


            <div id="Form3">
                <h3>PersonalInfo</h3>
                <table id="AddRowTable">
                    <tr>
                        <td>
                            <label>Relation</label>
                            <select id="RelationDropdown">
                                <option value="Self">Self</option>
                                <option value="Spouse">Spouse</option>
                                <option value="Father">Father</option>
                                <option value="Mother">Mother</option>
                                <option value="Daughter">Daughter</option>
                                <option value="Son">Son</option>
                                <option value="FatherInLaw">FatherInLaw</option>
                                <option value="MotherInLaw">MotherInLaw</option>
                            </select>
                        </td>

                    </tr>

                    <tr>
                        <td>
                            <label>Name</label>
                            <input type="text" id="nametext" />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label>DOB</label>
                            <input type="text" id="dobtext" />

                        </td>
                    </tr>

                    <tr>
                        <td>

                            <input type="button" id="AddRowbtn" />
                        </td>
                    </tr>
                </table>


                <table id="FamilyDetailTable">
                    <thead>
                        <tr>
                            <th>Relation
                            </th>
                            <th>Name
                            </th>
                            <th>Age
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>

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

    <script>

        $(document).ready(function () {

            //Jquery DatePicker Added
            $('#dobtext').datepicker();            
            GetInitialDetailsFun();
            var obj = [];
            //Page Load First Method
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

            //Response On Page Load
            function OnSuccessGetInitialDetails(response) {
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

                //Fill Family Detail Table From Database  
                if (response.d.FamilyDetails.length > 0) {
                    for (var i = 0; i < response.d.FamilyDetails.length; i++) {
                        //$('#FamilyDetailTable').append('<tr><td>' + response.d.FamilyDetails[i].Relation + '</td><td>' + response.d.FamilyDetails[i].Name + '</td><td>' + response.d.FamilyDetails[i].dob + '</td></tr>');
                        //$('#FamilyDetailTable').append('<tr><td>' + response.d.FamilyDetails[i].Relation + '</td><td>' + response.d.FamilyDetails[i].Name + '</td><td>' + response.d.FamilyDetails[i].dob + '</td><td><input type="button" class = "clsDelete"><i class="fa fa-trash" aria-hidden="true"></i></input></td></tr>');
                        $('#FamilyDetailTable').append('<tr><td>' + response.d.FamilyDetails[i].Relation + '</td><td>' + response.d.FamilyDetails[i].Name + '</td><td>' + response.d.FamilyDetails[i].dob + '</td><td><div class="clsDelete"><i class="fa fa-trash" aria-hidden="true"></i></div></td></tr>');
                    }
                }

            }

            //Logic to iterate and make array of objects for insert for table records
            function tablerowsdata() {
                var table = document.getElementById('FamilyDetailTable');
                for (let i = 0 ; i < table.rows.length; i++) {
                    var tr = table.rows[i];
                    let myarr = [];
                    for (var j = 0; j < tr.cells.length ; j++) {
                        var td = tr.cells[j].innerText;
                        myarr.push(td)
                    }
                    obj.push({
                        Relation: myarr[0],
                        Name: myarr[1],
                        dob: myarr[2]
                    });
                }
            }

            //Add Rows
            $('#AddRowbtn').click(function () {
                console.log($('#dobtext').val());
                //var date = new Date('2010-10-11T00:00:00+05:30');
                //var date = new Date('2021-06-25');
                var date = new Date($('#dobtext').val());
                console.log(date);
                alert(((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '/' + ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())) + '/' + date.getFullYear());

                $('#FamilyDetailTable > tbody:last-child').append('<tr><td>' + $('#RelationDropdown option:selected').text() + '</td><td>' + $('#nametext').val() + '</td><td>' + date + '</td><td><input type="button" value="Delete Row1"></td></tr>');
                //$('#FamilyDetailTable > tbody:last-child').append('<tr><td>' + $('#RelationDropdown option:selected').text() + '</td><td>' + $('#nametext').val() + '</td><td>' + date + '</td></tr>');

                //$('#FamilyDetailTable > tbody:last-child').append('<tr><td>' + $('#RelationDropdown option:selected').text() + '</td><td>' + $('#nametext').val() +  '<td></td>'+ $('#dobtext').val() + '</td></tr>');
            });

            //Submit the Form
            $('#myform').submit(function (e) {
                e.preventDefault();
                alert('hi');
                debugger;

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

                obj = [];
                tablerowsdata();
                console.log(currentAddress);
                console.log(permanentAddress);
                console.log(obj);

                $.ajax({
                    type: "POST",
                    url: "Jct_Payroll_User_Detail.aspx/SaveUser",
                    //data: '{user: ' + JSON.stringify(user) + '}',
                    //data: '{user: ' + JSON.stringify(user) + ', user1: ' + JSON.stringify(user) + ' }',
                    data: '{user: ' + JSON.stringify(currentAddress) + ', user1: ' + JSON.stringify(permanentAddress) + ', user2: ' + JSON.stringify(obj) + ' }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert("User has been added successfully.");
                        //swal("Saved", "...Record Saved Successfully!");
                        //  window.location = "http://localhost:49645/Jct_Payroll_Holiday_List.aspx";
                        //window.location.reload();
                    },
                    error: function (error) {
                        debugger;
                        console.log(error);
                    }
                });
            });

            function OnSuccessPostInitialDetails(response) {
                debugger;
            }
        });

        //Start Logic
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
        }
        Back3.onclick = function () {
            Form3.style.left = "40px";
            Form4.style.left = "450px";
            progress.style.width = "270px"

        }

        //Delete Family Details Rows Delete
        $(document).on('click', '.clsDelete', function () {
            alert('hi');
            $(this).closest('tr').remove()
        });

    </script>


</body>

</html>
