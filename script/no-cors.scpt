(* Launches Google Chrome with web security disabled.
   This disables the same origin policy for API calls and can ease 
   development from a dev environment not in a server's CORS settings *)

(* NOTE: Chrome won't apply the flag if another instance of Chrome is already running
do shell script "open -a 'Google Chrome.app' --args --disable-web-security" *)

(* If you want to not use your current user in Chrome you can set --user-data-dir to point to /tmp
do shell script "open -a 'Google Chrome.app' --args --disable-web-security --new-window --user-data-dir=/tmp" *)

(* This same command can be sent to Canary by changing 'Google Chrome.app' to 'Google Chrome Canary.app' *)
do shell script "open -a 'Google Chrome Canary.app' --args --disable-web-security --new-window --user-data-dir=/tmp"