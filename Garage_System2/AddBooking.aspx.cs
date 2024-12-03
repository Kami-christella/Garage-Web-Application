using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Garage_System2
{
    public partial class AddBooking : System.Web.UI.Page
    {
        private string connectionString = "Data Source=DESKTOP-2042M6B\\SQLEXPRESS;Initial Catalog=Garage_MNGMT_SYSTEM;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO BookingForm (Name, Telephone, Email, Address, CarMake, CarModel, ModelYear, ServiceType, AdditionalNotes, BookingDate, PaymentMethod, EstimatedCost, Status, LicensePlate) " +
                                   "VALUES (@Name, @Telephone, @Email, @Address, @CarMake, @CarModel, @ModelYear, @ServiceType, @AdditionalNotes, @BookingDate, @PaymentMethod, @EstimatedCost, @Status, @LicensePlate)";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Name", TextBoxName.Text);
                    command.Parameters.AddWithValue("@Telephone", TextBoxTelephone.Text);
                    command.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
                    command.Parameters.AddWithValue("@Address", TextBoxAddress.Text);
                    command.Parameters.AddWithValue("@CarMake", TextBoxCarMake.Text);
                    command.Parameters.AddWithValue("@CarModel", TextBoxCarModel.Text);
                    command.Parameters.AddWithValue("@ModelYear", TextBoxModelYear.Text);
                    command.Parameters.AddWithValue("@ServiceType", TextBoxServiceType.Text);
                    command.Parameters.AddWithValue("@AdditionalNotes", TextBoxAdditionalNotes.Text);
                    command.Parameters.AddWithValue("@BookingDate", TextBoxBookingDate.Text);
                    command.Parameters.AddWithValue("@PaymentMethod", DropDownListPaymentMethod.SelectedValue);
                    command.Parameters.AddWithValue("@EstimatedCost", TextBoxEstimatedCost.Text);
                    command.Parameters.AddWithValue("@Status", TextBoxStatus.Text);
                    command.Parameters.AddWithValue("@LicensePlate", TextBoxLicensePlate.Text);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                LabelMessage.Text = "Booking added successfully!";
                LabelMessage.CssClass = "text-success";
            }
            catch (Exception ex)
            {
                LabelMessage.Text = "Error: " + ex.Message;
                LabelMessage.CssClass = "text-danger";
            }
        }

        protected void ButtonBackToDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }
    }
}
