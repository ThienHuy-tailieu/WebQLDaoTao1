<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLMonHoc.aspx.cs" Inherits="WebQLDaoTao.QLMonHoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>QUẢN LÝ MÔN HỌC</h2>
    <hr />
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-10">
            <h4>DANH SÁCH MÔN HỌC</h4>
            <asp:GridView CssClass="table table-bordered"
                ID="gvMonhoc" runat="server" AutoGenerateColumns="false" DataKeyNames="MaMH" OnSelectedIndexChanged="gvMonhoc_SelectedIndexChanged" OnRowEditing="gvMonHoc_RowEditing" OnRowCancelingEdit="gvMonhoc_RowCancelingEdit" OnRowUpdating="gvMonhoc_RowUpdating" OnRowDeleting="gvMonHoc_RowDeleting">
                <Columns>
                    <asp:BoundField HeaderText="Mã môn học" DataField="MaMH" />
                    <asp:BoundField HeaderText="Tên môn học" DataField="TenMH" />
                    <asp:BoundField HeaderText="Số tiết" DataField="SoTiet" />
                    <asp:TemplateField>
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
                </columns>
                <headerstyle backcolor="#003399" forecolor="#ffffff" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
