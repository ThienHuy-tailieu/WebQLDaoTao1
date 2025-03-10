<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLMonHoc.aspx.cs" Inherits="WebQLDaoTao.QLMonHoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Contents/pagination.css" rel="stylesheet" />    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    
    <h2>QUẢN LÝ MÔN HỌC</h2>
    <hr />
    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Thêm môn học</button>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Thêm môn học</h4>
                </div>
                <div class="modal-body">
                    <div class="mb-3 row">
                        <label for="txtMaMH" class="col-sm-2 col-form-label">Mã môn học</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtMaMH" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="txtTenMon" class="col-sm-2 col-form-label">Tên môn học</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtTenMon" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="txtSoTiet" class="col-sm-2 col-form-label">Số tiết</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtSoTiet" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button1" OnClick="btnThem_Click" runat="server" Text="Lưu" CssClass="btn btn-primary" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
        <div>
            <h4>DANH SÁCH MÔN HỌC</h4>
            <asp:GridView CssClass="table table-bordered table-hover"
                ID="gvMonhoc" runat="server" AutoGenerateColumns="false" DataKeyNames="MaMH"
                OnRowEditing="gvMonHoc_RowEditing"
                OnRowCancelingEdit="gvMonhoc_RowCancelingEdit"
                OnRowUpdating="gvMonhoc_RowUpdating"
                OnRowDeleting="gvMonHoc_RowDeleting"
                AllowPaging="true" PageSize="5" OnPageIndexChanging="gvMonhoc_PageIndexChanging">
                <Columns>
                    <asp:BoundField HeaderText="Mã môn học" DataField="MaMH" />
                    <asp:BoundField HeaderText="Tên môn học" DataField="TenMH" />
                    <asp:BoundField HeaderText="Số tiết" DataField="SoTiet" />
                    <asp:TemplateField ItemStyle-CssClass="col-sm-2">
                        <ItemTemplate>
                            <asp:Button ID="btEdit" CommandName="Edit" runat="server" Text="Sửa"
                                CssClass="btn btn-success" />
                            <asp:Button ID="btDelete" CommandName="Delete" runat="server"
                                Text="Xóa" CssClass="btn btn-danger" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btUpdate" CommandName="Update" runat="server"
                                Text="Ghi" CssClass="btn btn-success" />
                            <asp:Button ID="btCancel" CommandName="Cancel" runat="server"
                                Text="Không" CssClass="btn btn-danger" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
                
                <HeaderStyle BackColor="#99ccff" />
                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
            </asp:GridView>
        </div>
    </div>
    
</asp:Content>
