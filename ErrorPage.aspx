<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMinusAnyData.master" AutoEventWireup="false" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="stylesSection" runat="Server">
    <style type="text/css">
        body
        {
            background-color: White !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="container fill text-center" style="width: 100%;">
        <h1 class="text-danger">
            <strong>OOPS... WE HAVE GOT A PROBLEM !!!</strong></h1>
        <br />
        <div class="row">
            <div class="col-md-3 col-md-offset-2">
                <img src="images/error_img.png" alt="Error Image" />
            </div>
            <div class="col-md-5 text-left text-danger">
                <h3>
                    This wasn't suppose to happen but it seems we have encountered an error. Now, that's
                    what we call a dead end!!
                </h3>
                <br />
                <table id="tblErrorDetails"  class="table table-bordered">
                    <thead>
                        <tr class="danger">
                            <td>
                                Error Code
                            </td>
                            <td>
                                Error Description
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <asp:Label ID="lblErrorCode" runat="server" Text=""></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblErrorDesc" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                </table>
                We have a couple of options for you:
                <ul>
                    <li>
                        <h4>
                            <a href="Home.aspx" class="text-danger"><u>Take me to the Home Page</u></a>
                        </h4>
                    </li>
                    <li>
                        <h4>
                            <a href="Login.aspx" class="text-danger"><u>Redirect me the Login Screen</u></a>
                        </h4>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptsSection" runat="Server">
</asp:Content>

