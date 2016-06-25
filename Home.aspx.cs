using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    String name;
    String id;
    protected void Page_Load(object sender, EventArgs e)
    {
        name = (String)(Session["uname"]);
        id = (String)(Session["id"]);
    }
}