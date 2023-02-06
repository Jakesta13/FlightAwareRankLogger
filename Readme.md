# FlightAware Stats Logger

Just a basic script that lets you log your stats relative to check-in duration to see how they corrilate.    
(E.g if you're noticing your trend lowering and would like to see if it is your feeder not checking in consitantly)

Right now, It's just barebones. The timing of the check should be tweaked, as I noticed feeders check-in roughly every 5 minutes. I haven't bothered yet to figure out a better timing (E.g more or less than 5 Minutes? 10 Minutes?).

## proxy.sh
What is this you may ask?    
I was having issues running this script in a `tmux` session from a contab on `@reboot`, but running a script that literally just runs the main script was enough to make it work? idk if it was just my setup, so I left it in.

## To-Do
In the future I plan on commenting the scripts so it is easier to understand.