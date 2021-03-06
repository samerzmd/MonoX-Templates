﻿<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="PeopleSearch.ascx.cs"
    Inherits="MonoSoftware.MonoX.ModuleGallery.SocialNetworking.PeopleSearch" %>
<%@ Register TagPrefix="rad" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="MonoX" TagName="InvitationList" Src="~/MonoX/ModuleGallery/SocialNetworking/InvitationList.ascx" %>
<%@ Register Src="~/MonoX/controls/UserPicker.ascx" TagPrefix="MonoX" TagName="UserSearch" %>
<%@ Register TagPrefix="MonoX" TagName="StyledButton" Src="~/MonoX/controls/StyledButton.ascx" %>
<%@ Import Namespace="MonoSoftware.MonoX.Resources" %>
<asp:ScriptManagerProxy ID="scriptManagerProxy" runat="server">
</asp:ScriptManagerProxy>
<div class="people-search">
    <asp:Literal ID="ltlInfoText" runat="server" ></asp:Literal> 
    <asp:Panel ID="pnlSearch" runat="server" CssClass="PeopleSearch">
    <div class="search-textbox">
        <MonoX:UserSearch ID="userSearch" runat="server" UserFilterMode="ShowAllUsers" AutoCompleteSeparator="">
        </MonoX:UserSearch>
    </div>
    </asp:Panel>
    <asp:Panel ID="pnlActionPanel" runat="server" CssClass="jq_monoxPeopleSearchCommand">
    <div style="float: right;">
        <MonoX:StyledButton runat="server" ID="btnAdd" OnClick="btnAdd_Click" CssClass="SNbutton jq_monoXAddFriendAction" />
        <MonoX:StyledButton runat="server" ID="btnViewProfile" OnClick="btnViewProfile_Click"
            CssClass="SNbutton" />
    </div>
    <div style="clear: both">
        <asp:Literal runat="server" ID="ltlMessage"></asp:Literal>
    </div>
    <asp:Panel runat="server" ID="pnlInviteFriend" CssClass="jq_monoxInviteFriendPanel">
        <div class="personalMessageLabel">
            <asp:Literal runat="server" ID="lblPersonalMessage"></asp:Literal></div>
        <asp:TextBox runat="server" TextMode="MultiLine" ID="txtRequestMessage" Rows="4"
            Width="100%"></asp:TextBox>
        <div style="float: right;">
            <MonoX:StyledButton runat="server" ID="btnSendRequest" CssClass="SNbutton" OnClick="btnSendRequest_Click" />
        </div>
    </asp:Panel>
    <br />
    </asp:Panel>
</div>