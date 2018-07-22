# PCSimpleBackup
### A simple script for iterative backups on Windows

## Usage
1. Clone the repo or download as zip file using the green button at the top of the page ([https://github.com/matticoli/PCSimpleBackup])

*If downloading as a zip, right click the zip file and extract all of the contents*

2. Right-click and edit backup.bat and change the backup destination in the config section at the top of the file

3. Save the file, close notepad, and double click to run

#### Simple as That!

## Behavior
This script will use the Robocopy command on Widows to copy the entire user folder to a destination folder of your choice.

The script will ignore:
- Hidden system files
- Empty folders
- AppData folder
- Any files that are unchanged in the backup directory

This allows for fast subsequent backups for large numbers of files

#### Enjoy!