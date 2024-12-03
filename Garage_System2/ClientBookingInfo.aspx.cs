using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Garage_System2
{
    public partial class ClientBookingInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string email = Request.QueryString["email"];
                if (!string.IsNullOrEmpty(email))
                {
                    LoadBookingInfo(email);
                }
                else
                {
                    messageBox.Text = "No email provided.";
                }
            }
        }

        private void LoadBookingInfo(string email)
        {
            try
            {
                // Define the connection string
                string connectionString = "Data Source=DESKTOP-2042M6B\\SQLEXPRESS;Initial Catalog=Garage_MNGMT_SYSTEM;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

                // Define the query to retrieve booking information
                string query = "SELECT * FROM BookingForm WHERE Email=@Email";

                // Create a new SQL connection
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Create a SQL command with the query and connection
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Email", email);

                    // Open the SQL connection
                    connection.Open();

                    // Execute the SQL command and retrieve the data
                    SqlDataReader reader = command.ExecuteReader();

                    // If the client has a booking, display the information
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            LabelName.Text = reader["Name"].ToString();
                            LabelTelephone.Text = reader["Telephone"].ToString();
                            LabelEmail.Text = reader["Email"].ToString();
                            LabelAddress.Text = reader["Address"].ToString();
                            LabelCarMake.Text = reader["CarMake"].ToString();
                            LabelCarModel.Text = reader["CarModel"].ToString();
                            LabelModelYear.Text = reader["ModelYear"].ToString();
                            LabelServiceType.Text = reader["ServiceType"].ToString();
                            LabelAdditionalNotes.Text = reader["AdditionalNotes"].ToString();
                            LabelBookingDate.Text = reader["BookingDate"].ToString();
                            LabelPaymentMethod.Text = reader["PaymentMethod"].ToString();
                            LabelEstimatedCost.Text = reader["EstimatedCost"].ToString();
                            LabelStatus.Text = reader["Status"].ToString();
                            LabelLicensePlate.Text = reader["LicensePlate"].ToString();
                        }
                    }
                    else
                    {
                        messageBox.Text = "No bookings found for this client.";
                    }
                }
            }
            catch (SqlException ex)
            {
                messageBox.Text = "There's a problem: " + ex.Message;
            }
        }
    }
}
