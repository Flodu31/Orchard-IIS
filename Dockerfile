FROM microsoft/iis
MAINTAINER Florent APPOINTAIRE <florent.appointaire@gmail.com>
RUN powershell -command \
  Install-WindowsFeature Web-Asp-Net45,Web-Net-Ext45; \
  New-Item -Path C:\Temp -ItemType Directory; \
  wget -Uri https://github.com/OrchardCMS/Orchard/releases/download/1.10.1/Orchard.Web.zip -OutFile C:\temp\Orchard.Web.zip; \
  Expand-Archive -Path C:\temp\Orchard.Web.zip -DestinationPath C:\inetpub\wwwroot; \
  Remove-Item -Path C:\temp\Orchard.Web.zip
CMD C:\\Windows\\System32\\icacls.exe C:\\inetpub\\wwwroot\\Orchad\\App_Data /grant IIS_IUSRS:(OI)(CI)(M)
CMD C:\\Windows\\System32\\icacls.exe C:\\inetpub\\wwwroot\\Orchad\\Modules /grant IIS_IUSRS:(OI)(CI)(M)
CMD C:\\Windows\\System32\\icacls.exe C:\\inetpub\\wwwroot\\Orchad\\Media /grant IIS_IUSRS:(OI)(CI)(M)
CMD C:\\Windows\\System32\\icacls.exe C:\\inetpub\\wwwroot\\Orchad\\Themes /grant IIS_IUSRS:(OI)(CI)(M)
CMD iisreset
EXPOSE 80