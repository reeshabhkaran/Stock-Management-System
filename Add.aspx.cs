using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

public partial class Add : System.Web.UI.Page
{
    MySqlConnection conn;
    MySqlConnection conn1;
    MySqlCommand cmd;
    MySqlCommand cmd1;
    MySqlDataReader reader;
    MySqlDataReader reader1;
    String query,query1,name,id,query3;
    int quan,uquan;

    protected void Page_Load(object sender, EventArgs e)
    {
        name = (String)(Session["uname"]);
        id = (String)(Session["id"]);
    }

    protected void add_stock(object sender, EventArgs e)
    {
        sqlquery();
    }

    protected void sqlquery()
    {
        try
        {
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["appconnstring"].ToString();
            conn = new MySqlConnection(connString);
            conn.Open();

            query = "";
            query = "select quantity from employer natural join product where e_id='" + id + "' and pid='" + TextBox1.Text + "'";
            query3 = "select remaining from employer natural join product where e_id='" + id + "' and pid='" + TextBox1.Text + "'";
            cmd = new MySqlCommand(query, conn);
            cmd1 = new MySqlCommand(query3, conn);

            reader = cmd.ExecuteReader();


            while (reader.HasRows && reader.Read())
            {
                String qua = reader.GetString(reader.GetOrdinal("quantity"));
                quan = int.Parse(qua);
            }

            reader.Close();
            reader1 = cmd1.ExecuteReader();

            while (reader1.HasRows && reader1.Read())
            {
                String uqua = reader1.GetString(reader1.GetOrdinal("remaining"));
                uquan = int.Parse(uqua);
            }

            conn1 = new MySqlConnection(connString);
            conn1.Open();

            if (reader.HasRows && reader1.HasRows)
            {
                int a = int.Parse(TextBox2.Text);
                int c = quan + a;
                int d = uquan + a;

                
                query1 = "";                    
                query1 = "update product set quantity='" + c + "' where e_id='" + id + "' and pid='" + TextBox1.Text + "'";
                String query4 = "insert into padd (pid, quantity, added_on) values ('"+TextBox1.Text+"', '"+TextBox2.Text+"', curdate())";
                String query2 = "update product set remaining='" + d + "' where e_id='" + id + "' and pid='" + TextBox1.Text + "'";
                cmd = new MySqlCommand(query1, conn1);
                cmd.ExecuteNonQuery();
                cmd = new MySqlCommand(query2, conn1);
                cmd.ExecuteNonQuery();
                cmd = new MySqlCommand(query4, conn1);
                cmd.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, GetType(), "", "myfunc();", true);
            }

            conn1.Close();
            conn.Close();
        }
        catch (Exception e)
        {
            Label3.Text = e.ToString();
        }
    }
}