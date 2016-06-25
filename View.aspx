<%@ Page Title="" Language="C#" MasterPageFile="~/PrimaryMasterPage.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="stylesSection" Runat="Server">
    <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="well well-sm">
                    <form class="form-horizontal" method="post">
                        <fieldset>
                            <legend style="color:#36A0FF; font-size:27px; padding:10px;">View Stock</legend>
                            <table>
                                <tr>
                                    <th>
                                        <asp:Label ID="Label1" runat="server" Text="Choose date:" style="color:Red" />
                                    </th>
                                    <th>From:</th>
                                    <th>To:</th>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><asp:Calendar ID="Calendar3" runat="server" OnSelectionChanged="Calendar3_SelectionChanged"></asp:Calendar></td>
                                    <td><asp:Calendar ID="Calendar4" runat="server" OnSelectionChanged="Calendar4_SelectionChanged"></asp:Calendar></td>
                                </tr>
                            </table>
                            <br /><br />

                            <div class="form-group">    
                                <table>
                                    <tr>
                                        <td><asp:Button ID="Button1" runat="server" Text="View as per date" CssClass="btn btn-twitter" OnClick="btn_click"/></td>
                                        <td><asp:Button ID="Button2" runat="server" Text="View Total" CssClass="btn btn-twitter" OnClick="full_click" /></td>
                                    </tr>
                                </table>                            
                                                                
                            </div>
                            <div>
                                <asp:Label ID="Label2" runat="server" Text="" Visible="false"></asp:Label><br />
                                <asp:Label ID="Label3" runat="server" Text="" Visible="false"></asp:Label>
                                <asp:Label ID="Label4" runat="server" Text=""></asp:Label><br />
                                <asp:Label ID="Label5" runat="server" Text=""></asp:Label><br /><br />
                            </div>
                            <div class="form-group">
                                <asp:GridView ID="GridView1" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White">
                                </asp:GridView>
                            </div>
                            
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
</asp:Content>

