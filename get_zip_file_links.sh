#!/bin/bash

# URL of the webpage to search for .zip files
URL="https://opentransportdata.swiss/de/ist-daten-archiv/"


# Check if the URL is provided
if [ -z "$URL" ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Download the HTML content of the page
wget -q -O - "$URL" |

# Search for .zip files in the HTML content using grep
grep -oP 'href="([^"]+\.zip)"'|

# Extract the .zip file links (remove 'href="')
sed -e 's/href="//' -e 's/"$//'



