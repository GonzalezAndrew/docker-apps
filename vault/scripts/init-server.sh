#!/bin/sh

export VAULT_ADDR=http://127.0.0.1:8200

check_seal() {
    status=$(vault status | grep 'Initialized' | xargs | awk -F ' ' '{print $2}')
    if [ "$status" = 'true' ]; then 
        return 1
    else 
        return 0
    fi 
}

init() {
    data="$(vault operator init -key-shares=3 -key-threshold=2)"

    key_file="vault/logs/key.txt"
    echo "$data" >"$key_file"

    key1=$(sed -n 's/.* Key 1: \([^ ]*\).*/\1/p' $key_file)
    key2=$(sed -n 's/.* Key 2: \([^ ]*\).*/\1/p' $key_file)

    if ! vault operator unseal "${key1}" >/dev/null 2>&1; then
        echo "error accessing the first key, exiting... "
    fi

    if ! vault operator unseal "${key2}" >/dev/null 2>&1; then
        echo "error accessing the second key, exiting... "
    fi

}

main(){
    if check_seal; then 
        init 
    fi 
}
main 