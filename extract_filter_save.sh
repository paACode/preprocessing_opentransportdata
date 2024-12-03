folder_path="downloads"
output_file="filtered_rows.csv"

# Loop through all zip files in the specified folder
for zip_file in "$folder_path"/*.zip; do
    # Extract the zip file to a temporary folder
    unzip -q "$zip_file" -d temp_folder

    # Loop through all CSV files in the extracted folder
    for csv_file in temp_folder/*.csv; do
        # Filter rows containing the keyword "zug" and append to the output file
        grep -i "Zug" "$csv_file" >> "$output_file"
    done

    # Clean up the extracted files for the next iteration
    rm -rf temp_folder
done

echo "Filtered rows have been saved to $output_file."


