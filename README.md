# connect-four

From [The Odin Project](https://www.theodinproject.com/lessons/ruby-connect-four):

"Hopefully most people will have played Connect Four at some point. It’s a basic game where each player takes turns dropping pieces into the cage. Players win if they manage to get 4 of their pieces consecutively in a row, column, or along a diagonal.

The game rules are fairly straightforward and you’ll be building it on the command line like you did with the other games. If you want to spice up your game pieces, look up the unicode miscellaneous symbols on Wikipedia. The Ruby part of this should be well within your capability by now so it shouldn’t tax you much to think about it.

The major difference here is that you’ll be doing this TDD-style. So figure out what needs to happen, write a (failing) test for it, then write the code to make that test pass, then see if there’s anything you can do to refactor your code and make it better.

Only write exactly enough code to make your test pass. Oftentimes, you’ll end up having to write two tests in order to make a method do anything useful. That’s okay here. It may feel a bit like overkill, but that’s the point of the exercise. Your thoughts will probably be something like “Okay, I need to make this thing happen. How do I test it? Okay, wrote the test, how do I code it into Ruby? Okay, wrote the Ruby, how can I make this better?” You’ll find yourself spending a fair bit of time Googling and trying to figure out exactly how to test a particular bit of functionality. That’s also okay… You’re really learning RSpec here, not Ruby, and it takes some getting used to."

## Game Flow:

1. Board gets initialised, all cells empty. (6 rows, 7 columns)
2. Player 1 chooses a column
3. Player 1 symbol inserted in bottom empty space of chosen column
4. Player 2 chooses a column
5. Player 2 symbol inserted in bottom empty space of chosen column
6. If 4 in a row, print winner message, otherwise, back to step 2

## Tests:

Initialisation:
1. Board initialises correctly
2. Game initialises with all cells empty

Player Moves:
1. Player input validation - in range
2. Player input validation - column not full
3. Symbol falls to bottom empty space of empty row
4. Players take turns

Check Win Conditions:
1. 4 in a row correctly identified - horizontal
2. 4 in a row correctly identified - vertical
3. 4 in a row correctly identified - diagonal

End of Game:
1. Check that board has no empty cells (draw)
2. If 4 in a row, return winner message
