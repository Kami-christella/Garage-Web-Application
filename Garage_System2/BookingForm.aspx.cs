using System;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Garage_System2
{
    public partial class BookingForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckBoxListServiceType.SelectedIndexChanged += CheckBoxListServiceType_SelectedIndexChanged;
            }
        }

        protected void CheckBoxListServiceType_SelectedIndexChanged(object sender, EventArgs e)
        {
            int estimatedCost = 0;
            foreach (ListItem item in CheckBoxListServiceType.Items)
            {
                if (item.Selected)
                {
                    estimatedCost += 50000;
                }
            }
            TextBoxEstimatedCost.Text = estimatedCost.ToString();
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = "Data Source=DESKTOP-2042M6B\\SQLEXPRESS;Initial Catalog=Garage_MNGMT_SYSTEM;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Insert booking data into BookingForm table
                    string query1 = "INSERT INTO BookingForm (Name, Telephone, Email, Address, CarMake, CarModel, ModelYear, ServiceType, AdditionalNotes, BookingDate, PaymentMethod, EstimatedCost, Status, LicensePlate) " +
                                   "VALUES (@Name, @Telephone, @Email, @Address, @CarMake, @CarModel, @ModelYear, @ServiceType, @AdditionalNotes, @BookingDate, @PaymentMethod, @EstimatedCost, @Status, @LicensePlate)";

                    SqlCommand command1 = new SqlCommand(query1, connection);
                    command1.Parameters.AddWithValue("@Name", TextBoxName.Text);
                    command1.Parameters.AddWithValue("@Telephone", TextBoxPhone.Text);
                    command1.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
                    command1.Parameters.AddWithValue("@Address", TextBoxAddress.Text);
                    command1.Parameters.AddWithValue("@CarMake", TextBoxCarMake.Text);
                    command1.Parameters.AddWithValue("@CarModel", TextBoxCarModel.Text);
                    command1.Parameters.AddWithValue("@ModelYear", TextBoxModelYear.Text);
                    command1.Parameters.AddWithValue("@ServiceType", string.Join(", ", CheckBoxListServiceType.Items.Cast<ListItem>().Where(item => item.Selected).Select(item => item.Value)));
                    command1.Parameters.AddWithValue("@AdditionalNotes", TextBoxAdditionalNotes.Text);
                    command1.Parameters.AddWithValue("@BookingDate", TextBoxBookingDate.Text);
                    command1.Parameters.AddWithValue("@PaymentMethod", DropDownListPaymentMethod.Text);
                    command1.Parameters.AddWithValue("@EstimatedCost", TextBoxEstimatedCost.Text);
                    command1.Parameters.AddWithValue("@Status", "Pending");
                    command1.Parameters.AddWithValue("@LicensePlate", TextBoxLicensePlate.Text);

                    command1.ExecuteNonQuery();

                    // Insert client data into ClientsTable
                    string query2 = "INSERT INTO ClientsTable (ClientName, Telephone, Email, Address) VALUES (@Name, @Telephone, @Email, @Address)";
                    SqlCommand command2 = new SqlCommand(query2, connection);
                    command2.Parameters.AddWithValue("@Name", TextBoxName.Text);
                    command2.Parameters.AddWithValue("@Telephone", TextBoxPhone.Text);
                    command2.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
                    command2.Parameters.AddWithValue("@Address", TextBoxAddress.Text);
                    command2.ExecuteNonQuery();

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
    }
}
