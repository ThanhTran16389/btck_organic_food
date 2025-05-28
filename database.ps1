$envContent = Get-Content -Path .env
$DB_HOST = ($envContent | Where-Object { $_ -match '^DB_HOST=' } | ForEach-Object { $_ -replace '^DB_HOST=', '' })
$DB_PORT = ($envContent | Where-Object { $_ -match '^DB_PORT=' } | ForEach-Object { $_ -replace '^DB_PORT=', '' })
$DB_USERNAME = ($envContent | Where-Object { $_ -match '^DB_USERNAME=' } | ForEach-Object { $_ -replace '^DB_USERNAME=', '' })
$DB_PASSWORD = ($envContent | Where-Object { $_ -match '^DB_PASSWORD=' } | ForEach-Object { $_ -replace '^DB_PASSWORD=', '' })
$DB_NAME = ($envContent | Where-Object { $_ -match '^DB_DATABASE=' } | ForEach-Object { $_ -replace '^DB_DATABASE=', '' })

# Nhập file SQL qua cmd
if ($DB_PASSWORD) {
    cmd /c "C:\xampp\mysql\bin\mysql.exe -h $DB_HOST -P $DB_PORT -u $DB_USERNAME -p$DB_PASSWORD $DB_NAME < database\scripts\basicdatabase.sql"
} else {
    cmd /c "C:\xampp\mysql\bin\mysql.exe -h $DB_HOST -P $DB_PORT -u $DB_USERNAME $DB_NAME < database\scripts\basicdatabase.sql"
}