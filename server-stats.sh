#!/bin/sh

# Get the total CPU usage in percentage (100 - idle CPU usage)
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}' | xargs printf "%.2f")

# Get the total memory usage (Free vs Used including percentage)
memory_usage=$(free -m | grep Mem | awk '{print $3/$2 * 100.0}' | xargs printf "%.2f")

# Get the total disk usage (Free vs Used including percentage)
disk_usage=$(df -h --total | grep 'total' | awk '{print $5}' | sed 's/%//')

# Get the top 5 processes by CPU usage
top_cpu_processes=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6)

# Get the load average
load_average=$(uptime | awk -F'load average:' '{print $2}' | xargs)

# Get the top 5 processes by memory usage
top_memory_processes=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6)

# Get the OS version
os_version=$(cat /etc/os-release | grep PRETTY_NAME | cut -d "=" -f 2 | xargs)

# Get the uptime
uptime=$(uptime | awk '{print $3 " " $4}' | xargs)

# Get the hostname
hostname=$(hostname)

# Get the login users
login_users=$(who | awk '{print $1}' | sort | uniq | xargs)

# Print the server stats in a formatted layout 
print_stats() {
    echo "Server Performance Stats"
    echo "---------------------------------"
    echo "Hostname: $hostname"
    echo "OS Version: $os_version"
    echo "Uptime: $uptime"
    echo "Login Users: $login_users"
    echo "---------------------------------"
    echo "CPU Usage: $cpu_usage%"
    echo "Memory Usage: $memory_usage%"
    echo "Disk Usage: $disk_usage"
    echo "Load Average: $load_average"
    echo "---------------------------------"
    echo "Top 5 Processes by CPU Usage"
    echo "---------------------------------"
    echo "$top_cpu_processes"
    echo "---------------------------------"
    echo "Top 5 Processes by Memory Usage"
    echo "---------------------------------"
    echo "$top_memory_processes"
}

print_stats