
echo 1

#/usr/lib/postgresql/15/bin/postgres --single template1
#/usr/lib/postgresql/15/bin/postgres -D /var/lib/postgresql/15/main -c listen_addresses='*'
/usr/lib/postgresql/15/bin/postgres -D /var/lib/postgresql/15/main -c allow_system_table_mods=on

echo 2

