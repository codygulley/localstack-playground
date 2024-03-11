export AWS_DEFAULT_REGION=us-east-1

function logTitle {
  echo "===================="
  echo "$1"
  echo "===================="
}

DIR=$(dirname "$0")
OUTPUT_FILE='output.txt'
logTitle "SETTING UP INFRASTRUCTURE"
./"$DIR"/setup.sh $OUTPUT_FILE
logTitle "TRIGGERING LAMBDA FUNCTION"
./"$DIR"/trigger.sh $OUTPUT_FILE
logTitle "TEARING DOWN INFRASTRUCTURE"
./"$DIR"/teardown.sh $OUTPUT_FILE
