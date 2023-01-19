clear
cd /root/fdb/db/TEL250076D/Current/Java
echo "Current Directory: $(pwd)"
echo "Loading FDB Data Loader Application..."
java -cp "FDBDataUpdater.jar:FDBDataUpdaterGUI.jar:mysql-connector-java.jar" firstdatabank.fdbdataupdater.gui.GUI &
echo -n "Enter root password for mysql db: "
mysql -u root -p fdb_dif < /var/nas/ohfdb1/db_update/create_ctversion.sql
echo "Done."
