Usage:
1. update PASSWORD and SSH_PORT in env.sh
2. setup systemd user service:

     ./setup-service.sh

3. configure your X2Go client to start using "Published applications".
4. start X applications after connecting a client session.
   Example:

     DISPLAY=:50 virtualbox

   DISPLAY number will increase after closing client session.
~  Try 51, 52, etc.
