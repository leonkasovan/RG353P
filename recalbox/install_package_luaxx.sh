mount -o remount,rw /
wget https://github.com/leonkasovan/luaxx/releases/download/v5.1.5.80/linux-aarch64.luaxx.7z
7zr x linux-aarch64.luaxx.7z
cp luaxx /usr/bin/luaxx
chmod a+x /usr/bin/luaxx
echo "luaxx is ready."
