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
            gvSinhvien.DataSource = svDao.getAll();
            gvSinhvien.DataBind();
        }
    }
}