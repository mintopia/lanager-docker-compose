#!/usr/bin/env bash

# Create the database structure
docker exec -it lanager_app php artisan migrate:fresh --force

# Fill the database with the required base data
docker exec -it lanager_app php artisan db:seed --force --class=Database\\Seeders\\DatabaseSeeder

# Import Steam apps data from CSV file
docker exec -it lanager_app php artisan lanager:import-steam-apps-csv
