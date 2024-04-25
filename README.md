# Rock, Paper, Scissors, Lizard, Spock
Rock-paper-scissors-lizard-Spock is an expansion of the classic game rock-paper-scissors. The game was invented by Sam Kass, but popularized in this clip from the TV show Big Bang Theory (https://youtu.be/x5Q6-wMx-K8).
![image](https://github.com/jquach-law/RPSLS/assets/77076894/805769ac-f961-4ffe-a1b3-4e5bff2e6f89)


## Players
There are 5 players in the game. Two players are chosen at a time for a 1v1 showdown.

(1) StupidBot - plays 'Rock' only

(2) RandomBot - randomly plays one of the five moves

(3) IterativeBot - start with one move then cycle through the other moves, repeat

(4) LastPlayBot - plays the opponent's last move

(5) Human - asks for human input move

## Running & Testing
In the 'tests' directory, the .in and .out files represent expected input and output respectively.

The following code runs the program with the inputs from t11.in:
```bash
ruby RPSLS.rb < ./tests/t11.in
```
The output should be the same as what is in t11.out
