using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reservation2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }

    protected void InsertItem_Click(object sender, EventArgs e)
    {
        try
        {
            Label4.Text = "ErrorMessage";
            SqlDataSource3.InsertParameters["ReservationID"].DefaultValue = DetailsView1.SelectedValue.ToString();
            SqlDataSource3.InsertParameters["ItemID"].DefaultValue = ItemID.SelectedValue;
            SqlDataSource3.InsertParameters["Quantity"].DefaultValue = Quantity.Text;

            SqlDataSource3.Insert();

            Quantity.Text = "";
        }

        catch (Exception ex)
        {

            Label4.Text = ex.Message;

        }
    }
}
