*** Test Cases ***
IF ELSE condition
    [Documentation]    
    ...    My student grade
    ...    >=80 > = A
    ...    70 - 79 = B
    ...    60 - 69 = C
    ...    50 - 59 = D
    ...    50< = F
    @{student grades} =     Create List    23    67    80    99
    FOR    ${grade}    IN    @{student grades}
        Log    ${grade}
        # Log student grade based on score    ${grade}
        ${actual grade} =    Get student grade based on score    ${grade}
        Log    ${actual grade}
    END
        
*** Keywords ***
Get student grade based on score
    [Arguments]    ${score}
    [Return]    ${grade}
    ${grade} =    Set Variable    F
    ${grade} =    Set Variable If    ${score} >= 80    A    ${grade}
    ${grade} =    Set Variable If    70 <= ${score} <= 79    B    ${grade}
    ${grade} =    Set Variable If    60 <= ${score} <= 69    C    ${grade}
    ${grade} =    Set Variable If    50 <= ${score} <= 59    D    ${grade}
    ${grade} =    Set Variable If    ${score} < 50    F    ${grade}
    
        
Log student grade based on score
    [Arguments]    ${score}
   Run Keyword If    ${score} >= 80    Log    A
        ...    ELSE IF    70 <= ${score} <= 79    Log    B
        ...    ELSE IF    60 <= ${score} <= 69    Log    C
        ...    ELSE IF    50 <= ${score} <= 59    Log    D
        ...    ELSE    Log    F        
