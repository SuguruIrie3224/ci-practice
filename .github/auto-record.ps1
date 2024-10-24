# コマンドライン引数からシーンパスを受け取る
param(
    [string]$scenePath = "Assets/Resources/Scenes/SetupScene.unity"  # デフォルトのシーンパス
)

# Unity実行ファイルのパス
$unityPath = "C:\Program Files\Unity\Hub\Editor\2023.2.19f1\Editor\Unity.exe"  # Unity.exeのパスを指定

# プロジェクトのパス
$projectPath = "C:\Users\suguru irie\ProjectBlueArchive"

# 実行する静的メソッド
$executeMethod = "ModelReferenceRecorder.RecordCheckVideo"

# Unityの実行コマンドを作成
$arguments = "-projectPath `"$projectPath`" -executeMethod `"$executeMethod`" -scene `"$scenePath`" "

# コマンドを表示（デバッグ用）
Write-Host "Executing Unity command:"
Write-Host "`"$unityPath`" $arguments"

# コマンドを実行
Start-Process -FilePath $unityPath -ArgumentList $arguments -NoNewWindow -Wait

# 終了メッセージ
Write-Host "Unity execution finished."
