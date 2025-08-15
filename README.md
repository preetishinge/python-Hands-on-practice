# python-Hands-on practice

Q1: Import and Use os Module
Task: Write a script to print the current working directory using the os module.

import os

# Get and print the current working directory
current_directory = os.getcwd()
print("Current Working Directory:", current_directory)

Q2: Check if a Path is a File or Directory
Task: Given a path, determine if it is a file or a directory.
import os

# Input: Replace this with any path you want to check
path = input("Enter the path: ")

# Check if it's a file
if os.path.isfile(path):
    print(f"The path '{path}' is a file.")

# Check if it's a directory
elif os.path.isdir(path):
    print(f"The path '{path}' is a directory.")

# If it's neither
else:
    print(f"The path '{path}' does not exist or is neither a file nor a directory.")


Q3: Create a Directory (if not exists)
Task: Write a script that creates a new folder called test_folder in the current working directory if it doesn't already exist.
import os

# Folder name to create
folder_name = "test_folder"

# Get the full path for the new folder
folder_path = os.path.join(os.getcwd(), folder_name)

# Check if folder already exists
if not os.path.exists(folder_path):
    os.makedirs(folder_path)
    print(f"'{folder_name}' has been created at: {folder_path}")
else:
    print(f"'{folder_name}' already exists at: {folder_path}")


Q4: Loop Through Files and Filter by Extension
Task: List only .txt files in the current directory.
import os

# Get current working directory
current_dir = os.getcwd()

print("Listing all .txt files in:", current_dir)

# Loop through items in the directory
for file in os.listdir(current_dir):
    # Check if the item is a file and ends with .txt
    if os.path.isfile(file) and file.endswith(".txt"):
        print(file)

Q5: use the above concepts to complete the below task
Task: Write a Python script that does the following:

Checks if a directory called reports exists in the current working directory.

If it doesn't, create it.

List all .txt files in the current working directory (not subdirectories).

For each .txt file found:

Print the filename.

Move it into the reports directory.

import os
import shutil

# Step 1: Define the reports directory path
current_dir = os.getcwd()
reports_dir = os.path.join(current_dir, "reports")

# Step 2: Check if 'reports' directory exists; if not, create it
if not os.path.exists(reports_dir):
    os.makedirs(reports_dir)
    print(f"'reports' directory created at: {reports_dir}")
else:
    print(f"'reports' directory already exists at: {reports_dir}")

print("\nListing and moving .txt files:\n")

# Step 3: Loop through items in current directory
for file in os.listdir(current_dir):
    file_path = os.path.join(current_dir, file)

    # Step 4: Check if it's a .txt file
    if os.path.isfile(file_path) and file.endswith(".txt"):
        print(f"Found: {file}")
        
        # Step 5: Move the file to the reports directory
        destination = os.path.join(reports_dir, file)
        shutil.move(file_path, destination)
        print(f"Moved '{file}' to 'reports/'\n")

