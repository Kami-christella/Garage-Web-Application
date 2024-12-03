using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Garage_System2
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClientsData(); // Ensure this method is called
            }
        }

        private void LoadClientsData()
        {
            string connectionString = "Data Source=DESKTOP-2042M6B\\SQLEXPRESS;Initial Catalog=Garage_MNGMT_SYSTEM;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT ClientName, Telephone, Email, Address FROM ClientsTable";
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable clientsTable = new DataTable();
                    adapter.Fill(clientsTable);

                    ClientsGridView.DataSource = clientsTable;
                    ClientsGridView.DataBind();
                }
                catch (Exception ex)
                {
                    // Handle the error
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }
    }
}
