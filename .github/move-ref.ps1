# $PSDefaultParameterValues['*:Encording'] = 'utf8'
# �����̎󂯎��
param(
    [int]$pullnumber
)

New-Item -ItemType Directory -Path "G:\\�}�C�h���C�u\\Share\\${pullnumber}" -Force
Copy-Item -Path "C:\\Users\\suguru irie\\ProjectBlueArchive\\Recordings\\*.mp4" -Destination "G:\\�}�C�h���C�u\\Share\\${pullnumber}\\"
Remove-Item -Path "C:\\Users\\suguru irie\\ProjectBlueArchive\\Recordings\\*.mp4" -Force