using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLMonHoc : System.Web.UI.Page
    {
        MonHocDAO mhDAO = new MonHocDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LienKetDuLieu();
            }
        }
        private void LienKetDuLieu()
        {
            gvMonhoc.DataSource = mhDAO.getAll();
            gvMonhoc.DataBind();
        }

        protected void gvMonHoc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMonhoc.EditIndex = e.NewEditIndex;
            LienKetDuLieu();
        }
        protected void gvMonhoc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //chuyen doi trang thai cua dong hien hanh : từ chế độ sửa(edit) sang chế độ xem
            gvMonhoc.EditIndex = -1;
            LienKetDuLieu();
        }

        protected void gvMonhoc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //b1. lấy thông tin môn học
            string mamh = gvMonhoc.DataKeys[e.RowIndex].Value.ToString();
            string tenmh = ((TextBox)gvMonhoc.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            int sotiet = int.Parse(((TextBox)gvMonhoc.Rows[e.RowIndex].Cells[2].Controls[0]).Text);
            //b2. cap nhat vao CSDL
            mhDAO.Update(mamh, tenmh, sotiet);
            //b3. chuyen doi trang thai cua dong hien hanh : từ chế độ sửa(edit) sang chế độ xem
            gvMonhoc.EditIndex = -1;
            LienKetDuLieu();
        }

        protected void gvMonHoc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                //b1. lấy thông tin mã môn học hiện hành
                string mamh = gvMonhoc.DataKeys[e.RowIndex].Value.ToString();
                //b2. goi phương thức xóa môn học khỏi CSDL của lớp MonHocDAO
                mhDAO.Delete(mamh);
                LienKetDuLieu();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('Không thể xóa môn học này')</script>");
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string mamh = txtMaMH.Text;
            string tenmh = txtTenMon.Text;
            int sotiet = int.Parse(txtSoTiet.Text);

            
            //Gọi phương thức thêm mới
            mhDAO.Insert(mamh,tenmh,sotiet);
            //load lại dữ liệu
            LienKetDuLieu();
        }

        protected void gvMonhoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMonhoc.PageIndex = e.NewPageIndex;
            LienKetDuLieu();
        }
    }
}