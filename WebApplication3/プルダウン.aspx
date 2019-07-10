<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="プルダウン.aspx.cs" Inherits="WebApplication3.プルダウン" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- jQuery UI -->
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var $txt = $('input[id$=txtNew]');
            var $ddl = $('select[id$=DDL]');
            var $items = $('select[id$=DDL] option');

            $txt.keyup(function () {
                searchDdl($txt.val());
            });

            function searchDdl(item) {
                $ddl.empty();
                var exp = new RegExp(item, "i");
                var arr = $.grep($items,
                    function (n) {
                        return exp.test($(n).text());
                    });

                if (arr.length > 0) {
                    countItemsFound(arr.length);
                    $.each(arr, function () {
                        $ddl.append(this);
                        $ddl.get(0).selectedIndex = 0;
                    }
                    );
                }
                else {
                    countItemsFound(arr.length);
                    $ddl.append("<option>No Items Found</option>");
                }
            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>
                ドロップダウンリストを絞り込むためのテキストを入力してください...
            </p>
            <asp:TextBox ID="txtNew" runat="server" ToolTip="Enter Text Here"></asp:TextBox><br />
            <asp:DropDownList ID="DDL" runat="server" AutoPostBack="True">
                <asp:ListItem Text="Apple" Value="1"></asp:ListItem>
                <asp:ListItem Text="Orange" Value="2"></asp:ListItem>
                <asp:ListItem Text="Peache" Value="3"></asp:ListItem>
                <asp:ListItem Text="Banana" Value="4"></asp:ListItem>
                <asp:ListItem Text="Melon" Value="5"></asp:ListItem>
                <asp:ListItem Text="Lemon" Value="6"></asp:ListItem>
                <asp:ListItem Text="Pineapple" Value="7"></asp:ListItem>
                <asp:ListItem Text="Pomegranate" Value="8"></asp:ListItem>
                <asp:ListItem Text="Mulberry" Value="9"></asp:ListItem>
                <asp:ListItem Text="Apricot" Value="10"></asp:ListItem>
                <asp:ListItem Text="Cherry" Value="11"></asp:ListItem>
                <asp:ListItem Text="Blackberry" Value="12"></asp:ListItem>
            </asp:DropDownList>

            <br />
            <p id="para"></p>
        </div>


    </form>
</body>
</html>
