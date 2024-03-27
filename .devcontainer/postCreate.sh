ACT_TARBALL=act_Linux_x86_64.tar.gz
URI=https://github.com/nektos/act/releases/download/v0.2.60/$ACT_TARBALL
LOCAL_BIN=/usr/local/bin
ACT_BIN=$LOCAL_BIN/act

cd /tmp
curl -s -O -L $URI
tar -xzf $ACT_TARBALL -C $LOCAL_BIN act
chown root:root $ACT_BIN
chmod +x $ACT_BIN
rm -f $ACT_TARBALL
