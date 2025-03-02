<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQLDaoTao.QLSinhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>THÔNG TIN SINH VIÊN</h2>
    <hr />
    <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2">Mã sinh viên</label>
            <div class="col-md-2">
                <asp:TextBox ID="txtMaSV" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Họ sinh viên</label>
            <div class="col-md-2">
                <asp:TextBox ID="txtHoSv" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <label class="control-label col-md-2">Tên sinh viên</label>
            <div class="col-md-2">
                <asp:TextBox ID="txtTenSV" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Giới tính</label>
            <div class="col-md-4">
                <asp:RadioButton ID="rdNam" runat="server" Text="Nam" CssClass="radio-inline" Checked="true"
                    GroupName="GT" />
                <asp:RadioButton ID="rdNu" runat="server" Text="Nữ" CssClass="radio-inline" GroupName="GT" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Ngày sinh</label>
            <div class="col-md-4">
                <asp:TextBox ID="txtNgaysinh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

            </div>
            <label class="control-label col-md-2">Nơi sinh</label>
            <div class="col-md-4">
                <asp:TextBox ID="txtNoiSinh" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Địa chỉ</label>
            <div class="col-md-4">
                <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Chọn khoa</label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlMakhoa" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2"></label>
            <div class="col-md-4">
                <asp:Button ID="btThem" runat="server" Text="Thêm Mới" CssClass="btn btn-success" />
            </div>
        </div>
    </div>
    <div class="table-responsive">
        <asp:GridView ID="gvSinhvien" DataKeyNames="Masv"
            AllowPaging="true" runat="server" AutoGenerateColumns="false" DataSourceID="odsSinhVien" 
            CssClass="table table-bordered table-hover" OnSelectedIndexChanged="Page_Load">
            <Columns>
                <asp:BoundField DataField="masv" HeaderText="Mã SV" />
                <asp:BoundField DataField="hosv" HeaderText="Họ SV" />
                <asp:BoundField DataField="tensv" HeaderText="Tên SV" />
                <asp:CheckBoxField DataField="gioitinh" HeaderText="Giới tính" />
                <asp:BoundField DataField="ngaysinh" HeaderText="ngày sinh" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="noisinh" HeaderText="Nơi sinh" />
                <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" />
                <asp:BoundField DataField="makh" HeaderText="Mã khoa" />
                <asp:TemplateField HeaderText="Chọn tác vụ">
                    <ItemTemplate>

                        <asp:Button ID="btEdit" CommandName="Edit" runat="server" Text="Sửa" CssClass="btn btn-success" />

                        <asp:Button ID="btDelete" CommandName="Delete" runat="server" OnClientClick="returnconfirm('Bạn có chắc muốn xóa môn học?')"
                            Text="Xóa" CssClass="btn btn-danger" />
                    </ItemTemplate>
                    <EditItemTemplate>

                        <asp:Button ID="btUpdate" CommandName="Update" runat="server" Text="Ghi" CssClass="btn btn-primary" />

                        <asp:Button ID="btCancel" CommandName="Cancel" runat="server" Text="Không" CssClass="btnbtn-warning" />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:ObjectDataSource ID="odsSinhVien" runat="server" 
        SelectMethod="getAll" TypeName="WebQLDaoTao.Models.SinhVienDAO" 
        DataObjectTypeName="WebQLDaoTao.Models.SinhVien" UpdateMethod="Update" DeleteMethod="Delete">
    </asp:ObjectDataSource>
</asp:Content>
