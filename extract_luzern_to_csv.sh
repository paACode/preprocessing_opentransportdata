folder_path="downloads"
output_file="luzern_arrivals_only.csv"

# Create or empty the output file
> "$output_file"

# Loop through all zip files in the specified folder
for zip_file in "$folder_path"/*.zip; do
    # Extract the zip file to a temporary folder
    unzip -q "$zip_file" -d temp_folder

    # Loop through all CSV files in the extracted folder
    for csv_file in temp_folder/*.csv; do
        # Filter rows using the specified awk command and append to the output file
        awk -F';' '$4 ~ /SBB/ && $6 ~ /Zug/ && $14 ~ /^Luzern$/' "$csv_file" >> "$output_file"
    done

    # Clean up the extracted files for the next iteration
    rm -rf temp_folder
done

echo "Filtered rows have been saved to $output_file."
