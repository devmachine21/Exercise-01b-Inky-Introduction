/*
Note: This took about an hour to code

I got bored so I started reading the *entire* documentation for inky, very interesting

To note, learned that this languge does NOT support the use of spaces in list

I could not write "Teddy Bear" as a toy, it had to be "Bear" or "Teddy", very >:(

but anyways that was, fairly easy. (Though learning another programming language always comes with its challenges

to quote me, "20% of programming is learning how to program, as theres a lot of overlap between languages, the other 80% is learning the special autistic way each programming language wants to do the exact same thing, also known as its syntax"

Anyways, this little "interactive story/game" is random for each playthrough, the
toy and location of the toy are randomized, while there are only 4 places, I think it is a good starting point for my start in overcomplicating!

Did I ever mention I want to learn networking? Yeah and Ill probably be bored enough
to learn it.

Anyways, enjoy the project.

*/


// Setup Variables
VAR foundToy = false

VAR timeTaken = 0

// Create a random list of toys
LIST toyList = (Blanket),(Bear),(Train),(Plushy),(Toy),(Pilow),(Tablet),(Pen),(Backpack),(Brick),(Towel)
VAR toyName = Blanket 

~ toyName = LIST_RANDOM(toyList)

VAR turnOnBasementLight = true

VAR toyPosition = 0
~ toyPosition = RANDOM(1,4)

// Start game
Your in your house looking for your lost {toyName}

-> game_loop
=== game_loop ===
// If you found your toy, end the game!
{ foundToy:
 -> found_toy
}
Where do you look {timeTaken == 0: first?}
~ timeTaken++ 
+ [Living Room]
-> living_room
+ [Kitchen]
-> kitchen
+ [Entrance]
-> basement
+ [Your Bedroom]
-> bedroom


= living_room
    You look for your {toyName} in the living room...
    
    {You look under the couch|You look between the couch|You look behind the chair|You look behind the TV|You tried looking everywhere in the living room}
    { toyPosition == 0:
        You found your {toyName}!
        ~ foundToy = true
    - else:
        {You couldnt find your {toyName}|But could still not find your {toyName} here}
    }
    -> game_loop
= kitchen
    You look for your {toyName} in the kitchen...
    
    {You look through some of the pots and pans|You look between the cabinets|You look underneath the chairs|You try looking through the entire kitchen}
    { toyPosition == 1:
        You found your {toyName}!
        ~ foundToy = true
    - else:
        {You couldnt find your {toyName} here|but could still not find your {toyName} here}
    }
    -> game_loop
= basement
    You look for your {toyName} in the basement...
    
    { turnOnBasementLight: 
        The basement lights are off, so you turn them on
        ~turnOnBasementLight = false
    }
    
    {You look inside some old boxes|You look around the staircase|You look around your entertainment system|You look everywhere around the basement}
    { toyPosition == 2:
        You found your {toyName}!
        ~ foundToy = true
    - else:
        {You couldnt find your {toyName} here |but could still not find your {toyName} here}
    }
     -> game_loop
= bedroom
    You look for your {toyName} in the bedroom...
    
    {You look underneath your bed|You look in your closet|You look inside of your desk|You look inside of your drawers|You look everywhere around your bedroom}
    { toyPosition == 3:
        You found your {toyName}!
        ~ foundToy = true
    - else:
        {You couldnt find your {toyName} here|but could still not find your {toyName} here}
    }
     -> game_loop

-> game_loop

== found_toy ===
You found your {toyName}! You feel very happy! 

// Extra Dialog if you get it done really fast.
{ timeTaken <= 2:
    You found that very quickly!
}
-> END
