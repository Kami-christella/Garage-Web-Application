using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Garage_System2
{
    public partial class AddClient : System.Web.UI.Page
    {
        private string connectionString = "Data Source=DESKTOP-2042M6B\\SQLEXPRESS;Initial Catalog=Garage_MNGMT_SYSTEM;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO ClientsTable (ClientName, Telephone, Email, Address) VALUES (@ClientName, @Telephone, @Email, @Address)";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ClientName", TextBoxClientName.Text);
                    command.Parameters.AddWithValue("@Telephone", TextBoxTelephone.Text);
                    command.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
                    command.Parameters.AddWithValue("@Address", TextBoxAddress.Text);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                LabelMessage.Text = "Client added successfully!";
                LabelMessage.CssClass = "text-success";
            }
            catch (Exception ex)
            {
                LabelMessage.Text = "Error: " + ex.Message;
                LabelMessage.CssClass = "text-danger";
            }
        }

        protected void ButtonBackToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
