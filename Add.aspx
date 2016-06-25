<%@ Page Title="" Language="C#" MasterPageFile="~/PrimaryMasterPage.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="stylesSection" Runat="Server">
    <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/sweetalert.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <script type="text/javascript">
        function myfunc() {
            swal({ title: "Done!", text: "Item successfully added.", type: "success", confirmButtonText: "OK" });
        }
    </script>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="well well-sm">
                    <form class="form-horizontal" method="post">

                        <fieldset>
                            <legend style="color:#36A0FF; font-size:27px; padding:10px;">Add Stock</legend>                   
                        </fieldset>

                        <table>
                            <tr>
                                <td><asp:Label ID="Label1" runat="server" Text="Enter Product Id:" style="color:Navy" /></td>
                                <td><asp:TextBox ID="TextBox1" runat="server" placeholder="Enter id" Width="200px" class="form-control"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="Label2" runat="server" Text="Enter quantity to add:" style="color:Navy" /></td>
                                <td><asp:TextBox ID="TextBox2" runat="server" placeholder="Enter quantity" Width="200px" class="form-control"></asp:TextBox></td>
                            </tr>
                        </table>

                        <div class="form-group">                                
                                <asp:Button ID="Button1" runat="server" Text="Add Stock" CssClass="btn btn-twitter" OnClick="add_stock"/>                                
                        </div>

                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                        
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

