#!/bin/bash
#
# InstaladorDeDesktop.sh
# Versão: 0.1.5
# Data de criação: 20/05/2018
# Data de atualização: 03/06/2018
#
# Autor: VitorLeSantos <github.com/VitorLeSantos>
#
# Fork: Manuel rosa <acorosalinux@gmail.com>
#
# Descrição: Instalador de ambientes desktop
#               -> XFCE,
#               -> Lxde,
#               -> KDE,
#               -> Cinnamon,
#               -> Gnome,
#               -> Mate,
#               -> Budgie
#
# Dependencias:
#   dialog 1.3
#
# Licensa:
#
# Notas da versão 0.1.4 por <VitorLesantos>:
#   Foi corrigido a função menu.
# Notas da versão 0.1.5 por <VitorLeSantos>:
#   Adicionado a a permissão de root
#   Novas implentações para interface grafica em modo texto
#   Utilizando dialog para criação do TUI(Terminal User Interface)
#       Novo menu de exibição
#       Nova exibição de menssagens
#   Removido a função pause()
#


## Declaração de Variaveis
SCRIPT_PID=$$;		            # Cria um ID
SCRIPT_NAMEID=`basename $0`; 	# Captura o nome do script ex: script.sh captura somente o "script"
ROOTID=$(id -u);
## Declaração de funções

function message(){
    local message="$@"
    dialog --infobox "${message}" 3 35
}

############################### TUI ##################################
function menuTUI(){
    interface=$(dialog --ok-label 'Instalar' \
    --cancel-label 'Sair' \
    --clear \
    --stdout \
    --menu 'Instalador de interfaces' 0 0 7 \
    Mate_Desktop ' ' \
    Budgie_Desktop ' ' \
    LxQt ' ' \
    XFCE ' ' \
    KDE_Plasma ' ' \
    KDE_Standard ' ' \
    KDE_full ' ' \
    Gnome ' ' \
    Cinnamon ' ' \
    Lxde ' ' \
    Openbox ' ');

    # Se for 0 é igual a instalar
    if [ $? = 0 ];  then
        case $interface in
            Mate_Desktop)   mateinstall         ;;
            Budgie_Desktop) budgieinstall       ;;
            LxQt)           lxqtinstall         ;;
            XFCE)           xfceinstall         ;;
            KDE_Plasma)     plasmainstall       ;;
            KDE_Standard)   kde-standardinstall ;;
            KDE_full)       kde-fullinstall     ;;
            Gnome)          gnomeinstall        ;;
            Cinnamon)       cinnamoninstall     ;;
            Lxde)           lxdeinstall         ;;
            Openbox)        openboxinstall      ;;
            *)
                dialog --infobox 'Opção Invalida' 3 20
                msg="Pressione [Enter] para continuar..."
                read -p "$msg" readEnterKey
                menuTUI
            ;;
        esac
    else
        message "Saindo em 3. 2. 1.. by bye";
        sleep 1;
    fi

}
############################### TUI ##################################

#####################################################################
## Funções para instalação de DE
# Exemplo para criação de função para instalação de DE
#
# function NOMEDADEinstall(){
#   message "Instalando DE NOME"
#   DE='Pacotes a ser instalados'
#   sudo apt install $DE -y
#}
#####################################################################

function mateinstall(){

    message "Instalando Mate Desktop"

    MATE="mate-core mate-desktop mate-desktop-environment mate-desktop-environment-core \
    mate-desktop-environment-extras mate-desktop-environment-extra \
	caja-open-terminal  caja-dropbox caja-admin caja-image-converter caja-share caja-wallpaper \
	mate-applet-brisk-menu mate-applets mate-dock-applet mate-backgrounds mate-hud mate-tweak \
    tilda pluma network-manager-gnome lightdm lightdm-gtk-greeter lightdm-settings slick-greeter"
	sudo apt install $MATE -y;

}

function xfceinstall(){

    message "Instalando XFCE Desktop"

    XFCE="xfce4 xfce4-goodies \
    lightdm lightdm-gtk-greeter lightdm-settings slick-greeter \
    xscreensaver xscreensaver-data-extra xscreensaver-gl \
    xscreensaver-gl-extra menulibre mugshot accountsservice \
    gnome-calculator gnome-system-tools lightdm \
    network-manager-gnome system-config-printer \
    lightdm-gtk-greeter lightdm-settings slick-greeter"
    sudo apt install $XFCE -y;

}

function budgieinstall(){
    message "Instalando Budgie Desktop"
    BUDGIE="budgie-core budgie-desktop nautilus gdm3"
    sudo apt install $BUDGIE -y;
}

function cinnamoninstall(){
    message "Instalando Cinnamon Desktop"
    CINNAMON="cinnamon-core cinnamon \
    network-manager-gnome \
    lightdm lightdm-gtk-greeter lightdm-settings slick-greeter"
    sudo apt install $CINNAMON -y;
}

function plasmainstall(){
    message "Instalando Plasma Desktop"
    PLASMA="kde-plasma-desktop konsole dolphin sddm kmenuedit \
    dolphin-plugins qtcurve qtcurve-l10n sddm-theme-breeze \
    sddm-theme-debian-breeze systemsettings gtk3-engines-breeze kate \
    kde-config-flash-player kde-config-gtk-style kde-config-screenlocker \
    kde-config-sddm kde-config-touchpad kde-config-screenlocker \
    kde-runtime kcalc ark cups-bsd cups-client cups-common \
     "
    sudo apt install $PLASMA -y;
}

function kde-standardinstall(){
    message "Instalando Kde-Standard"
    KDE-STANDARD="kde-standard dolphin sddm \
    dolphin-plugins qtcurve qtcurve-l10n sddm-theme-breeze \
    sddm-theme-debian-breeze "
    sudo apt install $KDE-STANDARD -y;
}

function kde-fullinstall(){
    message "Instalando Kde-full"
    KDE-FULL="kde-full "
    sudo apt install $KDE-FULL -y;
}

function gnomeinstall(){
    message "Instalando Gnome Desktop"
    GNOME="gnome gdm3 \
    alacarte gnome-software-plugin-flatpak \
    gnome-software-plugin-limba \
    gnome-software-plugin-snap \
    gnome-packagekit-session \
    gnome-packagekit fwupd \
    gnome-tweak-tool ";
    sudo apt install $GNOME -y;
}

function lxqtinstall(){
    message "Instalando LXQT Desktop"
    LXQT="lxqt-core lxqt \
    lightdm lightdm-gtk-greeter lightdm-settings slick-greeter "
    sudo apt install $LXQT -y
}

function lxdeinstall(){
	message "Instalando Lxde Desktop"
	LXDE="lxde lxterminal galculator lightdm \
    lightdm-gtk-greeter lightdm-settings slick-greeter \
    xscreensaver xscreensaver-data-extra xscreensaver-gl \
    xscreensaver-gl-extra  gnome-system-tools \
    system-config-printer network-manager-gnome "
    sudo apt install $LXDE -y
}

function openboxinstall(){
	message "Instalando Openbox Desktop"
	OPENBOX="openbox galculator obmenu obconf \
    openbox-menu tint2 nitrogen lxappearance lxinput \
    lxrandr lxterminal thunar lightdm tilda
    lightdm-gtk-greeter lightdm-settings slick-greeter \
    xscreensaver xscreensaver-data-extra xscreensaver-gl \
    xscreensaver-gl-extra  gnome-system-tools \
    system-config-printer network-manager-gnome "
    sudo apt install $OPENBOX -y
}
##################################
# Verificação se é root ou não   #
##################################
function isroot(){
    if [[ $ROOTID -ne 0 ]]; then
        echo "
        Voce precisa execultar como root.
        Assim: sudo ./${SCRIPT_NAMEID}
        " 2>&1
        exit 1
    else
        menuTUI
    fi
}

isroot
