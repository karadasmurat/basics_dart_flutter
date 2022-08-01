#!/bin/zsh

attempt=0
MAX_ATTEMPTS=5

#Waiting time between retries, in seconds.
MIN_WAIT_TIME=120
MAX_WAIT_TIME=180

#Loading animation phases
NUMBER_OF_PHASES=10


#$1: NUMBER_OF_PHASES ie. 5
### Modify global array named loadingIndicators
### loadingIndicators=('▮▯▯▯▯▯ ' '▮▮▯▯▯▯ ' '▮▮▮▯▯▯ ' '▮▮▮▮▯▯ ' '▮▮▮▮▮▯ ')
function createProgressIndicators() {

  currentIndicator=''
  for i in {1..$1}
  do
    for done in {1..$i}
    do
      currentIndicator+=▮
    done

    for remain in {$i..$1}
    do
        currentIndicator+=▯
    done

    # echo $currentIndicator #debugPrint
    loadingIndicators[$i]=$currentIndicator
    currentIndicator=''
  done
}

#Global array for indicator list
#loadingIndicators=('▮▯▯▯▯▯ ' '▮▮▯▯▯▯ ' '▮▮▮▯▯▯ ' '▮▮▮▮▯▯ ' '▮▮▮▮▮▯ ')
loadingIndicators=()
createProgressIndicators $NUMBER_OF_PHASES #call function with the argument

variable_time_limit=$(( $MAX_WAIT_TIME - $MIN_WAIT_TIME ))


while [[ $attempt -lt $MAX_ATTEMPTS ]]
do 
    (( attempt += 1 ))
   
    #open -a "Google Chrome" https://www.gmc-uk.org/gmc-online-dashboard 

    timeBetweenRetries=$(( $RANDOM % $variable_time_limit + $MIN_WAIT_TIME ))
    notificationInterval=$(( $timeBetweenRetries / $NUMBER_OF_PHASES ))
    echo "Shot $attempt/$MAX_ATTEMPTS - Next visit in $timeBetweenRetries seconds."

    # Inform the user - loading animation
    # for i in {1..5}
    timeSpent=0
    for i in $loadingIndicators
    do
        remainingTime=$(( $timeBetweenRetries - $timeSpent))
        echo -ne "$i $remainingTime seconds left \r"
        sleep $notificationInterval
        (( timeSpent += notificationInterval ))    
    done 

    remainingSleepTime=$(( $timeBetweenRetries - $NUMBER_OF_PHASES * $notificationInterval ))
    sleep $remainingSleepTime

done  # while

echo "Thats it for this time.."
# A non-zero (1-255) exit status indicates failure.
exit 0

