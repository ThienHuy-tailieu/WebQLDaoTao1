using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLSinhVien : System.Web.UI.Page
    {
        KhoaDAO khDao = new KhoaDAO();
        SinhVienDAO svDao = new SinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //khoi tao du lieu cho ddlKhoa
                ddlMakhoa.DataSource = khDao.getAll();
                ddlMakhoa.DataTextField = "TenKH";
                ddlMakhoa.DataValueField = "Makh";
                ddlMakhoa.DataBind();
                //lien ket du lieu cho gvSinhVien
                LienKetDuLieuLuoiSinhVien();
            }
        }

        private void LienKetDuLieuLuoiSinhVien()
        {
            gvSinhVien.DataBind();
        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            //thu thap thong tin sinh vien
            string masv = txtMaSV.Text;
            string hosv = txtHoSV.Text;
            string tensv = txtTenSV.Text;
            Boolean gioitinh = rdNam.Checked ? true : false;
            DateTime ngaysinh = DateTime.Parse(txtNgaysinh.Text);
            string noisinh = txtNoiSinh.Text;
            string diachi = txtDiaChi.Text;
            string makh = ddlMakhoa.SelectedValue;
            //them sinh vien vao CSDL
            svDao.Insert(masv, hosv, tensv, gioitinh, ngaysinh, noisinh, diachi, makh);
            //lien ket lai du lieu cho gvSinhVien
            LienKetDuLieuLuoiSinhVien();
        }

    }
}