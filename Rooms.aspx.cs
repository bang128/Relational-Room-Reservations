using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void InsertItem_Click(object sender, EventArgs e)
    {
        try
        {
            Label1.Text = "ErrorMessage";
            SqlDataSource2.InsertParameters["RoomID"].DefaultValue = DetailsView1.SelectedValue.ToString();
            SqlDataSource2.InsertParameters["ItemID"].DefaultValue = ItemID.SelectedValue;
            SqlDataSource2.InsertParameters["Quantity"].DefaultValue = Quantity.Text;
            SqlDataSource2.InsertParameters["Fixed"].DefaultValue = Fixed.Checked.ToString();

            SqlDataSource2.Insert();

            Quantity.Text = "";
        }

        catch (Exception ex)
        {

            Label1.Text = ex.GetBaseException().ToString();

        }
    }

}