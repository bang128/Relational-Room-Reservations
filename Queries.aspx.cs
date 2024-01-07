using System;
using System.Activities;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button tmp = (Button)sender;

        tmp.Text = "...clicked...";
        DataView dview = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
        try
        {
            for (int i=0; i < dview.Table.Rows.Count; i++)
            {
                if (dview.Table.Rows[i]["DepartmentID"].ToString() == Dept.SelectedValue)
                {
                    DetailsView6.Rows[0].Cells[1].Text = dview.Table.Rows[i]["DepartmentID"].ToString();
                    DetailsView6.Rows[1].Cells[1].Text = dview.Table.Rows[i]["DepartmentName"].ToString();
                    DetailsView6.Rows[3].Cells[1].Text = dview.Table.Rows[i]["Total Room Charges"].ToString();
                    break;
                }
            }

        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }
}