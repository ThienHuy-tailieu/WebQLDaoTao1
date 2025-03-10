<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLKhoa.aspx.cs" Inherits="WebQLDaoTao.QLKhoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Contents/pagination.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>TRANG QUẢN TRỊ KHOA </h2>
    <hr />
    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Thêm khoa</button>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Thêm khoa</h4>
                </div>
                <div class="modal-body">
                    <div class="mb-3 row">
                        <label for="txtMaMH" class="col-sm-2 col-form-label">Mã khoa</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtMaKH" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="txtTenMon" class="col-sm-2 col-form-label">Tên khoa</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtTenKH" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <asp:Button ID="btThem" OnClick="btThem_Click" runat="server" Text="Lưu" CssClass="btn btn-primary" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
                <asp:Label ID="lbThongBao" ForeColor="#cc3300" runat="server"
                    Text=""></asp:Label>
            </div>
        </div>
    </div>
    <div>
        <h4>DANH SÁCH CÁC KHOA</h4>
        <asp:GridView ID="gvKhoa" DataKeyNames="MaKH" CssClass="table table-bordered table-hover" runat="server"
            AutoGenerateColumns="false" OnRowDeleting="gvKhoa_RowDeleting"
            OnRowEditing="gvKhoa_RowEditing" OnRowCancelingEdit="gvKhoa_RowCancelingEdit" OnRowUpdating="gvKhoa_RowUpdating"
            AllowPaging="True" PageSize="5" OnPageIndexChanging="gvKhoa_PageIndexChanging">
            <Columns>
                <asp:BoundField HeaderText="Mã khoa" DataField="MaKH" />
                <asp:BoundField HeaderText="Tên khoa" DataField="TenKH" />
                <asp:TemplateField ItemStyle-CssClass="col-sm-2">
                    <ItemTemplate>
                        <asp:Button ID="btEdit" CommandName="Edit" runat="server"
                            Text="Sửa" CssClass="btn btn-success" />
                        <asp:Button ID="btDelete" CommandName="Delete" runat="server"
                            OnClientClick="return confirm('Bạn có chắc muốn xóa môn học?')" Text="Xóa" CssClass="btn btn-danger" />
                    </ItemTemplate>
                    <EditItemTemplate>

                        <asp:Button ID="btUpdate" CommandName="Update" runat="server"
                            Text="Ghi" CssClass="btn btn-primary" />
                        <asp:Button ID="btCancel" CommandName="Cancel" runat="server"
                            Text="Không" CssClass="btn btn-warning" />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#99ccff" />
        </asp:GridView>
    </div>
</asp:Content>
