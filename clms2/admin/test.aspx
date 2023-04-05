<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="clms2.admin.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:DropDownList ID="ddlYear" runat="server" class="form-control" MaxLength="50"></asp:DropDownList>&nbsp&nbsp

                <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Font-Bold="True" Font-Size="Large" Width="100px">
                    <asp:ListItem Value="1">Jan</asp:ListItem>
                    <asp:ListItem Value="2">Feb</asp:ListItem>
                    <asp:ListItem Value="3">Mar</asp:ListItem>
                    <asp:ListItem Value="4">Apr</asp:ListItem>
                    <asp:ListItem Value="5">May</asp:ListItem>
                    <asp:ListItem Value="6">Jun</asp:ListItem>
                    <asp:ListItem Value="7">Jul</asp:ListItem>
                    <asp:ListItem Value="8">Aug</asp:ListItem>
                    <asp:ListItem Value="9">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dec</asp:ListItem>
                </asp:DropDownList>
   
                <br />
                <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%" CellSpacing="2">
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
                <br />
                <br />
            <%--    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
                     
                </asp:GridView>--%>
                <div class="table-responsive" style="overflow: auto;">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                        GridLines="Vertical" AllowPaging="True" DataKeyNames="emp_code" 
                        EmptyDataText="No records has been added."
                        Class="table table-bordered nowrap" ShowHeaderWhenEmpty="True">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="Black" />
                        <Columns>
                            <asp:TemplateField HeaderText="Sl. No">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                                <ItemStyle Width="30px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Emp Code"  ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="emp_code" runat="server" Text= '<%# Eval("emp_code") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Emp Name" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="emp_name" runat="server" Text= '<%# Eval("emp_name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="Shift"  ItemStyle-Width="100">
                                <ItemTemplate>
                                    <asp:Label ID="shift" runat="server" Text= '<%# Eval("shift") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="1" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D1" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="2" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D2" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="3" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D3" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="4" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D4" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="5" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D5" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="6" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D6" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="7" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D7" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="8" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D8" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="9" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D9" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="10" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D10" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="11" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D11" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="12" ItemStyle-Width="100">
                                <ItemTemplate>
                                    <asp:TextBox ID="D12" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="13" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D13" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="14" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D14" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="15" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D15" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="16" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D16" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="17" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D17" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="18" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D18" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="19" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D19" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="20" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D20" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="21" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D21" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="22" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D22" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="23" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D23" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="24" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D24" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="25" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D25" runat="server" Text = '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="26" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D26" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="27" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D27" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="28" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D28" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="29" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D29" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="30" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D30" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="31" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:TextBox ID="D31" runat="server" Text= '<%# Eval("shift") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                         </Columns>
                        
                        <AlternatingRowStyle BackColor="#FFFFFF" />
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle CssClass="myheader" BackColor="#eeeeee" Height="30px" Font-Bold="True" ForeColor="Black" />
                        <PagerStyle CssClass="GridPager" BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#B2DFDB" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="Black" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                  </div>
                <div>
                    <br />
                    <br />
                    <asp:Button ID="btnBulkInsert" runat="server" Text="Submit" OnClick="btnBulkInsert_Click" />
                    <br />
                    <asp:Label ID="lblMsg" runat="server" ForeColor="#00CC66"></asp:Label>
                    <asp:Label ID="lblMsgError"  runat="server" ForeColor="#CC0000"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
