using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Net.Mail;

public partial class Consume : System.Web.UI.Page
{
    MySqlConnection conn;
    MySqlConnection conn1;
    MySqlCommand cmd;
    MySqlCommand cmd1;
    MySqlCommand cmd2;
    MySqlDataReader reader;
    MySqlDataReader reader1;
    MySqlDataReader reader2;
    String query,name,id,query1,thres,m;
    int quan;

    protected void Page_Load(object sender, EventArgs e)
    {
        name = (String)(Session["uname"]);
        id = (String)(Session["id"]);
    }

    protected void view_stock(object sender, EventArgs e)
    {
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["appconnstring"].ToString();
        conn = new MySqlConnection(connString);
        conn.Open();

        query = "";
        query = "select pid as 'Item Code',pname as 'Item Name',powner as 'Owner',quantity as 'Quantity',remaining as 'Remaining' from employer natural join product where e_id='"+id+"' and pid='"+TextBox1.Text+"'";
        cmd = new MySqlCommand(query, conn);
        cmd.ExecuteNonQuery();

        DataTable dt = new DataTable();
        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();

        conn.Close();  
    }

    protected void consume(object sender, EventArgs e)
    {
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["appconnstring"].ToString();
        conn = new MySqlConnection(connString);
        conn.Open();

        query = "";
        query = "select remaining from employer natural join product where e_id='" + id + "' and pid='" + TextBox1.Text + "'";
        String query5 = "select threshold from employer natural join product where e_id='" + id + "' and pid='" + TextBox1.Text + "'";
        //query3 = "select used_quantity from employer natural join pused where e_id='" + id + "' and pid='" + TextBox1.Text + "'";
        cmd = new MySqlCommand(query, conn);
        cmd1 = new MySqlCommand(query5, conn);

        reader = cmd.ExecuteReader();
        

        while (reader.HasRows && reader.Read())
        {
            String qua = reader.GetString(reader.GetOrdinal("remaining"));            
            quan = int.Parse(qua);
        }

        reader.Close();
        reader1 = cmd1.ExecuteReader();

        while(reader1.HasRows && reader1.Read())
        {
            thres = reader1.GetString(reader1.GetOrdinal("threshold"));
        }
        reader1.Close();

        

        if (reader.HasRows)
        {
            int a = int.Parse(TextBox2.Text);
            //int d = uquan + a;
            int c = quan - a;

            if (c <= 10 && c>=0)
            {
                //Label4.Text = "Remaining stock has gone below threshold, i.e, '"+thres+"'. Kindly add stock.";                

                string q = "select email from employer where e_id='"+id+"' and pid='"+TextBox1.Text+"'";
                cmd2 = new MySqlCommand(q, conn);
                reader2 = cmd2.ExecuteReader();

                while (reader2.HasRows && reader2.Read())
                {
                    m = reader2.GetString(reader2.GetOrdinal("email"));
                }

                try
                {
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                    mail.From = new MailAddress("snti.sms2017@gmail.com"); //provide your gmail address as from address
                    mail.To.Add(m);
                    mail.Subject = "Update stock";
                    mail.Body = "Item (pid='"+TextBox1.Text+"') consumed but remaining stock below threshold (10). Kindly add stock.";

                    SmtpServer.Port = 587;
                    SmtpServer.Credentials = new System.Net.NetworkCredential("snti.sms2017", "snti2017"); //you have to provide you gamil username and password
                    SmtpServer.EnableSsl = true;

                    SmtpServer.Send(mail);

                    ScriptManager.RegisterStartupScript(this, GetType(), "", "myfunc();", true);
                }
                catch (Exception ex)
                {
                    Label3.Text = "Email Failed." + ex.Message;
                }
            }

            conn1 = new MySqlConnection(connString);
            conn1.Open();

            if (c >= 0)
            {
                query1 = "";
                query1 = "update product set remaining='" + c + "' where e_id='" + id + "' and pid='" + TextBox1.Text + "'";
                String query4 = "insert into pused (pid, used_quantity, used_on) values ('" + TextBox1.Text + "', '" + TextBox2.Text + "', curdate())";
                //String query2 = "update pused set used_quantity='"+d+"' where e_id='" + id + "' and pid='" + TextBox1.Text + "'";
                cmd = new MySqlCommand(query1, conn1);
                cmd.ExecuteNonQuery();
                //cmd = new MySqlCommand(query2, conn1);
                //cmd.ExecuteNonQuery();
                cmd = new MySqlCommand(query4, conn1);
                cmd.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, GetType(), "", "myfunc1();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "myfunc2();", true);
            }
        }

        conn1.Close();
        conn.Close();
    }
}