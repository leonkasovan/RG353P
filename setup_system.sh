wget https://raw.githubusercontent.com/leonkasovan/RG353P/main/pacman.conf -o /etc/pacman.conf
#wget https://raw.githubusercontent.com/leonkasovan/RG353P/main/inittab -o /etc/inittab
wget https://raw.githubusercontent.com/leonkasovan/RG353P/main/terminal_setup.sh -o /etc/profile.d/terminal_setup.sh
wget https://raw.githubusercontent.com/leonkasovan/RG353P/main/multimedia_keys.conf -o /etc/triggerhappy/triggers.d/multimedia_keys.conf
cp /etc/triggerhappy/triggers.d/multimedia_keys.conf /etc/triggerhappy/triggers.d/multimedia_keys_disabled.conf
anbernic-save-overlay
