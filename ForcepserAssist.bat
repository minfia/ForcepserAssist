@rem Forcepser Assist Script by minfia

@rem Forcepser Assist Script�͖��ۏ؂Œ񋟂���܂��B
@rem ���̃v���O�������g�p�������Ŕ��������S�Ă̑��Q�ɂ��ĕۏ؂��܂���B

@rem ��邱��
@rem ���񂵂���Ŏg�p����setting.txt�����񂵂���t�H���_�ɃR�s�[
@rem ���񂵂���̋N����AviUtl�̃v���W�F�N�g���J��

@rem �g����
@rem AVIUTL_DIR��aviutl.exe������t�H���_���w��("""�ň͂�)(�t�H���_���̍Ō��"\"�͕t���Ȃ�����)
@rem PROJECT_FILE�ɊJ������.aup�t�@�C�����w��("""�ň͂�)(�g���q�Ȃ�)
@rem FORCEPSER_DIR��forcepser.exe���t�H���_���w��("""�ň͂�)(�t�H���_���̍Ō��"\"�͕t���Ȃ�����)
@rem ����.bat�����s

@rem ����
@rem AviUtl�̃v���W�F�N�g�t�@�C���ƁA���񂵂����setting.txt�A���̃o�b�`�t�@�C����
@rem ����̃t�H���_�Ɋi�[����Ă��邱�Ƃ�z�肵�Ă��܂��B
@rem �\�����Ⴄ�ꍇ�́A�e���őΉ������肢���܂��B
@rem ���̍ۂɔ����������Ɋւ��Ă͎��ȐӔC�ł��肢���܂��B

@echo off
setlocal ENABLEDELAYEDEXPANSION

title Forcepser Assist

set SCRIPT_VER=1.0.0


@rem �p�X�w��
set AVIUTL_DIR="""aviutl.exe�̂���t�H���_"""
set PROJECT_FILE="""aviutl�̃v���W�F�N�g�̃t�@�C����"""
set FORCEPSER_DIR="""forcepser.exe�̂���t�H���_"""



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


@rem �����[�X�m�[�g
@rem 2019/8/12 (v1.0.0)
@rem     ���񃊃��[�X
