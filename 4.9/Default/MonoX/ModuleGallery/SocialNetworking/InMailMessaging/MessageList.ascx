﻿<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="MessageList.ascx.cs" Inherits="MonoSoftware.MonoX.ModuleGallery.SocialNetworking.InMail.MessageList" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Import Namespace="MonoSoftware.MonoX.Resources" %>
<%@ Import Namespace="MonoSoftware.MonoX.Resources" %>
<%@ Import Namespace="MonoSoftware.MonoX.DAL.EntityClasses" %>
<%@ Register Assembly="MonoX" Namespace="MonoSoftware.MonoX.Blog" TagPrefix="MonoX" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Namespace="MonoSoftware.Web.Pager" Assembly="MonoSoftware.Web.Pager" TagPrefix="mono" %>


    <div class='sort-filter <%= MonoSoftware.MonoX.Utilities.SecurityUtility.IsAdmin() ? "administrator-mode" : "" %>'>
        <div class="filtering">
            <div class="filtering-holder">
                <asp:TextBox ID="txtSearch" runat="server" style="vertical-align: middle" CssClass="simpleTextBox" ></asp:TextBox>
                <ajaxToolkit:TextBoxWatermarkExtender ID="tbweSearch" runat="server" TargetControlID="txtSearch"/>
                <asp:ImageButton ID="btnShowAll" CausesValidation="false" runat="server" ImageAlign="Middle" OnClick="btnShowAll_Click" CssClass="clear" />
                <asp:ImageButton ID="btnSearch" CausesValidation="false" runat="server" ImageAlign="Middle" OnClick="btnSearch_Click" CssClass="search" />
             </div>
        </div>
        <div class="sorting">
            <div class="sorting-holder">
                <div class="from message-button" style='<%= MessageStatusFilter == MonoSoftware.MonoX.Repositories.MessageStatus.Received ? String.Empty : "display: none;"%>'>
                    <asp:LinkButton ID="btnSortByColumnFrom" runat="server" CausesValidation="false" CommandArgument="AspnetUser.UserName" OnClick="btnSortBy_Click">
                            <%= SocialNetworkingResources.Messaging_MessageList_ColumnFrom %>
                    </asp:LinkButton>
                </div>
                <div class="to message-button" style='<%= MessageStatusFilter == MonoSoftware.MonoX.Repositories.MessageStatus.Sent ? String.Empty : "display: none;"%>'>
                    <asp:LinkButton ID="btnSortByColumnTo" runat="server" CausesValidation="false" CommandArgument="ToListShort" OnClick="btnSortBy_Click">
                        <%= SocialNetworkingResources.Messaging_MessageList_ColumnTo %>
                    </asp:LinkButton>
                </div>
                <div class="subject message-button">
                    <asp:LinkButton ID="btnSortbyColumnSubject" runat="server" CausesValidation="false" CommandArgument="Subject" OnClick="btnSortBy_Click">
                        <%= SocialNetworkingResources.Messaging_MessageList_ColumnSubject %>
                    </asp:LinkButton>  
                </div>
                <div class="date message-button">
                    <asp:LinkButton ID="btnSortbyColumnDate" runat="server" CausesValidation="false" CommandArgument="DateCreated" OnClick="btnSortBy_Click">
                        <%= SocialNetworkingResources.Messaging_MessageList_ColumnDate %>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <asp:ListView ID="rptMail" runat="server">
        <LayoutTemplate>
            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="message-list <%# (Container.DataItemIndex + 1) % 2 == 0 ? "even" : "odd" %> <%# (Container.DataItemIndex) == 0 ? "first" : "" %> <%# ((SnMessageEntity)Container.DataItem).IsRead(MonoSoftware.MonoX.Utilities.SecurityUtility.GetUserId()) ? "message-read" : "message-unread"  %>" >
                <div class="message-holder" >
                    <div class="avatar">
                        <MonoX:Gravatar ID="ctlGravatar" runat="server" Size="50" /> 
                    </div>
                    <div class="content" onclick="previewRow('<%# ((SnMessageEntity)Container.DataItem).Id %>');">
                    <div class="date"><%# MonoSoftware.MonoX.Repositories.UserRepository.GetInstance().ConvertTimeFromUtcToUserLocalTime(MonoSoftware.MonoX.Utilities.SecurityUtility.GetUserId(), ((SnMessageEntity)Container.DataItem).DateCreated)%></div>
                        <h2 style="<%# MessageStatusFilter == MonoSoftware.MonoX.Repositories.MessageStatus.Received ? String.Empty : "display: none;"%>"><%# GetUsername(((SnMessageEntity)Container.DataItem)) %></h2>
                        <h2 style='<%# MessageStatusFilter == MonoSoftware.MonoX.Repositories.MessageStatus.Sent ? String.Empty : "display: none;"%>'><%# GetToListDisplayNames((SnMessageEntity)Container.DataItem) %></h2>
                        <div class="subject"><%# ((SnMessageEntity)Container.DataItem).Subject %></div>
                    </div>
                </div>
                <div class="options">
                    <asp:ImageButton ID="btnDelete" runat="server" 
                        CausesValidation="false" 
                        ImageUrl='<%# MonoSoftware.MonoX.Utilities.UrlUtility.ResolveThemeUrl("img/delete.png") %>' 
                        AlternateText='<%# DefaultResources.Button_Delete %>'
                        ToolTip='<%# DefaultResources.Button_Delete %>'
                        BorderWidth="0"
                        OnClientClick="javascript:if(!confirm(ResourceManager.GetString('DeleteConfirmationMessage'))){return false;}"
                        CommandArgument="<%# ((SnMessageEntity)Container.DataItem).Id %>" 
                        OnClick="btnDelete_Click"
                         />
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>
    <div style="overflow: hidden;">
        <mono:Pager ID="pager" runat="server" AutoPaging="false" AllowCustomPaging="true" EnableViewState="true" PageSize="10" NumericButtonCount="5" >
            <PagerTemplate>
            </PagerTemplate>
        </mono:Pager>
        <asp:Label runat="server" ID="labEmpty" CssClass="empty-list"></asp:Label>
    </div>
