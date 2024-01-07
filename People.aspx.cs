using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button tmp = (Button)sender;

        tmp.Text = "...clicked...";

        try
        {
            Label2.Text = "ErrorMessage";
            SqlDataSource3.InsertParameters["ManagerID"].DefaultValue = DetailsView1.SelectedValue.ToString();
            SqlDataSource3.InsertParameters["ProxyID"].DefaultValue = ProxyID.Text;
            SqlDataSource3.InsertParameters["EID"].DefaultValue = ProxyPerson.SelectedValue;
            SqlDataSource3.InsertParameters["Password"].DefaultValue = Password.Text;
            SqlDataSource3.InsertParameters["ProxyLevel"].DefaultValue = ProxyLevel.Text;

            SqlDataSource3.Insert();

            ProxyID.Text = "";
            Password.Text = "";
            ProxyLevel.Text = "";

        }

        catch (Exception ex)
        {

            Label2.Text = ex.Message;

        }
    }
}