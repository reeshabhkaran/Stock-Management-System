using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrimaryMasterPage : System.Web.UI.MasterPage
{
    String name;
    String id;

    protected void Page_Load(object sender, EventArgs e)
    {
        name = (String)(Session["uname"]);
        id = (String)(Session["id"]);        

        if (name == null)
        {
            Response.BufferOutput = true;
            Response.Redirect("Login.aspx", false);
        }
        else
            lblWelcomeText.Text = "Welcome" +"  "+ name +" !!!";
    }

    protected void btn_logout(object sender, EventArgs e)
    {
        Session["uname"] = null;
        Session["id"] = null;
        Session.Abandon();
        Response.BufferOutput = false;
        Response.Redirect("Login.aspx", false);
    }
}
