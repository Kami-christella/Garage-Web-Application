using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Garage_System2
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        private string connectionString = "Data Source=DESKTOP-2042M6B\\SQLEXPRESS;Initial Catalog=Garage_MNGMT_SYSTEM;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClientsData();
                LoadBookingsData();
            }
        }

        private void LoadClientsData()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT ClientsID, ClientName, Telephone, Email, Address FROM ClientsTable";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable clientsTable = new DataTable();
                adapter.Fill(clientsTable);
                ClientsGridView.DataSource = clientsTable;
                ClientsGridView.DataBind();
            }
        }

        private void LoadBookingsData()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT LicensePlate, Name, Telephone, Email, Address, CarMake, CarModel, ModelYear, ServiceType, AdditionalNotes, BookingDate, PaymentMethod, EstimatedCost, Status FROM BookingForm";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable bookingsTable = new DataTable();
                adapter.Fill(bookingsTable);
                BookingsGridView.DataSource = bookingsTable;
                BookingsGridView.DataBind();
            }
        }

        // CRUD operations for Clients
        protected void ClientsGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ClientsGridView.EditIndex = e.NewEditIndex;
            LoadClientsData();
        }

        protected void ClientsGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ClientsGridView.EditIndex = -1;
            LoadClientsData();
        }

        protected void ClientsGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string clientId = ClientsGridView.DataKeys[e.RowIndex].Value.ToString();
            string clientName = ((TextBox)ClientsGridView.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string telephone = ((TextBox)ClientsGridView.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string email = ((TextBox)ClientsGridView.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string address = ((TextBox)ClientsGridView.Rows[e.RowIndex].Cells[4].Controls[0]).Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE ClientsTable SET ClientName = @ClientName, Telephone = @Telephone, Email = @Email, Address = @Address WHERE ClientsID = @ClientsID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ClientsID", clientId);
                command.Parameters.AddWithValue("@ClientName", clientName);
                command.Parameters.AddWithValue("@Telephone", telephone);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Address", address);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }

            ClientsGridView.EditIndex = -1;
            LoadClientsData();
        }

        protected void ClientsGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string clientId = ClientsGridView.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM ClientsTable WHERE ClientsID = @ClientsID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ClientsID", clientId);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }

            LoadClientsData();
        }

        protected void AddClientButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddClient.aspx");
        }

        // CRUD operations for Bookings
        protected void BookingsGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            BookingsGridView.EditIndex = e.NewEditIndex;
            LoadBookingsData();
        }

        protected void BookingsGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            BookingsGridView.EditIndex = -1;
            LoadBookingsData();
        }

        protected void BookingsGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string licensePlate = BookingsGridView.DataKeys[e.RowIndex].Value.ToString();
            string name = ((TextBox)BookingsGridView.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string telephone = ((TextBox)BookingsGridView.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string email = ((TextBox)BookingsGridView.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string address = ((TextBox)BookingsGridView.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string carMake = ((TextBox)BookingsGridView.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
            string carModel = ((TextBox)BookingsGridView.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
            string modelYear = ((TextBox)BookingsGridView.Rows[e.RowIndex].Cells[7].Controls[0]).Text;
            string serviceType = ((TextBox)BookingsGridView.Rows[e.RowIndex].Cells[8].Controls[0]).Text;
            string additionalNotes = ((TextBox)BookingsGridView.Rows[e.RowIndex].Cells[9].Controls[0]).Text;
            string bookingDate = ((TextBox)BookingsGridView.Rows[e.RowIndex].Cells[10].Controls[0]).Text;
            string paymentMethod = ((TextBox)BookingsGridView.Rows[e.RowIndex].Cells[11].Controls[0]).Text;
            string estimatedCost = ((TextBox)BookingsGridView.Rows[e.RowIndex].Cells[12].Controls[0]).Text;
            string status = ((TextBox)BookingsGridView.Rows[e.RowIndex].Cells[13].Controls[0]).Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE BookingForm SET Name = @Name, Telephone = @Telephone, Email = @Email, Address = @Address, CarMake = @CarMake, CarModel = @CarModel, ModelYear = @ModelYear, ServiceType = @ServiceType, AdditionalNotes = @AdditionalNotes, BookingDate = @BookingDate, PaymentMethod = @PaymentMethod, EstimatedCost = @EstimatedCost, Status = @Status WHERE LicensePlate = @LicensePlate";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@LicensePlate", licensePlate);
                command.Parameters.AddWithValue("@Name", name);
                command.Parameters.AddWithValue("@Telephone", telephone);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Address", address);
                command.Parameters.AddWithValue("@CarMake", carMake);
                command.Parameters.AddWithValue("@CarModel", carModel);
                command.Parameters.AddWithValue("@ModelYear", modelYear);
                command.Parameters.AddWithValue("@ServiceType", serviceType);
                command.Parameters.AddWithValue("@AdditionalNotes", additionalNotes);
                command.Parameters.AddWithValue("@BookingDate", bookingDate);
                command.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                command.Parameters.AddWithValue("@EstimatedCost", estimatedCost);
                command.Parameters.AddWithValue("@Status", status);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }

            BookingsGridView.EditIndex = -1;
            LoadBookingsData();
        }

        protected void BookingsGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string licensePlate = BookingsGridView.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM BookingForm WHERE LicensePlate = @LicensePlate";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@LicensePlate", licensePlate);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }

            LoadBookingsData();
        }

        protected void AddBookingButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBooking.aspx");
        }
    }
}
