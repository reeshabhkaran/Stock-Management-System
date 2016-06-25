using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Net.Mail;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void sub_btn(object sender, EventArgs e)
    {
        try
        {
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress(email.Text); //provide your gmail address as from address
            mail.To.Add("snti.sms2017@gmail.com");
            mail.Subject = name.Text+"("+email.Text+"): "+subject.Text;
            mail.Body = message.Text;

            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("snti.sms2017", "snti2017"); //you have to provide you gamil username and password
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);

            ScriptManager.RegisterStartupScript(this, GetType(), "", "myfunc();", true);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "myfunc1('"+ex.Message+"');", true);
        }
    }
    
}