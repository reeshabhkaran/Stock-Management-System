<%@ Page Title="" Language="C#" MasterPageFile="~/PrimaryMasterPage.master" AutoEventWireup="false" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ MasterType VirtualPath="~/PrimaryMasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="stylesSection" runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/tooltipster.css" />
    <link rel="stylesheet" type="text/css" href="Styles/Home.css" />
    <link href="Content/styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <asp:UpdateProgress ID="updtProgressPnlMain" AssociatedUpdatePanelID="updtPnlMain"
        runat="server">
        <ProgressTemplate>
            <div class="divWaiting" style="padding-top: 20%;">
                <center>
                    <div>
                        <h3>
                            <asp:Label ID="lblWait" runat="server" Text="Please wait..." CssClass="label text-midnightblue" /></h3>
                       <img src="images/ajax-loader.gif" alt="Loading..." />
                    </div>
                </center>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="updtPnlMain" runat="server">
        <ContentTemplate>
            <div class="container fill" style="width: 100%;">
                <div class="row">
                    <div class="col-md-12 text-amethyst">
                        <h2>
                           </h2>
                    </div>
                </div>
            </div>
        </ContentTemplate>      
    </asp:UpdatePanel>
    
    <div class="container">
        <telerik:RadAjaxPanel runat="server" ID="RadAjaxPanel1">
            <h2 class="Heading" style="color:#36A0FF;">Stock Management System
            </h2>
            <telerik:RadImageGallery RenderMode="Lightweight" runat="server" ID="RadImageGallery1" Height="473px" DisplayAreaMode="Image" >
                <Items>
                    <telerik:ImageGalleryItem Description="This provides ease to access and update stocks in the inventory through this portal doing all digitally and decreasing the need of man power to manage stocks."
                         ImageUrl="~/images/1.jpg" Title="Stock Management System" />                    
                    <telerik:ImageGalleryItem Description="You can update the amount of stock consumed for a particular product and also add stock whenever the need arises."
                        ImageUrl="~/images/3.jpg" Title="Stock Management System" /> 
                    <telerik:ImageGalleryItem Description="Stocks can be viewed and monitored through this portal and emails are sent to the employer whenever stock goes below the threshold and the facility of contacting the admin
                        is also provided for any issues."
                        ImageUrl="~/images/4.jpg" Title="Stock Management System" />                                                        
                </Items>
                <ThumbnailsAreaSettings Mode="ImageSliderPreview" />
                <ToolbarSettings ShowSlideshowButton="true" />
                <ClientSettings>
                    <AnimationSettings SlideshowSlideDuration="3000">
                        <NextImagesAnimation Type="Blocks" Easing="EaseOutSine" Speed="2500" />
                        <PrevImagesAnimation Type="Blocks" Easing="EaseOutSine" Speed="2500" />
                    </AnimationSettings>
                </ClientSettings>
            </telerik:RadImageGallery>
            <%--<div class="Info">
                <h3>Welcome to International University
                </h3>
                <span>The mission of International University is to provide knowledge and educate students in science, technology, and other areas that will best serve the 
                world and society in the 21st century. The Institute is committed to generate, disseminate, and preserve knowledge, and to present this knowledge to the world's 
                great challenges.
                </span>
            </div>--%>
        </telerik:RadAjaxPanel>
    </div>
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptsSection" runat="Server">
    <script type="text/javascript" src="Scripts/jquery.tooltipster.min.js"></script>
    <script type="text/javascript">
        //Flag to set the sidebar menu always closed on page.
        var closeSidebarMenu = 0;

        $(document).ready(function () {
            $('.sidebar-toggle').on('click', function () {
                closeSidebarMenu = 1;
            });

            //Invoke the Auto close Menu code after a predefined interval.
            setTimeout(autoCloseMenu, 1000);

        });

        //This method contains the code to auto close the menu after 3 seconds and show a tool tip to the user.
        function autoCloseMenu() {
            if (closeSidebarMenu == 0) {
                //Click the Button to close the side bar menu for a full view.
                //$('.sidebar-toggle').click();
                closeSidebarMenu = 1;
                //Show the Tooltip after 1 second
                setTimeout(function () {
                    $('.customToolTip').tooltipster();
                    $('.customToolTip').tooltipster('show');
                    //Hide the tool tip after 2 seconds and disable the same.
                    setTimeout(function () {
                        $('.customToolTip').tooltipster('hide');
                        $('.customToolTip').tooltipster('disable');
                    }, 5000);
                }, 1000);
            }
        };
    </script>
</asp:Content>

