<%@ Control 
    Language="C#" 
    AutoEventWireup="True" 
    Inherits="MonoSoftware.MonoX.ModuleGallery.UploadModule" 
    Codebehind="UploadModule.ascx.cs" %>

<%@ Register TagPrefix="radU" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="MonoX" TagName="FileGallery" Src="~/MonoX/ModuleGallery/SocialNetworking/FileGallery.ascx" %>

<asp:Panel ID="pnlContainer" runat="server">
    <div class="rad-upload-container input-form clearfix">
        <radU:RadUpload ID="radUpload" runat="server" InitialFileInputsCount="1" OverwriteExistingFiles="true" Skin="Default" />
        <div class="button-holder float-left">
            <MonoX:StyledButton runat="server" ID="btnUpload" CausesValidation="false" OnClick="btnUpload_Click" CssClass="styled-button-blue"></MonoX:StyledButton>        
        </div>
        <asp:Label runat="server" CssClass="ErrorText" ID="lblWarning"></asp:Label>
        <MonoX:FileGallery ID="fileGallery" runat="server" PageSize="5"></MonoX:FileGallery>
    </div>
</asp:Panel>