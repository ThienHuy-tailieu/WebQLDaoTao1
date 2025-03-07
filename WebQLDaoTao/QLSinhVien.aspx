<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQLDaoTao.QLSinhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Contents/pagination.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>THÔNG TIN SINH VIÊN</h2>

    <div class="table-responsive">
        <asp:GridView ID="gvSinhVien" runat="server" AutoGenerateColumns="False" 
            DataSourceID="odsSinhVien" CssClass="table table-bordered table-hover" 
            AllowPaging="True" PageSize="5" DataKeyNames="masv">
            <Columns>
                <asp:BoundField DataField="MaSV" HeaderText="Mã SV" ReadOnly="true" />
                <asp:BoundField DataField="HoSV" HeaderText="Họ SV" ControlStyle-Width="150px" />
                <asp:BoundField DataField="TenSV" HeaderText="Tên SV" ControlStyle-Width="80px" />
                <asp:TemplateField HeaderText="Giới Tính">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"
                            Text='<%# Convert.ToBoolean(Eval("GioiTinh"))==true?"Nam":"Nữ" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="NoiSinh" HeaderText="Nơi Sinh" />
                <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" SortExpression="DiaChi" />
                <asp:BoundField DataField="MaKH" HeaderText="Khoa" SortExpression="MaKH" />
                <asp:CommandField ShowEditButton="true" ButtonType="Button" EditText="Sửa"
                    ShowDeleteButton="true" DeleteText="Xóa" UpdateText="Ghi" CancelText="Không" ItemStyle-Wrap="false" />
            </Columns>
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
        </asp:GridView>
    </div>

    <asp:ObjectDataSource ID="odsSinhVien" runat="server"
        SelectMethod="getAll" TypeName="WebQLDaoTao.Models.SinhVienDAO"
        DataObjectTypeName="WebQLDaoTao.Models.SinhVien" DeleteMethod="Delete" UpdateMethod="Update"></asp:ObjectDataSource>
</asp:Content>
