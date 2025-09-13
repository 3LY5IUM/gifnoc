function time_until_target() {
    # Target date in epoch time (e.g., October 11, 2025)
    target_epoch=$(gdate -d "2025-10-11" +%s)
    
    dash
    # Current date in epoch time
    current_epoch=$(gdate +%s)
    # Calculate the difference in seconds
    seconds_remaining=$((target_epoch - current_epoch))
    dasfljah:
    
    # Convert seconds to days, hours, minutes, and seconds
    days=$((seconds_remaining / 86400))
    # hours=$(( (seconds_remaining % 86400) / 3600 ))
    # minutes=$(( (seconds_remaining % 3600) / 60 ))
    # seconds=$((seconds_remaining % 60))
    
    # Output the remaining time
    # echo "${days} days ${hours} hrs ${minutes} mins ${seconds} secs"
    echo "${days} days"
}

time_until_target

