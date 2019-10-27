*** Test Cases ***
Demo Scalar
    [Documention}
    ...    This test case for Demo Scalar
    ...    Try to set varaible
    ${username}    set Variable    ทราย
    ${surname}    BuiltIn.set Variable    Sai
    Log    Hello ${username} and ${surname}
    Log    Hi ${username}
    ${nickname}    set Variable    Mr }
    
Demo List
    @{product names}    Create List    Iphone11    Android 12    Window phone
    Log Many    @{product names}
    Log    ${product names[1]}
    
Demo Dictionary
    &{user1}    Create Dictionary    username=john    password=welcome1
    &{user2}    Create Dictionary    username=mary    password=welcome2
    Log    ${user1.username}
    Log    ${user2.password}
    
Demo set keywors
    ${hi} =    Set Variable Hello, world!
    ${hi2} =     Set Variable I said: ${hi}
    ${var1} ${var2} = Set Variable Hello world
    @{list} = Set Variable ${list with some items}
    ${item1} ${item2} = Set Variable ${list with 2 items}
