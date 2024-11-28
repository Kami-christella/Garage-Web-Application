using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Garage_System2
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any initialization logic can go here
            }
        }

        public void clearData()
        {
            usernameBox.Text = String.Empty;
            emailBox.Text = String.Empty;
            passwordBox.Text = String.Empty;
            confirmPasswordBox.Text = String.Empty;
            roleBox.ClearSelection();
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            // Check if the passwords match
            if (passwordBox.Text.Equals(confirmPasswordBox.Text))
            {
                try
                {
                    // Define the connection string
                    string connectionString = "Data Source=DESKTOP-2042M6B\\SQLEXPRESS;Initial Catalog=Garage_MNGMT_SYSTEM;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

                    // Define the query with parameter placeholders
                    string query = "INSERT INTO Users (Username, Email, Password, Role) VALUES (@Username, @Email, @Password, @Role)";

                    // Create a new SQL connection
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        // Create a SQL command with the query and connection
                        SqlCommand command = new SqlCommand(query, connection);

                        // Add parameters to the SQL command
                        command.Parameters.AddWithValue("@Username", usernameBox.Text);
                        command.Parameters.AddWithValue("@Email", emailBox.Text);
                        command.Parameters.AddWithValue("@Password", passwordBox.Text);
                        command.Parameters.AddWithValue("@Role", roleBox.SelectedValue.ToString());

                        // Open the SQL connection
                        connection.Open();

                        // Execute the SQL command
                        int rowsAffected = command.ExecuteNonQuery();

                        // Check if the account was created successfully
                        if (rowsAffected > 0)
                        {
                            messageBox.Text = "Account Created!";
                        }
                        else
                        {
                            messageBox.Text = "Account not Created!";
                        }

                        // Clear the form data
                        clearData();
                    }
                }
                catch (SqlException ex)
                {
                    // Display error message
                    messageBox.Text = "There's a problem: " + ex.Message;
                }
            }
            else
            {
                // Display password mismatch message
                messageBox.Text = "Passwords don't match";
            }
        }
    }
}
