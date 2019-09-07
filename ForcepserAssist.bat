@rem Forcepser Assist Script by minfia

@rem Forcepser Assist Scriptは無保証で提供されます。
@rem このプログラムを使用した事で発生した全ての損害について保証しません。

@rem やること
@rem かんしくんで使用するsetting.txtをかんしくんフォルダにコピー
@rem かんしくんの起動とAviUtlのプロジェクトを開く

@rem 使い方
@rem AVIUTL_DIRにaviutl.exeがあるフォルダを指定("""で囲う)(フォルダ名の最後に"\"は付けないこと)
@rem PROJECT_FILEに開きたい.aupファイルを指定("""で囲う)(拡張子なし)
@rem FORCEPSER_DIRにforcepser.exeがフォルダを指定("""で囲う)(フォルダ名の最後に"\"は付けないこと)
@rem この.batを実行

@rem 注意
@rem AviUtlのプロジェクトファイルと、かんしくんのsetting.txt、このバッチファイルは
@rem 同一のフォルダに格納されていることを想定しています。
@rem 構成が違う場合は、各自で対応をお願いします。
@rem その際に発生した問題に関しては自己責任でお願いします。

@echo off
setlocal ENABLEDELAYEDEXPANSION

title Forcepser Assist

set SCRIPT_VER=1.1.0


@rem パス指定
set AVIUTL_DIR="""aviutl.exeのあるフォルダ"""
set PROJECT_FILE="""aviutlのプロジェクトのファイル名"""
set FORCEPSER_DIR="""forcepser.exeのあるフォルダ"""



set DD_PROJECT_FILE=""
set DD_SETTING_FILE=""
@rem 変数解析
if "%~x1" neq "" (
    if "%~x1" equ ".aup" (
        set DD_PROJECT_FILE="%~1"
    ) else (
        set DD_SETTING_FILE="%~1"
    )

    if "%~x2" neq "" (
        if "%~x2" equ ".aup" (
            set DD_PROJECT_FILE="%~2"
            if !DD_SETTING_FILE! equ "" (
                call :SHOW_MSG "settingファイルがありません" vbCritical "エラー" "modal"
                exit
            )
        ) else (
            set DD_SETTING_FILE="%~2"
            if !DD_PROJECT_FILE! equ "" (
                call :SHOW_MSG "プロジェクトファイルがありません" vbCritical "エラー" "modal"
                exit
            )
        )
    )
)


set PROJECT_DIR_PRE=%~dp0
set PROJECT_DIR_PRE=!PROJECT_DIR_PRE:~0,-1!
set PROJECT_DIR="""%PROJECT_DIR_PRE%"""


if %DD_PROJECT_FILE% neq "" (
    set PROJECT_FILE=%DD_PROJECT_FILE%
) else (
    set PROJECT_FILE=%PROJECT_FILE%.aup
)

if %DD_SETTING_FILE% neq "" (
    set SETTING_FILE=%DD_SETTING_FILE%
) else (
    set SETTING_FILE=""
    copy /y %PROJECT_DIR%\setting.txt %FORCEPSER_DIR%
)


start %AVIUTL_DIR%\aviutl.exe %PROJECT_FILE%

cd /d %FORCEPSER_DIR%
forcepser.exe !SETTING_FILE!

exit


@rem 以下、サブルーチン

@rem メッセージボックスを表示する
@rem %1-表示テキスト %2-メッセージアイコン(VB) %3-タイトル %4-モーダル設定("modal"でモーダル表示,""で非モーダル表示)
:SHOW_MSG
    if %4=="modal" (
        set MSG_MODAL=vbSystemModal
    ) else (
        set MSG_MODAL=0
    )
    echo msgbox %1,%2  Or %MSG_MODAL%,%3 > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
    del %TEMP%\msgbox.vbs
exit /b

@rem リリースノート
@rem 2019/8/18 (v1.1.0)
@rem     プロジェクトファイルをD&Dでも行えるように変更
@rem     バッチ実行時のドライブレターとcd先のドライブレターが違う場合にかんしくんが起動しないのを修正
@rem 2019/8/12 (v1.0.0)
@rem     初回リリース
