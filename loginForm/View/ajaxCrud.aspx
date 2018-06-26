<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ajaxCrud.aspx.cs" Inherits="loginForm.View.ajaxCrud" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

<meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>

    <%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>--%>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="~/Content/crudStyle.css" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="form-group" style="margin-left: 1000px;">
            <a id="New">New</a>
            <a id="Save"> Save</a>
            <a id="Cancel"> Cancel</a>
        </div>

        <div>
            <table id="studentTable" class="table table-striped">
                <tr>
                    <th style="display:none;"></th>
                    <th class='col-lg-1 col-md-1 col-sm-1 col-xs-1' >First Name</th>
                    <th class='col-lg-1 col-md-1 col-sm-1 col-xs-1'>Last Name</th>
                    <th class='col-lg-1 col-md-1 col-sm-1 col-xs-1'>Is Active</th>
                    <th class='col-lg-1 col-md-1 col-sm-1 col-xs-1'>Date of birth</th>
                    <th class='col-lg-1 col-md-1 col-sm-1 col-xs-1'>District</th>
                    <th class='col-lg-1 col-md-1 col-sm-1 col-xs-1'>Municipality</th>
                    <th class='col-lg-1 col-md-1 col-sm-1 col-xs-1'>Address</th>
                    <th class='col-lg-1 col-md-1 col-sm-1 col-xs-1'>Gender</th>
                    <th class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>Photo</th>
                    <th class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>Action</th>
                </tr>

            </table>
        </div>
    </form>
</body>
<script>

    var DisMun = {};
    DisMun['Kathmandu'] = ['Kirtipur', 'Tokha', 'Dakshinkali'];
    DisMun['Lalitpur'] = ['Lalitpur', 'Mahalakshmi', 'Karyabinayak', 'Godawari'];
    DisMun['Bhaktapur'] = ['Bhaktapur', 'Changunarayan', 'Madhyapur thimi'];

    function ChangeDistrictList() {
        var districtList = document.getElementById("district");
        var municipalityList = document.getElementById("municipality");
        var selDis = districtList.options[districtList.selectedIndex].value;
        while (municipalityList.options.length) {
            municipalityList.remove(0);
        };
        var districts = DisMun[selDis];
        if (districts) {
            var i;
            for (i = 0; i < districts.length; i++) {
                var district = new Option(districts[i], districts[i]);
                municipalityList.options.add(district);
            };
        };
    };
    

    $(document).ready(function(){
        // This AJAX is used to show data from database when page is 
        $('#Save').hide();
        $('#Cancel').hide();
        $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' });

            $.ajax({
                type: "POST",
                url: 'ajaxCrud.aspx/Page_Load',
                data: {},
                async: true,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                      
                        $("#studentTable").append("<tr><td style='display:none;'><input  type='hidden' value=" + data.d[i].studentId + "></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lblfirstname'>"
                                                        + data.d[i].firstName +
                                                        "</label></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lbllastname'>" + data.d[i].lastName +
                                                        "</label></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lblisactive'>" + data.d[i].isActive +
                                                        "</label></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lbldateofbirth'>" + ToJavaScriptDate(data.d[i].dateOfBirth) +
                                                        "</label></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lbldistrict'>" + data.d[i].District +
                                                        "</label></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lblmunicipality'>" + data.d[i].Municipality +
                                                        "</label></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lbladdress'>" + data.d[i].Address +
                                                        "</label></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lblgender'>" + data.d[i].Gender +
                                                        "</td><td class='col-lg-2 col-md-2 col-sm-2 col-xs-2'><img src='/Content/" + data.d[i].Photo + "' class='img-rounded'/><label style='visibility:hidden;' class='lblphoto'>" + data.d[i].Photo +
                                                         "</label></td><td class='col-lg-2 col-md-2 col-sm-2 col-xs-2'><a id='delete'>Delete</a><a id='edit'> Edit</a></td></tr>");
                    } 

                },
                error: function () {
                    console.log("An error has occurred during processing your request.");
                }

            });

        
    });
    function ToJavaScriptDate(value) {
        var pattern = /Date\(([^)]+)\)/;
        var results = pattern.exec(value);
        var dt = new Date(parseFloat(results[1]));
        return (dt.getMonth() + 1) + "/" + dt.getDate() + "/" + dt.getFullYear();
    }
 
    $('#Cancel').click(function(){
             
        $('#studentTable').find('.inputRow').remove();
        $('#Save').hide();
        $('#New').show();
        $('#Cancel').hide();
    
    
    });
  

        //When new is pressed
    $('#New').click(function () {
        
        $('#Save').show();
        $('#Cancel').show();
        $('#studentTable').append("<tr class='inputRow'><td style='display:none;'></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><input type='text' id='fNameInput' class='form-control' placeholder='FirstName'/></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><input type='text' class='form-control' id='lNameInput' placeholder='LastName'/></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><input type='checkbox' id='isActiveInput' value='true'/></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><input type='text' class='form-control' id='datepicker'></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><select class='form-control' onchange='ChangeDistrictList()' id='district'><option value=''>-- District --</option><option value='Kathmandu'>Kathmandu</option><option value='Lalitpur'>Lalitpur</option><option value='Bhakapur'>Bhaktapur</option></select></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><select class='form-control' id='municipality'></select></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><input type='text' class='form-control' id='Address' placeholder='Address'/></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><select class='form-control' id='gender'><option value='Male'>Male</option><option value='Female'>Female</option></select></td><td class='col-lg-2 col-md-2 col-sm-2 col-xs-2'><input class='form-control' id='file' type='file'/></td><td class='col-lg-2 col-md-2 col-sm-2 col-xs-2'><a id='delete'>Delete</a></td></tr>");


        $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
        $('#New').hide();

    });
    var filePath = '';
    $('#studentTable').on('change', 'input[type=file]', function (e) {

        filePath = e.target.files[0].name;

    });
        $('#Save').click(function () {
            $('#edit').show();
            $('#New').show();
            $('#Save').hide();
            $('#Cancel').hide();
            $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' });

           

            var firstName = $('#fNameInput').val();
            var lastName = $('#lNameInput').val();
            var checkedValue = $('#isActiveInput:checked').val();
            var addressSelect = $('#Address').val();
            var districtSelect = $('#district').val();
            var municipalitySelect = $('#municipality').val();
            var genderSelect = $('#gender').val();

            var dateepick = $("#datepicker").datepicker("getDate");
            var datepick = convert(dateepick);

            console.log(firstName);
            console.log(lastName);
            console.log(checkedValue);
            console.log(addressSelect);
            console.log(districtSelect);
            console.log(municipalitySelect);
            console.log(genderSelect);
            console.log(filePath);
            console.log(datepick);


            //save to database
            $.ajax({
                type: "POST",
                url: 'ajaxCrud.aspx/Save_data',
                data: JSON.stringify({ Fname: firstName, Lname: lastName, Active: checkedValue, Date: datepick, District: districtSelect, Municipality: municipalitySelect, Photo: filePath, Address: addressSelect, Gender: genderSelect }),
                async: true,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    alert(data.d);
                },
                error: function () {
                    console.log("An error has occurred during processing your request.");
                }

            }).done(BindTable);

            $('#studentTable').find('.inputRow').remove();

        });

        function convert(str) {
            var date = new Date(str),
                mnth = ("0" + (date.getMonth() + 1)).slice(-2),
                day = ("0" + date.getDate()).slice(-2);
            return [date.getFullYear(), mnth, day].join("-");
        }


        //To show saved data on table
        function BindTable() {
            $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
            $.ajax({
                type: "POST",
                url: 'ajaxCrud.aspx/showInTable',
                data: {},
                async: true,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        
                        $("#studentTable").append("<tr><td style='display:none;'><input  type='hidden' value=" + data.d[i].studentId + "></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lblfirstname'>"
                                                        + data.d[i].firstName +
                                                        "</td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lbllastname'>" + data.d[i].lastName +
                                                        "</td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lblisactive'>" + data.d[i].isActive +
                                                        "</td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lbldateofbirth'>" + ToJavaScriptDate(data.d[i].dateOfBirth) +
                                                        "</td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lbldistrict'>" + data.d[i].District +
                                                        "</td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lblmunicipality'>" + data.d[i].Municipality +
                                                        "</td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lbladdress'>" + data.d[i].Address +
                                                        "</td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lblgender'>" + data.d[i].Gender +
                                                        "</td><td class='col-lg-2 col-md-2 col-sm-2 col-xs-2'><img src='/Content/" + data.d[i].Photo + "' class='img-rounded'/><label style='visibility:hidden;' class='lblphoto'>" + data.d[i].Photo +
                                                        "</td><td class='col-lg-2 col-md-2 col-sm-2 col-xs-2'><a id='delete'>Delete</a><a id='edit'> Edit</a></td></tr>");
                    }
                },
                error: function () {
                    console.log("An error has occurred during processing your request.");
                }

            });
        }


    //Delete data
        $("#studentTable").on('click', "#delete", function () {

            $('#Save').hide();
            $('#Cancel').hide();
            $('#New').show();
            var thistr = $(this).closest("tr");
            $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
            var deleteId = thistr.find('input[type=hidden]').val();

            thistr.remove();


            $.ajax({
                type: "POST",
                url: 'ajaxCrud.aspx/delete',
                data: JSON.stringify({ delId: deleteId }),
                async: true,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    alert(data.d);
                },
                error: function () {
                    console.log("An error has occurred during processing your request.");
                }

            });
        });



        //Edit specific rows
        $("#studentTable").on('click', "#edit", function () {
            
            $('#New').hide();
            $('#Save').hide();
            $('#Cancel').hide();
            var thistr='';
            var orininal='';
            thistr = $(this).closest("tr");  
            original = $(this).closest("tr");
            
            var editId = $(thistr).find('input[type=hidden]').val();
            var studentid = $(thistr).find('.lblstudentid').text();
            var firstname = $(thistr).find('.lblfirstname').text();
            var lastname = $(thistr).find('.lbllastname').text();
            var isactive = $(thistr).find('.lblisactive').text();
            var dateofbirth = $(thistr).find('.lbldateofbirth').text();
            var district = $(thistr).find('.lbldistrict').text();
            var municipality = $(thistr).find('.lblmunicipality').text();
            var address = $(thistr).find('.lbladdress').text();
            var gender = $(thistr).find('.lblgender').text();
            var photo = $(thistr).find('.lblphoto').text();


            $('#studentTable').find('.editroww').remove();
            var new_row = '';
            new_row = "<tr class='editroww'><td style='display:none;'></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><input class='form-control' type='text' id='fNameInputt' value='" + firstname + "' placeholder='FirstName'/></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><input class='form-control' type='text' id='lNameInputt' value='" + lastname + "' placeholder='LastName'/></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><input type='checkbox' class='form-control' id='isActiveInputt' value='true'/></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><input type='text' value='" + dateofbirth + "' class='form-control' id='datepicker'></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><select class='form-control' onchange='ChangeDistrictList()' id='district'><option value=''>-- District --</option><option value='Kathmandu'>Kathmandu</option><option value='Lalitpur'>Lalitpur</option><option value='Bhakapur'>Bhaktapur</option></select></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><select class='form-control' id='municipality'></select></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><input type='text' class='form-control' value='" + address + "' id='Addresss' placeholder='Address'/></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><select class='form-control' id='genderr'><option value='Male'>Male</option><option value='Female'>Female</option></select></td><td class='col-lg-2 col-md-2 col-sm-2 col-xs-2'><input class='form-control' id='filee' type='file'/></td><td class='col-lg-2 col-md-2 col-sm-2 col-xs-2'><a id='Cancell'>Cancel</a><a id='Savee'> Save</a></td></tr>"
            $(thistr).replaceWith(new_row);
           
            $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
           

            $("#studentTable").on('click', "#Cancell", function () {
                alert("cancel pressed");
                $('#studentTable').find('.editroww').replaceWith(original);
                
                $('#New').show();
                
            });


            var filePath = '';
            $('#studentTable').on('change', 'input[type=file]', function (e) {

                filePath = e.target.files[0].name;
            });

           

            $("#studentTable").on('click', "#Savee", function () {

                
                $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
                var firstName = $('#fNameInputt').val();
                var lastName = $('#lNameInputt').val();
                var checkedValue = $('#isActiveInputt:checked').val();
                var addressSelect = $('#Addresss').val();
                var districtSelect = $('#district').val();
                var municipalitySelect = $('#municipality').val();
                var genderSelect = $('#genderr').val();
                var dateepick = $("#datepicker").datepicker("getDate");
                var datepick = convert(dateepick);


                console.log(firstName);
                console.log(lastName);
                console.log(checkedValue);
                console.log(datepick);
                console.log(districtSelect);
                console.log(municipalitySelect);
                console.log(addressSelect);
                console.log(genderSelect);



                $('#New').show();
               

                $.ajax({
                    type: "POST",
                    url: 'ajaxCrud.aspx/Edit',
                    data: JSON.stringify({ Eid: editId, Fname: firstName, Lname: lastName, Active: checkedValue, Date: datepick, District: districtSelect, Municipality: municipalitySelect, Photo: filePath, Address: addressSelect, Gender: genderSelect }),
                    async: true,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        for (var i = 0; i < data.d.length; i++) {
                            var newrow = "<tr><td style='display:none;'><input type='hidden' value=" + data.d[i].studentId + "></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lblfirstname'>"
                                                             + data.d[i].firstName +
                                                             "</label></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lbllastname'>" + data.d[i].lastName +
                                                             "</label></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lblisactive'>" + data.d[i].isActive +
                                                             "</label></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lbldateofbirth'>" + ToJavaScriptDate(data.d[i].dateOfBirth) +
                                                             "</label></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lbldistrict'>" + data.d[i].District +
                                                             "</label></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lblmunicipality'>" + data.d[i].Municipality +
                                                             "</label></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lbladdress'>" + data.d[i].Address +
                                                             "</label></td><td class='col-lg-1 col-md-1 col-sm-1 col-xs-1'><label class='lblgender'>" + data.d[i].Gender +
                                                             "</td><td class='col-lg-2 col-md-2 col-sm-2 col-xs-2'><img src='/Content/" + data.d[i].Photo + "' class='img-rounded'/><label style='visibility:hidden;' class='lblphoto'>" + data.d[i].Photo +
                                                              "</label></td><td class='col-lg-2 col-md-2 col-sm-2 col-xs-2'><a id='delete'>Delete</a><a id='edit'> Edit</a></td></tr>";
                        }
                 
                       $('#studentTable').find('.editroww').replaceWith(newrow)
                      

                    },
                    error: function () {
                        console.log("An error has occurred during processing your request.");
                    }

                });


            });


        });


      
    
</script>

</html>
