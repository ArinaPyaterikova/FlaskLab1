echo off
echo "****** ARINA DB INIT **************"
echo "****** IT TAKES TIME (~5 mins) ******"
docker compose exec lab_one mkdir /tmp/dbrestore  || (echo Error & goto :end)
docker compose cp data/. lab_one:/tmp/dbrestore  || (echo Error & goto:end)
docker compose exec lab_one psql --host=localhost --port=5432 --username=postgres --file=/tmp/dbrestore/backup_db.sql || (echo Error & goto:end)
docker compose up -d
echo "****** ARINA DB RESTORED **********"
:end
pause