<%@ Page Title="" Language="C#" MasterPageFile="~/PrimaryMasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="stylesSection" Runat="Server">
    <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .header {
            color: #36A0FF;
            font-size: 27px;
            padding: 10px;
        }

        .bigicon {
            font-size: 20px;
            color: #36A0FF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">

    <script type="text/javascript">
    function myfunc() {
        swal({ title: "Done!", text: "Mail successfully sent.", type: "success", confirmButtonText: "OK" });
    }
    function myfunc1(er) {
        swal({ title: "Error!", text: er, type: "error", confirmButtonText: "OK" });
    }
    </script>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="well well-sm">
                    <form class="form-horizontal" method="post">
                        <fieldset>
                            <legend style="color:#36A0FF; font-size:27px; padding:10px;">Contact Us</legend>           
                                            
                                <table>
                                    <tr>
                                        <td><i class="fa fa-user bigicon"></i></td>
                                        <td><asp:TextBox ID="name" runat="server" placeholder="Name" class="form-control"/></td>
                                    </tr>
                                    <tr>
                                        <td><i class="fa fa-envelope-o bigicon"></i></td>
                                        <td><asp:TextBox ID="email" runat="server" placeholder="Email Address" class="form-control"/></td>
                                    </tr>
                                    <tr>
                                        <td><i class="fa fa-pencil-square-o bigicon"></i></td>
                                        <td><asp:TextBox ID="subject" runat="server" placeholder="Subject" class="form-control"/></td>
                                    </tr>
                                    <tr>
                                        <td><i class="fa fa-pencil-square-o bigicon"></i></td>
                                        <td><asp:TextBox ID="message" TextMode="multiline" runat="server" Columns="40" Rows="7" placeholder="Enter your message...." class="form-control"/></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="Label2" runat="server" Text="......."></asp:Label></td>
                                    </tr>
                                </table>    
                                <br />

                                <div class="form-group">
                                    <asp:Button ID="submit" runat="server" Text="Submit" CssClass="btn btn-twitter" OnClick="sub_btn" />
                                </div>
                       

                            <asp:Label ID="Label1" runat="server" Text="" style="color:Red;"></asp:Label>
                        
                        </fieldset> 
                    </form>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptsSection" Runat="Server">
    <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="Scripts/sweetalert.min.js" type="text/javascript"></script>
</asp:Content>

