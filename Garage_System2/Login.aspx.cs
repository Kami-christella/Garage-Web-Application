using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Garage_System2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any initialization logic can go here
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            try
            {
                // Define the connection string
                string connectionString = "Data Source=DESKTOP-2042M6B\\SQLEXPRESS;Initial Catalog=Garage_MNGMT_SYSTEM;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

                // Define the query to check user credentials
                string query = "SELECT COUNT(1) FROM Users WHERE Email=@Email AND Password=@Password AND Role=@Role";

                // Create a new SQL connection
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Create a SQL command with the query and connection
                    SqlCommand command = new SqlCommand(query, connection);

                    // Add parameters to the SQL command
                    command.Parameters.AddWithValue("@Email", emailBox.Text);
                    command.Parameters.AddWithValue("@Password", passwordBox.Text);
                    command.Parameters.AddWithValue("@Role", roleBox.SelectedValue.ToString());

                    // Open the SQL connection
                    connection.Open();

                    // Execute the SQL command and check the result
                    int count = Convert.ToInt32(command.ExecuteScalar());

                    // If the user exists, login is successful
                    if (count == 1)
                    {
                        messageBox.Text = "Login successful!";
                        if (roleBox.SelectedValue.ToString() == "Client")
                        {
                            // Redirect to ClientBookingInfo.aspx with email as query parameter
                            Response.Redirect("ClientBookingInfo.aspx?email=" + emailBox.Text);
                        }
                        else if (roleBox.SelectedValue.ToString() == "Applicant")
                        {
                            Response.Redirect("ApplicantForm.aspx");
                        }
                        else if (roleBox.SelectedValue.ToString() == "Employee")
                        {
                            Response.Redirect("EmployeeDashboard.aspx");
                        }
                        else if (roleBox.SelectedValue.ToString() == "Admin")
                        {
                            Response.Redirect("AdminDashboard.aspx");
                        }
                    }
                    else
                    {
                        messageBox.Text = "Invalid Credentials.";
                    }
                }
            }
            catch (SqlException ex)
            {
                // Display error message
                messageBox.Text = "There's a problem: " + ex.Message;
            }
        }
    }
}
