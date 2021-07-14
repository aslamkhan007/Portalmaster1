<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Jct_Payroll_User_Detail.aspx.cs" Inherits="Jct_Payroll_User_Detail" %>

<!DOCTYPE html>
<html>

<head>
    <title>HTML Document</title>
    <%--<link rel="stylesheet" href="styleMul.css" />--%>
    <%--<link href="css/jquery-ui.min.css" rel="stylesheet" />--%>
    <link href="css/jquery-ui.css" rel="stylesheet" />
      <script src="js/jquery.min.2.2.0.js"></script>
    <script src="js/jquery-ui.min.js"></script>
        <script src="sweetalert.min.js"></script>
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
                <h3>PersonalInfo</h3>
            <table id ="AddRowTable">
                <tr>
                    <td>
                        <label>Relation</label>
                        <select id ="RelationDropdown">
                            <option value ="Self">Self</option>
                            <option value ="Spouse">Spouse</option>
                            <option value ="Father">Father</option>
                            <option value ="Mother">Mother</option>
                            <option value ="Daughter">Daughter</option>
                            <option value ="Son">Son</option>
                            <option value ="FatherInLaw">FatherInLaw</option>
                            <option value ="MotherInLaw">MotherInLaw</option>
                        </select>
                    </td>
                 
                </tr>

                   <tr>                                          
                    <td>
                         <label>Name</label>
                        <input type = "text" id ="nametext" />
                    </td>
                </tr>

                     <tr>                                          
                    <td>
                         <label>DOB</label>
                        <%--<input type = "text" id ="dobtext" />--%>
                        <input type = "text" id ="dobtext" />
                        <%--<input type = "date" id ="dobtext" />--%>
                    </td>
                </tr>

                   <tr>                                          
                    <td>
                         
                        <input type = "button" id ="AddRowbtn" />
                    </td>
                </tr>


                </table>    
            <table id ="FamilyDetailTable">
                <thead>                    
                    <tr>
                        <th>
                            Relation
                        </th>
                        <th>
                            Name
                        </th>
                        <th>
                            Age
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
   
    <script>

        $(document).ready(function () {

            $('#dobtext').datepicker();
            //$('#dobtext').change(function () {
            //    alert('hi');
            //});

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

                if (response.d.FamilyDetails.length > 0) {
                    for (var i = 0; i < response.d.FamilyDetails.length; i++) {
                        $('#FamilyDetailTable').append('<tr><td>' + response.d.FamilyDetails[i].Relation + '</td><td>' + response.d.FamilyDetails[i].Name + '</td><td>' + response.d.FamilyDetails[i].dob + '</td></tr>');
                    }
                }
               
            }
            
            var tid = "";
            var obj = [];

//            $('#FamilyDetailTable').click(function (event) {

//                debugger;

//                //$('#FamilyDetailTable tr').each(function (index) {
//                //    if (index > 0) {
//                //    let tr = $(this).text();
//                //    //console.log(tr);
//                //    var tdArray = [];
//                //    $(this).find('td').each(function () {
//                //        var td = $(this).text;
                        
//                //        var items = {};
//                //        items[tr] = td;
//                //        console.log(td);
//                //        //console.log(items[tr]);
//                //        tdArray.push(items);
//                //        console.log(tdArray);
//                //        console.log(items);
                        
//                //    });

//                //    }

//                //});

//                //var trArray = [];
//                //$('#FamilyDetailTable tr').each(function () {
//                //    var tr = $(this).text();  //get current tr's text
//                //    var tdArray = [];
//                //    $(this).find('td').each(function () {
//                //        var td = $(this).text();  //get current td's text
//                //        var items = {}; //create an empty object
//                //        items[tr] = td; // add elements to object 
//                //        trArray.push(items); //push the object to array
//                //        //console.log(items);
//                //        //console.log(tdArray);
//                //    });
//                //    //console.log(items);
//                //    //console.log(tdArray);
//                //});
//                //console.log(trArray);



//                //var table = document.getElementById('FamilyDetailTable');
//                //for (let i in table.rows) {
//                //    var tr = table.rows[i];
//                //    //console.log(tr);
                    
//                //    for(var j in tr.cells)
//                //    {
//                //        var td = tr.cells[j]

//                //        console.log(td);

//                //    }

//                //}


////array of objects created with error 

//                //var obj = [];
//                //var table = document.getElementById('FamilyDetailTable');
//                //for (let i in table.rows) {
//                //    var tr = table.rows[i];
//                //    //console.log(tr);
                   
                    
//                //    let myarr = [];
//                //    //for (var j in tr.cells[2]) {
//                //    for (var j = 0; j < 3 ; j++) {
//                //        //debugger;
                       
//                //        var td = tr.cells[j].innerText

//                //        //console.log(td);
//                //        //obj.push({
//                //        //    Name: td
//                //        //});
                       
//                //        //console.log(td);
//                //        myarr.push(td)
//                //        //console.log(myarr);
//                //        j++;
//                //    }
//                //    //console.log(myarr);
//                //    //obj.push({
//                //    //    Relation: myarr[0],
//                //    //    Name: myarr[1],
//                //    //    Dob: myarr[2]
//                //    //});
//                //    //console.log(obj);

//                //    obj.push({
//                //        Relation: myarr[0],
//                //        Name: myarr[1]                      
//                //    });
//                //    console.log(obj);

//                //}

                



//                //var obj = [];

//                var table = document.getElementById('FamilyDetailTable');

//                for (let i = 0 ; i < table.rows.length; i++) {
//                    var tr = table.rows[i];
//                    //console.log(tr);


//                    let myarr = [];
//                    //for (var j in tr.cells[2]) {
//                    //for (var j = 0; j < 4 ; j++) {
//                    for (var j = 0; j < tr.cells.length ; j++) {
//                        //debugger;

//                        var td = tr.cells[j].innerText;

//                        //console.log(td);
//                        //obj.push({
//                        //    Name: td
//                        //});

//                        //console.log(td);
//                        myarr.push(td)
//                        //console.log(myarr);
//                        //j++;
//                    }
//                    //console.log(myarr);
//                    obj.push({
//                        Relation: myarr[0],
//                        Name: myarr[1],
//                        dob: myarr[2]
//                    });
//                    //console.log(obj);

//                    //obj.push({
//                    //    Relation: myarr[0],
//                    //    Name: myarr[1]
//                    //});
//                    //console.log(obj);

//                }



//            });
            

            //For Delete row javascript
            //var index, table = document.getElementById(FamilyDetailTable);
            var table = document.getElementById('FamilyDetailTable');
         
            for (var i = 0 ; i < table.rows.length; i++) {
                table.rows[i].cells[2].onclick = function () {
                //table.rows[i].onclick = function () {
                    debugger;
                    console.log(index);
                    console.log(table);
                    var c = confirm("do you want to delete this row");
                    if (c === true) {

                        //index = this.parentElement.rowIndex;
                        index = this.parentElement.rowIndex;
                        table.deleteRow(index);
                    }


                }
            }

            //var index, table = document.getElementById('table');
            //for (var i = 1; i < table.rows.length; i++) {
            //    table.rows[i].cells[3].onclick = function () {
            //        var c = confirm("do you want to delete this row");
            //        if (c === true) {
                        
            //            index = this.parentElement.rowIndex;
            //            table.deleteRow(index);
            //        }

            //        //console.log(index);
            //    };

            //}


            $('#AddRowbtn').click(function () {
                
                console.log($('#dobtext').val());

                //var date = new Date('2010-10-11T00:00:00+05:30');
                //var date = new Date('2021-06-25');
                var date = new Date($('#dobtext').val());
                console.log(date);
                alert(((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '/' + ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())) + '/' + date.getFullYear());

                $('#FamilyDetailTable > tbody:last-child').append('<tr><td>' + $('#RelationDropdown option:selected').text() + '</td><td>' + $('#nametext').val() + '</td><td>' + date + '</td></tr>');

                //$('#FamilyDetailTable > tbody:last-child').append('<tr><td>' + $('#RelationDropdown option:selected').text() + '</td><td>' + $('#nametext').val() +  '<td></td>'+ $('#dobtext').val() + '</td></tr>');
            });

            $('#myform').submit(function (e) {
                e.preventDefault();                
                alert('hi');
                debugger;
                console.log(obj);

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

              console.log(user);
                //function PostInitialDetailsFun() {
                $.ajax({
                    type: "POST",
                    url: "Jct_Payroll_User_Detail.aspx/SaveUser",
                    //data: '{user: ' + JSON.stringify(user) + '}',
                    //data: '{user: ' + JSON.stringify(user) + ', user1: ' + JSON.stringify(user) + ' }',
                    data: '{user: ' + JSON.stringify(user) + ', user1: ' + JSON.stringify(user) + ', user2: ' + JSON.stringify(obj) + ' }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        swal({
                            title: "Are you sure?",
                            text: "Once deleted, you will not be able to recover this imaginary file!",
                            icon: "warning",
                            buttons: true,
                            dangerMode: true,
                        })
                    .then(function (willDelete)  {
                        if (willDelete) {
    swal("Poof! Your imaginary file has been deleted!", {
        icon: "success",
    });
                    } else {
    swal("Your imaginary file is safe!");
            }
                });

                        //alert("User has been added successfully.");
                        //swal("Here's the title!", "...and here's the text!");

                      //  window.location = "http://localhost:49645/Jct_Payroll_Holiday_List.aspx";
                        //window.location.reload();
                    }
                });

            });


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
