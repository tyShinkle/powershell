# READ ME
#
# This script creates a desktop shortcut for any web url with any icon you'd like.
#
# In order to run this script in powershell, navigate to it's dir and type ./make-shortcut-final [name for shortcut] [url] [location of icon]
# If your having trouble running this script type in ...
#
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
#
# First argument 	-> name for shortcut
# Second argument 	-> url for website
# Third argumet		-> location of desired icon

# SET PARAMETERS
$name_fragment = $args[0]
$site_url = $args[1]
$icon_path = $args[2]

#CHECK FOR WEBLINKS DIR
$Folder = "c:\webLinks"
if(Test-Path -Path $Folder){
	Write Path Exists!
}else{
	mkdir c:\webLinks
}

# CREATE URL LINK IN C:\WEBLINKS
$url_link_path = "c:\webLinks\$name_fragment.url"
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($url_link_path)
$Shortcut.TargetPath = $site_url
$Shortcut.Save()

# CREATE SHORTCUT TO URL SHORTCUT
$s_name = "$env:USERPROFILE\desktop\$name_fragment.lnk"
$s_target = $Shortcut
$sh = new-object -com "WScript.Shell"
$lnk = $sh.CreateShortcut($s_name)
$lnk.TargetPath = $s_target
$lnk.IconLocation = $icon_path
$lnk.Save()