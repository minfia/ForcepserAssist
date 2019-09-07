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

set SCRIPT_VER=1.1.0


@rem �p�X�w��
set AVIUTL_DIR="""aviutl.exe�̂���t�H���_"""
set PROJECT_FILE="""aviutl�̃v���W�F�N�g�̃t�@�C����"""
set FORCEPSER_DIR="""forcepser.exe�̂���t�H���_"""



set DD_PROJECT_FILE=""
set DD_SETTING_FILE=""
@rem �ϐ����
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
                call :SHOW_MSG "setting�t�@�C��������܂���" vbCritical "�G���[" "modal"
                exit
            )
        ) else (
            set DD_SETTING_FILE="%~2"
            if !DD_PROJECT_FILE! equ "" (
                call :SHOW_MSG "�v���W�F�N�g�t�@�C��������܂���" vbCritical "�G���[" "modal"
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


@rem �ȉ��A�T�u���[�`��

@rem ���b�Z�[�W�{�b�N�X��\������
@rem %1-�\���e�L�X�g %2-���b�Z�[�W�A�C�R��(VB) %3-�^�C�g�� %4-���[�_���ݒ�("modal"�Ń��[�_���\��,""�Ŕ񃂁[�_���\��)
:SHOW_MSG
    if %4=="modal" (
        set MSG_MODAL=vbSystemModal
    ) else (
        set MSG_MODAL=0
    )
    echo msgbox %1,%2  Or %MSG_MODAL%,%3 > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
    del %TEMP%\msgbox.vbs
exit /b

@rem �����[�X�m�[�g
@rem 2019/8/18 (v1.1.0)
@rem     �v���W�F�N�g�t�@�C����D&D�ł��s����悤�ɕύX
@rem     �o�b�`���s���̃h���C�u���^�[��cd��̃h���C�u���^�[���Ⴄ�ꍇ�ɂ��񂵂��񂪋N�����Ȃ��̂��C��
@rem 2019/8/12 (v1.0.0)
@rem     ���񃊃��[�X
