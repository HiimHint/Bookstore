<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="XemSach.aspx.cs" Inherits="demo_web_ban_sach.XemSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="margin-top:30px">
        <div class="col-sm-2">
            <%--Thiết kế điều khiển chủ đề--%>
            <div class="list-group">
                <a class="list-group-item list-group-item-action active">CHỦ ĐỀ SÁCH</a>

                <asp:Repeater runat="server" DataSourceID="dsCDSach">
                    <%--Điều khiển lặp chủ đề--%>
                    <ItemTemplate>
                        <a href='<%# Eval("MaCD","XemSach.aspx?MaCD={0}") %>' class="list-group-item list-group-item-action"><%# Eval("Tenchude") %></a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="col-sm-10">
            <div>
                <div class="alert alert-success" >
                    <asp:FormView ID="FormView1" runat="server" DataSourceID="dsDemSach">
                        <ItemTemplate>Chủ đề <strong><%# Eval("Tenchude") %></strong> có <strong><%# Eval("SoSach") %></strong> quyển sách</ItemTemplate>
                    </asp:FormView>
                    
                </div>
                <%--thiết kế lvSach--%>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="dsSach">
                    <LayoutTemplate>

                        <div id="ItemPlaceholderContainer" class="row" runat="server" style="">
                            <div id="itemPlaceHolder" runat="server">
                            </div>
                        </div>
                        <div style="padding: 15px" class="text-center">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="8">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" FirstPageText="Đầu" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" FirstPageText="Cuối" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="col-sm-3" style="text-align:center">
                            <div>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("AnhBia","~/Du_lieu/Bia_sach/{0}") %>' Width="80%" Height="100%" CssClass="m-2" /><br />
                                <asp:Button ID="btDatMua" runat="server" Text="Đặt Mua" CssClass="btn-info" /><br />
                                <asp:Label ID="lbTenSach" runat="server" Text='<%# Eval("TenSach") %>'></asp:Label><br />
                                Giá bán:
                                    <asp:Label ForeColor="Red" ID="lbGia" runat="server" Text='<%# Eval("Dongia","{0:#,##0} đồng") %>'></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
    
    <asp:SqlDataSource ID="dsCDSach" runat="server" ConnectionString="<%$ ConnectionStrings:CNN_SACH %>" SelectCommand="SELECT * FROM [ChuDe]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsSach" runat="server" ConnectionString="<%$ ConnectionStrings:CNN_SACH %>" SelectCommand="SELECT Sach.MaSach, Sach.TenSach, Sach.MaCD, Sach.Dongia, Sach.AnhBia, ChuDe.Tenchude FROM Sach INNER JOIN ChuDe ON Sach.MaCD = ChuDe.MaCD WHERE (Sach.MaCD = @MaCD)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="5" Name="MaCD" QueryStringField="MaCD" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsDemSach" runat="server" ConnectionString="<%$ ConnectionStrings:CNN_SACH %>" SelectCommand="SELECT COUNT(Sach.MaSach) AS SoSach, ChuDe.Tenchude FROM Sach INNER JOIN ChuDe ON Sach.MaCD = ChuDe.MaCD WHERE (Sach.MaCD = @macd) GROUP BY ChuDe.Tenchude">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="5" Name="macd" QueryStringField="MaCD" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
