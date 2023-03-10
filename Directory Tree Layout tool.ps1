$ConfirmChoice = $null
[int]$DaIndex = 0
$UserOptions = @()



###YOU MUST FILL OUT THE HOME DIRECTORY. This program is only going to check this file path. It is currently left blank###
$HomeDirectory = 


$UserOptions = get-childitem $HomeDirectory -Directory
$DaChoice = $null
$date = get-date -Format "MM.dd.yyyy HH.mm.ss"
$date = "DirectoryTreeLayout " + $date


Write-Host """
  _____  _               _                                                    
 |  __ \(_)             | |                                                   
 | |  | |_ _ __ ___  ___| |_ ___  _ __ _   _                                  
 | |  | | | '__/ _ \/ __| __/ _ \| '__| | | |                                 
 | |__| | | | |  __/ (__| || (_) | |  | |_| |                                 
 |_____/|_|_|  \___|\___|\__\___/|_|   \__, |        _     _______          _ 
 |__   __|            | |               __/ |       | |   |__   __|        | |
    | |_ __ ___  ___  | |     __ _ _   |___/_  _   _| |_     | | ___   ___ | |
    | | '__/ _ \/ _ \ | |    / _`  | | | |/ _ \| | | | __|    | |/ _ \ / _ \| |
    | | | |  __/  __/ | |___| (_| | |_| | (_) | |_| | |_     | | (_) | (_) | |
    |_|_|  \___|\___| |______\__,_|\__, |\___/ \__,_|\__|    |_|\___/ \___/|_|
                                    __/ |                                     
                                   |___/                                      """
Write-Host "By Cody Smith`n`n"

Write-Host """Welcome to the Directory Tree Layout tool. This program is a user 
friendly version of the powershell cmdley Get-Childitem. Get-Childitem gets the 
items in one or more specified locations. If the item is a container (Folder), 
it gets the items inside the container, known as child items 

This tool will create a text file called DirectoryTreeLayout with the time and date on it
This file will autosave where this command was ran from. Finally, this tool will 
automatically open the file for review.

To use this tool please enter the number for the directory you would like a report on.`n`n"""



	Foreach ($Option in $UserOptions) {
    	Write-Host "Press $DaIndex for $Option"
		$DaIndex += 1
	} 


while( $ConfirmChoice -ne 'y' ){
    $DaChoice = Read-Host -Prompt "`n`nplease enter the number for the directory you would like a report on."
    

    if(!($DaChoice -match "^\d+$") ){
        Write-Warning "$DaChoice is not a valid number. Please enter one of the number above."
        continue
        }

    if($DaChoice -gt ($UserOptions.length - 1)){
        Write-Warning "$DaChoice is not an avalible option. Please enter one of the numbers above "
        continue
        }
       

    $ConfirmChoice = Read-Host -Prompt "The directory you want a report on is ""$($UserOptions[$DaChoice]) ""Is this correct? (y/n)"
    }

$FinalFile = $HomeDirectory+'\'+$UserOptions[$DaChoice]
Get-ChildItem $FinalFile -Recurse | Out-File -FilePath "$HomeDirectory\$date.txt" -Force
Invoke-Item "$HomeDirectory\$date.txt"

Read-Host -Prompt "`n`nThe program has finished. The file is called .\$date.txt. Please press enter to close this window."
