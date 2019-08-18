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

set SCRIPT_VER=1.0.0


@rem パス指定
set AVIUTL_DIR="""aviutl.exeのあるフォルダ"""
set PROJECT_FILE="""aviutlのプロジェクトのファイル名"""
set FORCEPSER_DIR="""forcepser.exeのあるフォルダ"""



set DD_PROJECT_FILE="%~1"
if %DD_PROJECT_FILE% neq "" (
    set PROJECT_FILE=""%DD_PROJECT_FILE%""
) else (
    set PROJECT_FILE=%PROJECT_FILE%.aup
)

set PROJECT_DIR_PRE=%~dp0
set PROJECT_DIR_PRE=!PROJECT_DIR_PRE:~0,-1!
set PROJECT_DIR="""%PROJECT_DIR_PRE%"""

copy /y %PROJECT_DIR%\setting.txt %FORCEPSER_DIR%

start %AVIUTL_DIR%\aviutl.exe %PROJECT_FILE%


cd /d %FORCEPSER_DIR%
forcepser.exe


@rem リリースノート
@rem 2019/8/12 (v1.0.0)
@rem     初回リリース
