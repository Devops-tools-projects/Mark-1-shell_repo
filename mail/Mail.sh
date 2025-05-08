# to provide aa mail notification from the system

TO="Test@gmail.com"
SUBJECT="Test mail"
BODY="to test the mail setup from unix"

echo "$BODY" | mail -s $SUBJECT $TO
