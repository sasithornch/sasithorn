*** Settings ***
Library    Dialogs    


*** Test Cases ***
Demo pause dialog
    Log    Step 1
    Dialogs.Pause Execution    Test pause
    Log    Step 2
    