using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Garage_System2
{
    public partial class BookingForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = "Data Source=DESKTOP-2042M6B\\SQLEXPRESS;Initial Catalog=Garage_MNGMT_SYSTEM;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    int clientId = GetClientId(connection);

                    if (clientId == -1)
                    {
                        clientId = InsertClient(connection);
                    }

                    int vehicleId = GetVehicleId(connection, clientId);

                    if (vehicleId == -1)
                    {
                        vehicleId = InsertVehicle(connection, clientId);
                    }

                    int bookingId = InsertBooking(connection, clientId, vehicleId);

                    LinkServicesToBooking(connection, bookingId);

                    LabelMessage.Text = "Booking created successfully!";
                    LabelMessage.CssClass = "text-success";
                }
            }
            catch (Exception ex)
            {
                LabelMessage.Text = "Error: " + ex.Message;
                LabelMessage.CssClass = "text-danger";
            }
        }

        private int GetClientId(SqlConnection connection)
        {
            string query = "SELECT ClientId FROM Clients WHERE Email = @Email";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Email", TextBoxEmail.Text);

            object result = command.ExecuteScalar();
            return result != null ? Convert.ToInt32(result) : -1;
        }

        private int InsertClient(SqlConnection connection)
        {
            string query = "INSERT INTO Clients (ClientName, Telephone, Email, Address) OUTPUT INSERTED.ClientId VALUES (@ClientName, @Telephone, @Email, @Address)";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@ClientName", TextBoxName.Text);
            command.Parameters.AddWithValue("@Telephone", TextBoxPhone.Text);
            command.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
            command.Parameters.AddWithValue("@Address", ""); // Assuming Address is optional and can be left blank

            return (int)command.ExecuteScalar();
        }

        private int GetVehicleId(SqlConnection connection, int clientId)
        {
            string query = "SELECT VehicleId FROM Vehicles WHERE LicensePlate = @LicensePlate AND ClientId = @ClientId";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@LicensePlate", TextBoxLicensePlate.Text);
            command.Parameters.AddWithValue("@ClientId", clientId);

            object result = command.ExecuteScalar();
            return result != null ? Convert.ToInt32(result) : -1;
        }

        private int InsertVehicle(SqlConnection connection, int clientId)
        {
            string query = "INSERT INTO Vehicles (ClientId, Make, Model, Year, LicensePlate) OUTPUT INSERTED.VehicleId VALUES (@ClientId, @Make, @Model, @Year, @LicensePlate)";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@ClientId", clientId);
            command.Parameters.AddWithValue("@Make", TextBoxMake.Text);
            command.Parameters.AddWithValue("@Model", TextBoxModel.Text);
            command.Parameters.AddWithValue("@Year", TextBoxYear.Text);
            command.Parameters.AddWithValue("@LicensePlate", TextBoxLicensePlate.Text);

            return (int)command.ExecuteScalar();
        }

        private int InsertBooking(SqlConnection connection, int clientId, int vehicleId)
        {
            string query = "INSERT INTO Bookings (ClientID, VehicleId, BookingDate, ServiceDate, Status) OUTPUT INSERTED.BookingId VALUES (@ClientID, @VehicleId, @BookingDate, @ServiceDate, @Status)";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@ClientID", clientId);
            command.Parameters.AddWithValue("@VehicleId", vehicleId);
            command.Parameters.AddWithValue("@BookingDate", TextBoxBookingDateTime.Text);
            command.Parameters.AddWithValue("@ServiceDate", TextBoxPreferredServiceDateTime.Text);
            command.Parameters.AddWithValue("@Status", "Pending");

            return (int)command.ExecuteScalar();
        }

        private void LinkServicesToBooking(SqlConnection connection, int bookingId)
        {
            string query = "INSERT INTO BookingServices (BID, SID) VALUES (@BID, @SID)";
            SqlCommand command = new SqlCommand(query, connection);

            foreach (ListItem item in CheckBoxListServiceType.Items)
            {
                if (item.Selected)
                {
                    command.Parameters.Clear();
                    command.Parameters.AddWithValue("@BID", bookingId);
                    command.Parameters.AddWithValue("@SID", GetServiceId(connection, item.Value));
                    command.ExecuteNonQuery();
                }
            }
        }

        private int GetServiceId(SqlConnection connection, string serviceName)
        {
            string query = "SELECT SID FROM Services WHERE Description = @Description";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Description", serviceName);

            object result = command.ExecuteScalar();
            return result != null ? Convert.ToInt32(result) : -1;
        }
    }
}
