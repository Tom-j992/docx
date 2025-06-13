@echo off
:: 获取当前目录路径
set "current_dir=%cd%"
:: 检查是否以管理员身份运行
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo 请求管理员权限...
    :: 使用 PowerShell 以管理员身份重新启动脚本
    powershell -Command "Start-Process cmd -ArgumentList '/k cd /d %current_dir%' -Verb RunAs"
) else (
    :: 如果已经是管理员，直接启动新窗口
    start cmd /k "cd /d %current_dir%"
)