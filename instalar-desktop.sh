#!/bin/bash
#
# Autor: VitorLeSantos <github.com/VitorLeSantos>
# Fork: Manuel rosa <acorosalinux@gmail.com>
# Descrição: Instale XFCE, Lxde, KDE, Cinnamon, Gnome, Mate, Budgie
#	     em seu sistema com um comando
#

function pause(){
    local msg="$@"
    [ -z $msg ] && msg="Pressione [Enter] para continuar..."
    read -p "$msg" readEnterKey
}

function message(){
    local message="$@"
echo -e "
\t\t┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
\t\t┃\t\t\t\t\t\t┃
\t\t┃    $message\t┃
\t\t┃\t\t\t\t\t\t┃
\t\t┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
"
}

function menu(){
clear
echo -e "

\t\t┌───────────────────────────────────────────────┐
\t\t│\t    Instalador de interfaces \t\t│
\t\t├───────────────────────────────────────────────┤
\t\t│    1 ▶ Mate Desktop\t\t\t\t│
\t\t│    2 ▶ Budgie Desktop \t\t\t│
\t\t│    3 ▶ LxQt \t\t\t\t\t│
\t\t│    4 ▶ XFCE \t\t\t\t\t│
\t\t│    5 ▶ KDE Plasma \t\t\t\t│
\t\t|    6 ▶ KDE Standard \t\t\t\t│
\t\t|    7 ▶ KDE full \t\t\t\t│
\t\t│    8 ▶ Gnome \t\t\t\t\t│
\t\t│    9 ▶ Cinnamon \t\t\t\t│
\t\t│    10 ▶ Lxde\t\t\t\t\t\t│
\t\t│    11 ▶ Openbox \t\t\t\t│
\t\t│\t\t\t\t\t\t│
\t\t└───────────────────────────────────────────────┘

"

echo -ne "\t\t\xe2\x9e\xa4";
read -p " Opção: " opt

case $opt in
    1) mateinstall ;;
    2) budgieinstall ;;
    3) lxqtinstall ;;
    4) xfceinstall ;;
    5) plasmainstall ;;
    6) kde-standardinstall ;;
    7) kde-fullinstall ;;
    8) gnomeinstall ;;
    9) cinnamoninstall ;;
    10) lxdeinstall ;;
    11) openboxinstall ;;
    *)
    	echo -ne "\n\t\t\t[Opção Invalida]  "
        msg="Pressione [Enter] para continuar..."
    	read -p "$msg" readEnterKey
    	menu
    ;;
esac
}

###########################

# Mate Desktop
function mateinstall(){

    message "\t    Instalando Mate Desktop\t"

    MATE="mate-core \
	mate-desktop \
	mate-desktop-environment \
	mate-desktop-environment-core \
	mate-desktop-environment-extras \
	mate-desktop-environment-extra \
	caja-open-terminal \
	caja-dropbox \
	caja-admin \
	caja-image-converter \
	caja-share \
	caja-wallpaper \
	mate-applet-brisk-menu \
	mate-applets \
	mate-dock-applet \
  mate-backgrounds \
	mate-hud mate-tweak \
  tilda pluma \
  network-manager-gnome \
	lightdm lightdm-gtk-greeter lightdm-settings slick-greeter"
	sudo apt install --no-install-recommends $MATE -y;

}

function xfceinstall(){

    message "\t    Instalando XFCE Desktop\t"

    XFCE="xfce4 xfce4-goodies \
    lightdm lightdm-gtk-greeter lightdm-settings slick-greeter \
    xscreensaver xscreensaver-data-extra xscreensaver-gl \
    xscreensaver-gl-extra menulibre mugshot accountsservice \
    gnome-calculator gnome-system-tools lightdm \
    network-manager-gnome system-config-printer \
    lightdm-gtk-greeter lightdm-settings slick-greeter"
    sudo apt install --no-install-recommends $XFCE -y;

}

function budgieinstall(){
    message "\t    Instalando Budgie Desktop\t"
    BUDGIE="budgie-core budgie-desktop nautilus gdm3"
    sudo apt install --no-install-recommends $BUDGIE -y;
}

function cinnamoninstall(){
message "\t   Instalando Cinnamon Desktop\t"
    CINNAMON="cinnamon-core cinnamon \
      network-manager-gnome \
      lightdm lightdm-gtk-greeter lightdm-settings slick-greeter"
    sudo apt install --no-install-recommends $CINNAMON -y;
}

function plasmainstall(){
    message "\t    Instalando Plasma Desktop\t"
    PLASMA="kde-plasma-desktop konsole dolphin sddm kmenuedit \
    dolphin-plugins qtcurve qtcurve-l10n sddm-theme-breeze \
    sddm-theme-debian-breeze systemsettings gtk3-engines-breeze kate \
    kde-config-flash-player kde-config-gtk-style kde-config-screenlocker \
    kde-config-sddm kde-config-touchpad kde-config-screenlocker \
    kde-runtime kcalc ark cups-bsd cups-client cups-common \
     "
    sudo apt install --no-install-recommends $PLASMA -y;
}

function kde-standardinstall(){
    message "\t    Instalando Kde-Standard\t"
    KDE-STANDARD="kde-standard dolphin sddm \
    dolphin-plugins qtcurve qtcurve-l10n sddm-theme-breeze \
    sddm-theme-debian-breeze "
    sudo apt install --no-install-recommends $KDE-STANDARD -y;
}

function kde-fullinstall(){
    message "\t    Instalando Kde-full\t"
    KDE-FULL="kde-full "
    sudo apt install --no-install-recommends $KDE-FULL -y;
}

function gnomeinstall(){
    message "\t    Instalando Gnome Desktop\t"
    GNOME="gnome gdm3 \
    alacarte gnome-software-plugin-flatpak \
    gnome-software-plugin-limba \
    gnome-software-plugin-snap \
    gnome-packagekit-session \
    gnome-packagekit fwupd \
    gnome-tweak-tool ";
    sudo apt install --no-install-recommends $GNOME -y;
}

function lxqtinstall(){
    message "\t    Instalando LXQT Desktop\t"
    LXQT="lxqt-core lxqt \
    lightdm lightdm-gtk-greeter lightdm-settings slick-greeter "
    sudo apt install --no-install-recommends $LXQT -y
}

function lxdeinstall(){
	  message "\t    Instalando Lxde Desktop\t"
	  LXDE="lxde lxterminal galculator lightdm \
    lightdm-gtk-greeter lightdm-settings slick-greeter \
    xscreensaver xscreensaver-data-extra xscreensaver-gl \
    xscreensaver-gl-extra  gnome-system-tools \
    system-config-printer "
    sudo apt install --no-install-recommends $LXDE -y
}

function openboxinstall(){
	  message "\t    Instalando Openbox Desktop\t"
	  OPENBOX="openbox galculator obmenu obconf \
    openbox-menu tint2 nitrogen lxappearance lxinput \
    lxrandr lxterminal thunar lightdm tilda
    lightdm-gtk-greeter lightdm-settings slick-greeter \
    xscreensaver xscreensaver-data-extra xscreensaver-gl \
    xscreensaver-gl-extra  gnome-system-tools \
    system-config-printer network-manager-gnome "
    sudo apt install --no-install-recommends $OPENBOX -y
}
menu
