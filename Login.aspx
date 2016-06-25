<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMinusAnyData.master" AutoEventWireup="false" CodeFile="Login.aspx.cs" Inherits="Login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="stylesSection" runat="Server">
    <link rel="stylesheet" type="text/css" href="Styles/Login.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <asp:UpdateProgress ID="updtProgressPnlMain" AssociatedUpdatePanelID="updtPnlMain"
        runat="server">
        <ProgressTemplate>
            <div class="divWaiting" style="padding-top: 20%;">
                <center>
                    <div>
                        <h3>
                            <asp:Label ID="lblWait" runat="server" Text="Please wait..." CssClass="label text-midnight-blue" /></h3>
                       <img src="images/ajax-loader.gif" alt="Loading..." />
                    </div>
                </center>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="updtPnlMain" runat="server">
        <ContentTemplate>
            <div class="container fill" style="width: 100%;">
                <br />
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Panel ID="pnlLogin" DefaultButton="btnLogin" CssClass="panel panel-success panel-belizehole-border"
                                    runat="server">
                                    <div class="panel-heading panel-belizehole-header">
                                        <h3 class="panel-title">
                                            Login &nbsp;&nbsp;<span class="glyphicon glyphicon-log-in" title="Login"></span>
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        <span id="spanLoggedOutMessage" runat="server" visible="false">
                                            <div class="row form-group">
                                                <div class="col-md-8 col-md-offset-2 text-success">
                                                    You have been successfully logged out.
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-md-8 col-md-offset-2">
                                                    <hr class="alert-success" />
                                                </div>
                                            </div>
                                        </span><span id="spanInvalidCredentialsMessage" runat="server" visible="false">
                                            <div class="row form-group">
                                                <div class="col-md-8 col-md-offset-2 text-danger">
                                                    Your credentials could not be authenticated. Please try again.
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-md-8 col-md-offset-2">
                                                    <hr class="alert-danger" />
                                                </div>
                                            </div>
                                        </span>
                                        <div class="row form-group">
                                            <div class="col-md-8 col-md-offset-2">
                                                <span class="glyphicon glyphicon-th-list text-primary"></span>Plant
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-md-8 col-md-offset-2">
                                                <asp:DropDownList ID="ddlistPlantName" CssClass="form-control selectpicker show-tick"
                                                    data-live-search="false" data-header="Please Select" runat="server">
                                                    <asp:ListItem Text=""/>
                                                    <asp:ListItem Text="Manufacturing"/>
                                                    <asp:ListItem Text="Operations"/>
                                                    <asp:ListItem Text="Sales"/>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-md-8 col-md-offset-2">
                                                <span class="glyphicon glyphicon-user text-primary"></span>Username
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-8 col-md-offset-2">
                                                <asp:RequiredFieldValidator ID="valReqUserName" runat="server" ControlToValidate="txtBxUsername"
                                                    ErrorMessage="Username Required" ValidationGroup="groupLogin" Display="Dynamic"
                                                    CssClass="label label-danger" ForeColor="White"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-md-8 col-md-offset-2">
                                                <asp:TextBox ID="txtBxUsername" placeholder="Username" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-md-8 col-md-offset-2">
                                                <span class="glyphicon glyphicon-lock text-primary"></span>Password
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-8 col-md-offset-2">
                                                <asp:RequiredFieldValidator ID="valReqPassword" runat="server" ControlToValidate="txtBxPassword"
                                                    ErrorMessage="Password Required" ValidationGroup="groupLogin" Display="Dynamic"
                                                    CssClass="label label-danger" ForeColor="White"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-md-8 col-md-offset-2">
                                                <asp:TextBox ID="txtBxPassword" TextMode="Password" placeholder="Password" CssClass="form-control"
                                                    runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-md-8 col-md-offset-2">
                                                <asp:Button ID="btnLogin" CssClass="btn btn-primary btn-block" ValidationGroup="groupLogin"
                                                    runat="server" Text="Login" OnClick="btnLogin_Click"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
                <!--MODAL POP FOR SHOWING ERROR OR WARNING MESSAGES [START]-->
                <input type="button" id="lnkBtnValErrors" class="btn btn-large btn-primary" style="display: none;"
                    data-toggle="modal" data-target="#modalValidationErrors" />
                <div class="modal fade" id="modalValidationErrors">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header alert-danger">
                                <div class="bootstrap-dialog-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true" style="color: White;">&times;</span></button>
                                    <div class="bootstrap-dialog-title text-danger">
                                        <label>
                                            Warning!</label></div>
                                </div>
                            </div>
                            <div class="modal-body">
                                <div class="bootstrap-dialog-body">
                                    <div class="bootstrap-dialog-message" id="valMessage">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="bootstrap-dialog-footer">
                                    <div class="bootstrap-dialog-footer-buttons">
                                        <a onclick="closeModal();" class="btn btn-primary">Close</a></div>
                                </div>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
                <!--MODAL POP FOR SHOWING ERROR OR WARNING MESSAGES [END]-->
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptsSection" runat="Server">
    <script type="text/javascript">

        //Page Load event for javascript.
        function pageLoad(sender, args) {
            initializeFormControls();
        };

        $(document).ready(function () {
            initializeFormControls();
        });

        //This function contains the logic to initialize the form control elements with necessary plugins of bootstrap.
        function initializeFormControls() {
            $('.selectpicker').selectpicker();
        };

        //This function contains the code to show the warning message in a modal pop up.
        function showWarningMessageBox(errorMessage) {
            $('#valMessage').html(errorMessage);
            $('#lnkBtnValErrors').click();
        };

        //This function contains the logic to close the modal pop.
        function closeModal() {
            $(".modal").modal("hide");
        };  
    </script>
</asp:Content>

