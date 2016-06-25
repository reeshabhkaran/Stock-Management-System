using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class Login : System.Web.UI.Page
{
    MySqlConnection conn;
    MySqlCommand cmd;
    MySqlDataReader reader;
    String query;
    String name;
    String id;
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sende, EventArgs e)
    {
        if (check(txtBxUsername.Text) == true && check(txtBxPassword.Text) == true)
        {
            sqlquery();
        }
        else
        {
            spanInvalidCredentialsMessage.Visible = true;
            txtBxUsername.Text = "";
            txtBxPassword.Text = "";
        }
    }

    private bool check(String input)
    {
        var regex = new System.Text.RegularExpressions.Regex(@"[a-zA-Z0-9]*$");
        if (regex.IsMatch(input))
            return true;
        else
            return false;
    }

    protected void sqlquery()
    {
        try
        {
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["appconnstring"].ToString();
            conn = new MySqlConnection(connString);
            conn.Open();

            query = "";
            query = "select * from employer where username=?use and password=?pass";
            cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("?use",txtBxUsername.Text);
            cmd.Parameters.AddWithValue("?pass", txtBxPassword.Text);

            reader = cmd.ExecuteReader();

            while (reader.HasRows && reader.Read())
            {
                name = reader.GetString(reader.GetOrdinal("username"));
                id = reader.GetString(reader.GetOrdinal("e_id"));
            }

            if (reader.HasRows)
            {                
                Session["uname"] = name;
                Session["id"] = id;
                Response.BufferOutput = true;
                Response.Redirect("Home.aspx", false);
            }
            else
            {
                spanInvalidCredentialsMessage.Visible = true;
                txtBxUsername.Text = "";
                txtBxPassword.Text = "";
            }

            reader.Close();
            conn.Close();
        }
        catch (Exception e)
        {
            txtBxPassword.Text = e.ToString();
        }
    }
}