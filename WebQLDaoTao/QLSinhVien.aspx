<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQLDaoTao.QLSinhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Contents/pagination.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>THÔNG TIN SINH VIÊN</h2>
    <hr>

    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Thêm sinh viên</button>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Thêm sinh viên</h4>
                </div>
                <div class="modal-body">
                    <div class="mb-3 row">
                        <label for="txtMaSV" class="col-sm-2 col-form-label">Mã sinh viên</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtMaSV" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="txtHoSV" class="col-sm-2 col-form-label">Họ sinh viên</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtHoSV" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="txtTenSV" class="col-sm-2 col-form-label">Tên sinh viên</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtTenSV" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Giới tính</label>
                        <div class="col-sm-4">
                            <asp:RadioButton ID="rdNam" runat="server" Text="Nam" CssClass="radio-inline" Checked="true"
                                GroupName="GT" />
                            <asp:RadioButton ID="rdNu" runat="server" Text="Nữ" CssClass="radio-inline" GroupName="GT" />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="txtNgaySinh" class="control-label col-md-2">Ngày sinh</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtNgaysinh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="txtNoiSinh" class="control-label col-md-2">Nơi sinh</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtNoiSinh" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                <div class="mb-3 row">
                    <label for="txtDiaChi" class="control-label col-md-2">Địa chỉ</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="control-label col-md-2">Chọn khoa</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="ddlMakhoa" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>

                <div class="modal-footer">
                    <asp:Button ID="btThem" runat="server" Text="Lưu" CssClass="btn btn-success" OnClick="btThem_Click" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
                <asp:Label ID="lbThongBao" ForeColor="#cc3300" runat="server"
                    Text=""></asp:Label>
            </div>
        </div>
    </div>
    </div>
    <h4>DANH SÁCH SINH VIÊN</h4>
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
                <asp:BoundField DataField="MaKH" HeaderText="Khoa" SortExpression="MaKH" ControlStyle-Width="80px" />
                <asp:CommandField ShowEditButton="true" ButtonType="Button" EditText="Sửa"
                    ShowDeleteButton="true" DeleteText="Xóa" UpdateText="Ghi" CancelText="Không" ItemStyle-Wrap="false" />
            </Columns>
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#99ccff" />
        </asp:GridView>
    </div>

    <asp:ObjectDataSource ID="odsSinhVien" runat="server"
        SelectMethod="getAll" TypeName="WebQLDaoTao.Models.SinhVienDAO"
        DataObjectTypeName="WebQLDaoTao.Models.SinhVien" DeleteMethod="Delete" UpdateMethod="Update"></asp:ObjectDataSource>
</asp:Content>
