<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Admin.Controllers.UserViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create User</h2>

    <form method="post" action="/User/Insert">
    FirstName: <input type="text" id="firstname" name="firstname" /> <br />
    LastName: <input type="text" id="lastname" name="lastname" /> <br />
    <%=Html.DropDownList("statusid", Model.AllStatus) %><br />
    <input type="submit" />



    </form>

</asp:Content>
