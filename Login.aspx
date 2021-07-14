<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<title>Login - EmployeePortal</title>

	<!-- css -->
	<link href="../css/base.css" rel="stylesheet">
	<link href="../css/project.css" rel="stylesheet">

	<!-- favicon -->
	
	
	
<link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
	
	
	
	<!-- ... -->
	 <script type="text/javascript">

        function clickButton(e, buttonid) {
            var evt = e ? e : window.event;
            var bt = document.getElementById(buttonid);
            if (bt) {
                if (evt.keyCode == 13) {
                    bt.click();

                    return false;
                }
            }
        }
 
    </script>
</head>
<body class="page-brand" style="background-image:url('/images/Back4_Plain.jpg'); background-size:cover;">
	<header class="header header-brand-golden ui-header">
		<span class="header-logo"><b>JCT Limited</b></span>
	</header>
	<main class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-lg-push-4 col-sm-6 col-sm-push-3">
					<section class="content-inner" style="width:95%;">
						<div class="card">
							<div class="card-main" style="background-color: #CBCAC7;" >
								<div class="card-header">
									<div class="card-inner">
										<h1 class="card-heading">Log In</h1>
									</div>
								</div>
								<div class="card-inner">
									<p class="text-center">
										<span class="avatar avatar-inline avatar-lg">
											<img alt="Login" src="../images/users/JCTLOgo.png">
										</span>
									</p>
									<form class="form"  runat="server" style="text-align:left;">
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1"  style="text-align:left;">
													<label class="floating-label" for="ui_login_username">UserName</label>
													<asp:TextBox class="form-control" id="ui_login_username" runat="server" AutoCompleteType="Disabled"  AutoComplete="Off"   MaxLength="10"  />
												</div>
											</div>
										</div>
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="ui_login_password">Password</label>
													<asp:TextBox class="form-control" id="ui_login_password"  runat="server" AutoComplete="Off"  AutoCompleteType="Disabled"  MaxLength="15"  TextMode="Password"/>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<asp:LinkButton ID="LinkButton1" class="btn btn-block btn-brand waves-attach waves-light" runat="server">Validate</asp:LinkButton>
                                                    <div id ="myerrormsg" runat="server" style ="font-weight:100; color:red;"></div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<div class="checkbox checkbox-adv">
														<label for="ui_login_remember">
															<%--<input class="access-hide" id="ui_login_remember" name="ui_login_remember" type="checkbox">آنلاین بمان
															<span class="checkbox-circle"></span><span class="checkbox-circle-check"></span><span class="checkbox-circle-icon icon">done</span>--%>
														</label>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="clearfix">
                            <p class="margin-no-top pull-left"><a class="btn btn-flat btn-brand1 waves-attach" href="Help.pdf">May I Help U?</a></p>
													<%--	<p class="margin-no-top pull-right"><a class="btn btn-flat btn-brand waves-attach" href="javascript:void(0)">ایجاد حساب کاربری جدید</a></p>--%>
                                                       <p class="margin-no-top pull-right"><a class="btn btn-flat btn-brand1 waves-attach" href="OtherInfo.Aspx">Worker PF Info</a></p>
                                                       <p class="margin-no-top pull-right"><a class="btn btn-flat btn-brand1 waves-attach" href="working\loginx.Aspx">Pf</a></p>
						</div>


					</section>
				</div>
			</div>
		</div>
	</main>
	<footer class="ui-footer">
		<div class="container">
			<p>JCT Limited - Employee Portal .</p>
		</div>
	</footer>

	<!-- js -->
	<script src="../js/jquery.min.2.2.0.js"></script>
	<script src="../js/base.js"></script>
	<script src="../js/project.js"></script>
</body>
</html>
