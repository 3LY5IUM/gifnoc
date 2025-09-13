ps -Arc -o %cpu,comm | sort -nr | head -n1 | awk '{print $2}'
