msiexec /i MP3SkypeRecorderSetup.msi /quiet /qn /norestart
msiexec /x MP3SkypeRecorderSetup.msi /quiet /qn /norestart
choco new mp3skyperecorder -a --version 1.0 
choco pack
choco install ./mp3skyperecorder.4.50.1.nupkg
choco uninstall mp3skyperecorder
choco apikey --key [key goes here] --source https://push.chocolatey.org/
choco push ./mp3skyperecorder.4.50.1.nupkg --source https://push.chocolatey.org/