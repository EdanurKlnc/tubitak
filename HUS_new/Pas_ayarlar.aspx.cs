using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Transactions;
//using System.Data.SqlClient;
using System.Web.Configuration;
using Microsoft.Reporting.WebForms;
using System.Data;
//using System.Web.UI.HtmlControl;

namespace HUS_new.Account
{
    public partial class Pas_ayarlar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            //TextBox1.Text = DateTime.Now.ToString("yyyy-MM-dd");
            //TextBox2.Text = DateTime.Now.ToString("yyyy-MM-dd");

        }


        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
            //Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            GridView1.DataBind();
            //Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            GridView1.DataBind();
            //Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void FormView2_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            GridView2.DataBind();
            //Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void FormView2_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            GridView2.DataBind();
            //Response.Redirect(Request.Url.AbsoluteUri);

        }

        protected void FormView2_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            GridView2.DataBind();
            //Response.Redirect(Request.Url.AbsoluteUri);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView3.DataBind();
            //Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void FormView3_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            GridView3.DataBind();
            //Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void FormView3_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            GridView3.DataBind();
            //Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void FormView3_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            GridView3.DataBind();
            //Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            TextBox first_date_textbox = (TextBox)FormView2.FindControl("first_dateTextBox");
            TextBox last_date_textbox = (TextBox)FormView2.FindControl("last_dateTextBox");

            TextBox alert_timeTextBox = (TextBox)FormView2.FindControl("alert_timeTextBox");

            DateTime first_date = DateTime.Parse(first_date_textbox.Text);
            DateTime last_date = DateTime.Parse(last_date_textbox.Text);

            //DropDownList patient_sno_combo = (DropDownList)FormView2.FindControl("DropDownList1");
            TextBox alert_textTextBox = (TextBox)FormView2.FindControl("alert_textTextBox");

            //alert_textTextBox0
            TextBox every_x_days = (TextBox)FormView2.FindControl("alert_textTextBox0");
            int kac_gunde_bir = Convert.ToInt32(every_x_days.Text);

            int new_schedule_sno = get_max_schedule_sno();

            try
            {
                // Create the TransactionScope to execute the commands, guaranteeing
                // that both commands can commit or roll back as a single unit of work.
                using (TransactionScope scope = new TransactionScope())
                {

                    //alert kayıtları oluşturuluyor
                    for (var day = first_date.Date; day.Date <= last_date.Date; day = day.AddDays(kac_gunde_bir))
                    {

                        add_schedule_alert(new_schedule_sno, day, alert_timeTextBox.Text);
                    }

                    //schedule kaydı oluşturuluyor
                    add_schedule(new_schedule_sno, Convert.ToInt32(GridView1.SelectedValue), first_date, last_date, alert_timeTextBox.Text, alert_textTextBox.Text, Convert.ToInt32(every_x_days.Text));

                    //scope tamamlanıyor
                    scope.Complete();

                }
            }
            catch (TransactionAbortedException ex)
            {
                //writer.WriteLine("TransactionAbortedException Message: {0}", ex.Message);
                hata_label.Text = ex.ToString();
            }

            FormView2.ChangeMode(FormViewMode.ReadOnly);

            FormView2.DataBind();
            GridView2.DataBind();

            //Response.Redirect(Request.Url.AbsoluteUri);



        }

        public void add_schedule_alert(int schedule_sno, DateTime mobile_alert_date, String mobile_alert_time)
        {
            //Patient patient = new Patient();
            string cs = ConfigurationManager.ConnectionStrings["my_ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Schedule_Alerts (schedule_sno,mobile_alert_date,mobile_alert_time,approval_type) VALUES (@schedule_sno,@mobile_alert_date,@mobile_alert_time,0)"))
                {
                    cmd.Parameters.AddWithValue("@schedule_sno", schedule_sno);
                    cmd.Parameters.AddWithValue("@mobile_alert_date", mobile_alert_date);
                    cmd.Parameters.AddWithValue("@mobile_alert_time", mobile_alert_time);

                    cmd.Connection = conn;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

            }

            //return patient;
        }

        public void add_schedule(int new_schedule_sno, int patient_sno, DateTime first_date, DateTime last_date, String alert_time, String alert_text, int every_x_days)
        {
            //Patient patient = new Patient();
            string cs = ConfigurationManager.ConnectionStrings["my_ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Schedule (sno,patient_sno,first_date,last_date,alert_time,alert_text,every_x_days) VALUES (@schedule_sno,@patient_sno,@first_date,@last_date,@alert_time,@alert_text,@every_x_days)"))
                {
                    cmd.Parameters.AddWithValue("@schedule_sno", new_schedule_sno);
                    cmd.Parameters.AddWithValue("@patient_sno", patient_sno);
                    cmd.Parameters.AddWithValue("@first_date", first_date);
                    cmd.Parameters.AddWithValue("@last_date", last_date);
                    cmd.Parameters.AddWithValue("@alert_time", alert_time);
                    cmd.Parameters.AddWithValue("@alert_text", alert_text);
                    cmd.Parameters.AddWithValue("@every_x_days", every_x_days);

                    cmd.Connection = conn;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

            }

            //return patient;
        }

        public int get_max_schedule_sno()
        {
            int my_max_duyuru_id = 0;

            string cs = ConfigurationManager.ConnectionStrings["my_ConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(cs);
            SqlCommand sqlCommand = new SqlCommand("SELECT max(sno) as max_sno FROM Schedule", sqlConnection);

            sqlConnection.Open();

            SqlDataReader reader = sqlCommand.ExecuteReader();

            //int i = 0;
            if (reader.HasRows)
            {
                reader.Read();
                my_max_duyuru_id = Convert.ToInt32(reader["max_sno"]);

            }

            reader.Close();
            sqlConnection.Close();

            my_max_duyuru_id++;

            return my_max_duyuru_id;

        }

        public void delete_schedule(int schedule_sno)
        {
            string cs = ConfigurationManager.ConnectionStrings["my_ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Schedule WHERE sno=@schedule_sno"))
                {
                    cmd.Parameters.AddWithValue("@schedule_sno", schedule_sno);

                    cmd.Connection = conn;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

            }
        }

        public void delete_schedule_alert_related_by_the_schedule_sno(int schedule_sno)
        {
            string cs = ConfigurationManager.ConnectionStrings["my_ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Schedule_Alerts WHERE schedule_sno=@schedule_sno"))
                {
                    cmd.Parameters.AddWithValue("@schedule_sno", schedule_sno);

                    cmd.Connection = conn;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            //snoLabel
            Label snoLabel = (Label)FormView2.FindControl("snoLabel");
            int schedule_sno = Convert.ToInt32(snoLabel.Text);

            try
            {
                // Create the TransactionScope to execute the commands, guaranteeing
                // that both commands can commit or roll back as a single unit of work.
                using (TransactionScope scope = new TransactionScope())
                {

                    //ilişkili alert kayıtları siliniyor
                    delete_schedule_alert_related_by_the_schedule_sno(schedule_sno);

                    //schedule kaydı siliniyor
                    delete_schedule(schedule_sno);

                    //scope tamamlanıyor
                    scope.Complete();

                }
            }
            catch (TransactionAbortedException ex)
            {
                //writer.WriteLine("TransactionAbortedException Message: {0}", ex.Message);
                hata_label.Text = ex.ToString();
            }

            FormView2.ChangeMode(FormViewMode.ReadOnly);

            FormView2.DataBind();
            GridView2.DataBind();

            //Response.Redirect(Request.Url.AbsoluteUri);

        }

        public void update_schedule(int schedule_sno, DateTime first_date, DateTime last_date, String alert_time, String alert_text, int every_x_days)
        {
            string cs = ConfigurationManager.ConnectionStrings["my_ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Schedule SET first_date=@first_date, last_date=@last_date, alert_time=@alert_time,alert_text=@alert_text,every_x_days=@every_x_days WHERE sno=@schedule_sno"))
                {
                    cmd.Parameters.AddWithValue("@schedule_sno", schedule_sno);
                    cmd.Parameters.AddWithValue("@first_date", first_date);
                    cmd.Parameters.AddWithValue("@last_date", last_date);
                    cmd.Parameters.AddWithValue("@alert_time", alert_time);
                    cmd.Parameters.AddWithValue("@alert_text", alert_text);
                    cmd.Parameters.AddWithValue("@every_x_days", every_x_days);

                    cmd.Connection = conn;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {


            // event occures  
            //e.Cancel = true;
            //snoLabel1
            Label snoLabel = (Label)FormView2.FindControl("snoLabel1");
            int schedule_sno = Convert.ToInt32(snoLabel.Text);


            //-------------------------------------------------------------

            TextBox first_date_textbox = (TextBox)FormView2.FindControl("first_dateTextBox_update");
            TextBox last_date_textbox = (TextBox)FormView2.FindControl("last_dateTextBox_update");

            TextBox alert_timeTextBox = (TextBox)FormView2.FindControl("alert_timeTextBox_update");

            DateTime first_date = DateTime.Parse(first_date_textbox.Text);
            DateTime last_date = DateTime.Parse(last_date_textbox.Text);

            TextBox alert_textTextBox = (TextBox)FormView2.FindControl("alert_textTextBox_update");

            //xdays_textTextBox_update
            TextBox every_x_days = (TextBox)FormView2.FindControl("xdays_textTextBox_update");

            int kac_gunde_bir = Convert.ToInt32(every_x_days.Text);

            //-------------------------------------------------------------


            try
            {
                // Create the TransactionScope to execute the commands, guaranteeing
                // that both commands can commit or roll back as a single unit of work.
                using (TransactionScope scope = new TransactionScope())
                {

                    //ilişkili alert kayıtları siliniyor
                    delete_schedule_alert_related_by_the_schedule_sno(schedule_sno);

                    //yeni alert kayıtları oluşturuluyor
                    for (var day = first_date.Date; day.Date <= last_date.Date; day = day.AddDays(kac_gunde_bir))
                    {

                        add_schedule_alert(schedule_sno, day, alert_timeTextBox.Text);
                    }

                    //schedule kaydı güncelleniyor
                    update_schedule(schedule_sno, first_date, last_date, alert_timeTextBox.Text, alert_textTextBox.Text, Convert.ToInt32(every_x_days.Text));

                    //scope tamamlanıyor
                    scope.Complete();

                }
            }
            catch (TransactionAbortedException ex)
            {
                //writer.WriteLine("TransactionAbortedException Message: {0}", ex.Message);
                hata_label.Text = ex.ToString();
            }

            FormView2.ChangeMode(FormViewMode.ReadOnly);

            FormView2.DataBind();
            GridView2.DataBind();



            //Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void list_Button_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void FormView2_ItemInserting(object sender, FormViewInsertEventArgs e)
        {

        }

        protected void FormView2_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {

        }

        protected void FormView4_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            GridView3.DataBind();
        }

        protected void FormView2_DataBound(object sender, EventArgs e)
        {
            if (FormView2.CurrentMode == FormViewMode.Insert)
            {
                TextBox first_dateTextBox = (TextBox)FormView2.FindControl("first_dateTextBox");
                TextBox last_dateTextBox = (TextBox)FormView2.FindControl("last_dateTextBox");
                TextBox alert_timeTextBox = (TextBox)FormView2.FindControl("alert_timeTextBox");
                TextBox alert_textTextBox = (TextBox)FormView2.FindControl("alert_textTextBox");
                TextBox alert_textTextBox0 = (TextBox)FormView2.FindControl("alert_textTextBox0");


                first_dateTextBox.Text = DateTime.Now.ToString("yyyy-MM-dd");
                last_dateTextBox.Text = DateTime.Now.ToString("yyyy-MM-dd");
                alert_timeTextBox.Text = DateTime.Now.ToShortTimeString();

                alert_textTextBox.Text = "Merhabalar, mesajı aldınız mı?";
                alert_textTextBox0.Text = "1";

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (GridView2.SelectedIndex > -1)
            {
                string sql_str = "SELECT SA.sno,S.patient_sno,P.phone_number,P.name_surname,SA.mobile_alert_date,SA.mobile_alert_time," +
                                "SA.approval_time," +
                                "CASE " +
                                "    WHEN SA.approval_type = 0 THEN 'Generated by system (0)' " +
                                "    WHEN SA.approval_type = 1 THEN 'Read by patient (1)' " +
                                "    WHEN SA.approval_type = 2 THEN 'Accepted (2)' " +
                                "    WHEN SA.approval_type = 3 THEN 'Unaccepted (3)' " +
                                "    ELSE 'error' " +
                                "END as approval_type, " +
                                "CASE " +
                                "    WHEN SA.mobile_alert_time > GETDATE() and SA.approval_type = 0 THEN ':(' " +
                                "    WHEN SA.mobile_alert_time < GETDATE() and SA.approval_type = 0 THEN ':|' " +
                                "    WHEN SA.approval_type = 1 or SA.approval_type = 2 or SA.approval_type = 3 THEN ':)' " +
                                "END as decision_alert " +
                                "FROM Schedule_Alerts as SA LEFT OUTER JOIN Schedule as S on SA.schedule_sno = S.sno LEFT OUTER JOIN Patients as P on S.patient_sno = P.sno " +
                                "WHERE S.first_date >= '" + TextBox1.Text + "' and S.last_date <= '" + TextBox2.Text + "' and SA.schedule_sno = " + GridView2.SelectedValue + "";

                SqlConnection sqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["my_ConnectionString"].ToString());
                SqlCommand sqlCommand = new SqlCommand(sql_str, sqlConnection);


                //command.Parameters.Add(new SqlParameter("SalesOrderNumber",salesOrderNumber));

                SqlDataAdapter my_sql_adapter = new SqlDataAdapter(sqlCommand);

                DataSet ds = new DataSet();

                my_sql_adapter.Fill(ds, "patient_alerts_dataset");

                //pReportCulture
                //C:\Users\Navaron\Desktop\NATRO\PAS_WEB_PAGES\reports\patient_alert.rdlc'

                ReportViewer1.Reset();
                
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/reports/patient_alerts.rdlc");
                ReportDataSource rds = new ReportDataSource("DataSet1", ds.Tables[0]);
                ReportViewer1.LocalReport.DataSources.Clear();

                ReportViewer1.LocalReport.DataSources.Add(rds);
                //ReportViewer1.LocalReport.SetParameters(new ReportParameter("ReportLanguage", "tr-TR"));
                //ReportViewer1.Width = ReportViewer1.ZoomMode.;
                ReportViewer1.LocalReport.Refresh();

            }

            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "Uyarı", "alert('Hasta programını seçmelisiniz!');", true);

            }
        }

        protected void GridView2_DataBound(object sender, EventArgs e)
        {
            if (GridView2.Rows.Count == 0)
            {
                FormView2.ChangeMode(FormViewMode.Insert);
            }
            else
            {
                FormView2.ChangeMode(FormViewMode.ReadOnly);
            }
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {


        }

        public string GetImageToDisplay(string online_state)
        {
            string imagePath = "";

            if (online_state == "Yes")
            {
                imagePath = "~/fileicons/green_glow2.gif";

            }
            else
            {
                //imagePath = "~/fileicons/offline2.png";
                imagePath = "~/fileicons/red_13x13.png";

            }
            return imagePath;

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    Image img = (Image)e.Row.FindControl("online_Button");

            //    String plan = e.Row.Cells[4].Text; //First cell - change accordingly
            //    //double actual = double.Parse(e.Row.Cells[1].Text); //Second cell - change accordingly

            //    if (plan=="Yes") img.ImageUrl = "~/fileicons/online.png";
            //    else if (plan == "No") img.ImageUrl = "~/fileicons/offline.png";
            //}
        }
    }
}