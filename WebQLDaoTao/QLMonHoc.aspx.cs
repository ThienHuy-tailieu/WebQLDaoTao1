﻿using System;
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
                //lien ket du lieu cho gvMonhoc
                gvMonhoc.DataSource = mhDAO.getAll();
                gvMonhoc.DataBind();
            }
        }

        protected void gvMonHoc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //chuyen doi trang thai cua dong hien hanh : từ chế độ xem sang chế độ sửa
            gvMonhoc.EditIndex = e.NewEditIndex;
            //lien ket lai du lieu cho gvMonHoc
            gvMonhoc.DataSource = mhDAO.getAll();
            gvMonhoc.DataBind();
        }

        protected void gvMonhoc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //chuyen doi trang thai cua dong hien hanh : từ chế độ sửa(edit) sang chế độ xem
            gvMonhoc.EditIndex = -1;
            //lien ket lai du lieu cho gvMonHoc
            gvMonhoc.DataSource = mhDAO.getAll();
            gvMonhoc.DataBind();
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
            //b4. lien ket lai du lieu cho gvMonHoc
            gvMonhoc.DataSource = mhDAO.getAll();
            gvMonhoc.DataBind();
        }

        protected void gvMonHoc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                //b1. lấy thông tin mã môn học hiện hành
                string mamh = gvMonhoc.DataKeys[e.RowIndex].Value.ToString();
                //b2. goi phương thức xóa môn học khỏi CSDL của lớp MonHocDAO
                mhDAO.Delete(mamh);
                //b4. lien ket lai du lieu cho gvMonHoc
                gvMonhoc.DataSource = mhDAO.getAll();
                gvMonhoc.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('Không thể xóa môn học này')</script>");
            }
        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            try
            {
                //lay thong tin mon hoc can them
                string mamh = txtMaMH.Text;
                string tenmh = txtTenMH.Text;
                int sotiet = int.Parse(txtSoTiet.Text);
                if (mhDAO.findById(mamh) != null)
                {
                    lbThongBao.Text = "Mã môn học đã tồn tại. Chọn mã khác nhé";
                    return;
                }
                //goi phuong thuc them mon hoc vao CSDL cua lop MonHocDAO
                mhDAO.Insert(mamh, tenmh, sotiet);//lenh them du lieu
                lbThongBao.Text = "Đã thêm 1 môn học";
            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Thao tác thêm môn học không thành công do lỗi dữ liệu";
            }
            //liên kết dữ liệu cho gvMonHoc
            gvMonhoc.DataSource = mhDAO.getAll();
            gvMonhoc.DataBind();
        }
    }
}