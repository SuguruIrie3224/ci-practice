# $PSDefaultParameterValues['*:Encording'] = 'utf8'
# 引数の受け取り
param(
    [int]$pullnumber
)

New-Item -ItemType Directory -Path "G:\\マイドライブ\\Share\\${pullnumber}" -Force
Copy-Item -Path "C:\\Users\\suguru irie\\ProjectBlueArchive\\Recordings\\*.mp4" -Destination "G:\\マイドライブ\\Share\\${pullnumber}\\"
Remove-Item -Path "C:\\Users\\suguru irie\\ProjectBlueArchive\\Recordings\\*.mp4" -Force