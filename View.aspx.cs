using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

public partial class View : System.Web.UI.Page
{
    MySqlConnection conn;
    MySqlCommand cmd;
    //MySqlDataReader reader;
    String query,name,id;
    //int quan;

    protected void Page_Load(object sender, EventArgs e)
    {
        name = (String)(Session["uname"]);
        id = (String)(Session["id"]);
    }

    protected void Calendar3_SelectionChanged(object sender, EventArgs e)
    {
        Label2.Text = Calendar3.SelectedDate.ToString("yyyy-MM-dd");
        Label4.Text = "From: " + Label2.Text;
        
    }

    protected void Calendar4_SelectionChanged(object sender, EventArgs e)
    {
        Label3.Text = Calendar4.SelectedDate.ToString("yyyy-MM-dd");
        Label5.Text = "To: " + Label3.Text;
    }

    protected void btn_click(object sender, EventArgs e)
    {
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["appconnstring"].ToString();
        conn = new MySqlConnection(connString);
        conn.Open();

        query = "";
        query = "select pid as 'Item Code',pname as 'Item Name',quantity as 'Total quantity',sum(used_quantity) as 'Consumed',remaining as 'Total Remaining',threshold as 'Threshold' from employer natural join product natural join pused where e_id='"+id+"' and used_on between '"+Label2.Text+"'and '"+Label3.Text+"' group by pid";
        cmd = new MySqlCommand(query, conn);
        cmd.ExecuteNonQuery();

        DataTable dt = new DataTable();
        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();

        conn.Close();        
    }

    //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    //{       

    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        try
    //        {
    //            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["appconnstring"].ToString();
    //            conn = new MySqlConnection(connString);
    //            conn.Open();

    //            query = "";
    //            query = "select threshold from employer natural join product where e_id='" + id + "'";
                
    //            cmd = new MySqlCommand(query, conn);
                

    //            reader = cmd.ExecuteReader();


    //            while (reader.HasRows && reader.Read())
    //            {
    //                String qua = reader.GetString(reader.GetOrdinal("threshold"));
    //                quan = int.Parse(qua);
                   
                    
    //                //your data-object that is rendered in this row, if at all required.
    //                //Object obj = e.Row.DataItem;

    //                //find the right color from condition
    //                string color = quan > 11 ? "yellow" : "orange";

    //                //set the backcolor of the cell based on the condition
    //                e.Row.Cells[4].Attributes.Add("Style", "background-color: " + color + ";");
    //            }
    //            reader.Close();

    //            conn.Close();
    //        }
    //        catch(Exception)
    //        {
    //        }
    //    }
    //}

    protected void full_click(object sender, EventArgs e)
    {
        Label4.Text = "";
        Label5.Text = "";

        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["appconnstring"].ToString();
        conn = new MySqlConnection(connString);
        conn.Open();

        query = "";
        query = "select pid as 'Item Code',pname as 'Item Name',quantity as 'Total quantity',sum(used_quantity) as 'Consumed',remaining as 'Total Remaining',threshold as 'Threshold' from employer natural join product natural join pused where e_id='" + id + "' group by pid";
        cmd = new MySqlCommand(query, conn);
        cmd.ExecuteNonQuery();

        DataTable dt = new DataTable();
        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();

        conn.Close();  
    }
}