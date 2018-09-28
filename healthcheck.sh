# !/bin/sh

wget -q -O - http://127.0.0.1:9222/json/list || exit 1

[[ "$?" == "[  ]" ]] || exit 1

exit 0