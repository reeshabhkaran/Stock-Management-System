<%@ Page Title="" Language="C#" MasterPageFile="~/PrimaryMasterPage.master" AutoEventWireup="true" CodeFile="Consume.aspx.cs" Inherits="Consume" %>

<asp:Content ID="Content1" ContentPlaceHolderID="stylesSection" Runat="Server">
    <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/sweetalert.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <script type="text/javascript">
        function myfunc() {
            swal({ title: "Warning!", text: "Item consumed but kindly check your mail for more details", type: "warning", confirmButtonText: "OK" });
        }
        function myfunc1() {
            swal({ title: "Done!", text: "Item successfully consumed.", type: "success", confirmButtonText: "OK" });
        }
        function myfunc2() {
            swal({ title: "!", text: "Not enough stock to consume.", type: "error", confirmButtonText: "OK" });
        }
    </script>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="well well-sm">
                    <form class="form-horizontal" method="post">
                    
                        <fieldset>
                            <legend style="color:#36A0FF; font-size:27px; padding:10px;">Consume Stock</legend>

                            <table>
                                <tr>
                                    <td><asp:Label ID="Label1" runat="server" Text="Enter Product Id:" style="color:Navy" /></td>
                                    <td><asp:TextBox ID="TextBox1" runat="server" placeholder="Enter" Width="200px" class="form-control"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td><asp:Button ID="Button1" runat="server" Text="Show stock" CssClass="btn btn-twitter" OnClick="view_stock"/></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label2" runat="server" Text="Enter quantity consumed:" style="color:Navy" /></td>
                                    <td><asp:TextBox ID="TextBox2" runat="server" placeholder="Enter" Width="200px" class="form-control"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td><asp:Button ID="Button2" runat="server" Text="Consume" CssClass="btn btn-twitter" OnClick="consume"/></td>
                                </tr>
                            </table>   
                            <br /><br />

                            <div class="form-group">
                                <asp:GridView ID="GridView1" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White">
                                </asp:GridView>
                            </div>
                            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
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

