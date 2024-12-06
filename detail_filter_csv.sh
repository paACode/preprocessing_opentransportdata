#!/bin/bash
 
csv_file="filtered_rows.csv"

grep "IR15\|IR27\|IR70\|IR75" "$csv_file" > filtered_IRs.csv 
