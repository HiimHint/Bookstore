<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="QuanTri.aspx.cs" Inherits="demo_web_ban_sach.QuanTri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="align-content-center">
        <h2>Quản trị sách</h2>
        <div class="d-inline-flex ">
            Tên sách &ensp;
            <asp:TextBox ID="txtTimSach" Width="50%" runat="server">
            </asp:TextBox>&ensp;<asp:Button ID="btTimKiem" runat="server" Text="Tìm Kiếm" CssClass="btn-block" Width="150px" />
            <asp:Button ID="btThemSach" runat="server" Text="Thêm sách" CssClass="alert-primary align-content-lg-end" PostBackUrl="~/ThemSach.aspx" />
        </div>
        <div>
            <asp:GridView ID="gvSach" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" AllowPaging="true" PageSize="10" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="MaSach" DataSourceID="dsTimSach" Width="100%">
                <Columns>
                    <asp:BoundField DataField="TenSach" ReadOnly="true" HeaderText="Tên Sách" SortExpression="TenSach" />
                    <asp:ImageField DataImageUrlField="AnhBia" ReadOnly="true" DataImageUrlFormatString="~/Du_lieu/Bia_sach/{0}" HeaderText="Bìa sách">
                    </asp:ImageField>
                    <asp:BoundField DataField="Dongia" HeaderText="Đơn giá" SortExpression="Dongia" />
                    <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                    <asp:CommandField DeleteText="Xóa" EditText="Sửa" ShowDeleteButton="True" UpdateText="Cập nhật" />

                </Columns>

                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <asp:SqlDataSource ID="dsTimSach" runat="server" ConnectionString="<%$ ConnectionStrings:CNN_SACH %>"
                DeleteCommand="DELETE FROM [Sach] WHERE [MaSach] = @MaSach"
                InsertCommand="INSERT INTO [Sach] ([TenSach], [MaNXB], [AnhBia], [Dongia]) VALUES (@TenSach, @MaNXB, @AnhBia, @Dongia)"
                SelectCommand="SELECT Sach.MaSach, Sach.TenSach, Sach.MaNXB, Sach.AnhBia, Sach.Dongia, NhaXuatBan.TenNXB FROM Sach INNER JOIN NhaXuatBan ON Sach.MaNXB = NhaXuatBan.MaNXB WHERE (Sach.TenSach LIKE '%' + @TenSach + '%')"
                UpdateCommand="UPDATE [Sach] SET [Dongia] = @Dongia WHERE [MaSach] = @MaSach">
                <DeleteParameters>
                    <asp:Parameter Name="MaSach" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TenSach" Type="String" />
                    <asp:Parameter Name="MaNXB" Type="Int32" />
                    <asp:Parameter Name="AnhBia" Type="String" />
                    <asp:Parameter Name="Dongia" Type="Decimal" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtTimSach" DefaultValue=" " Name="TenSach" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Dongia" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

    </div>


</asp:Content>
