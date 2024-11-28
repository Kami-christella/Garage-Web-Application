using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Garage_System2
{
    public partial class ApplicantForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=DESKTOP-2042M6B\\SQLEXPRESS;Initial Catalog=Garage_MNGMT_SYSTEM;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            // Define the query with parameter placeholders
            string query = "INSERT INTO Applicant (FullNames, Email, YearsOfExperience, LevelOfEducation, DOB, Degree, Status, Description) VALUES (@FullNames, @Email, @YearsOfExperience, @LevelOfEducation, @DOB, @Degree, 'Pending', @Description)";

            try
            {
                // Create a new SQL connection
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Create a SQL command with the query and connection
                    SqlCommand command = new SqlCommand(query, connection);

                    // Add parameters to the SQL command
                    command.Parameters.AddWithValue("@FullNames", TextBoxFullName.Text);
                    command.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
                    command.Parameters.AddWithValue("@YearsOfExperience", TextBoxYearsOfExperience.Text);
                    command.Parameters.AddWithValue("@LevelOfEducation", DropDownListLevelOfEducation.SelectedValue);
                    command.Parameters.AddWithValue("@DOB", TextBoxDateOfBirth.Text);
                    command.Parameters.AddWithValue("@Degree", TextBoxDegree.Text);
                   command.Parameters.AddWithValue("@Description", DescriptionBox.Text);
                    // Open the SQL connection
                    connection.Open();

                    // Execute the SQL command
                    int rowsAffected = command.ExecuteNonQuery();

                    // Check if the account was created successfully
                    if (rowsAffected > 0)
                    {
                        LabelMessage.Text = "Application submitted successfully!";
                        LabelMessage.CssClass = "text-success";
                    }
                    else
                    {
                        LabelMessage.Text = "Application not submitted.";
                        LabelMessage.CssClass = "text-danger";
                    }

                    // Clear the form data
                    ClearData();
                }
            }
            catch (SqlException ex)
            {
                // Display error message
                LabelMessage.Text = "There's a problem: " + ex.Message;
                LabelMessage.CssClass = "text-danger";
            }
        }

        private void ClearData()
        {
            TextBoxFullName.Text = String.Empty;
            TextBoxEmail.Text = String.Empty;
            TextBoxYearsOfExperience.Text = String.Empty;
            DropDownListLevelOfEducation.ClearSelection();
            TextBoxDateOfBirth.Text = String.Empty;
            TextBoxDegree.Text = String.Empty;
        }
    }
}
