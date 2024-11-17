## Server Performance Stats

This script is used to get the server performance stats such as CPU usage, Memory usage, Disk usage, Load Average, and top 5 processes by CPU and Memory usage.

### Getting Started

#### Installation
```bash
$ curl -s https://raw.githubusercontent.com/faridlamaul/server-performance-stats/main/install.sh | sudo bash
```

#### Usage
```bash
$ server-stats
```

#### Example Output
```
  Server Stats
  ---------------------------------
  Hostname: HOSTNAME
  OS Version: OS_VERSION
  Uptime: 325 days,
  Login Users: USER
  ---------------------------------
  CPU Usage: 56.70%
  Memory Usage: 64.86%
  Disk Usage: 43
  Load Average: 0.22, 0.25, 0.27
  ---------------------------------
  Top 5 Processes by CPU Usage
  ---------------------------------
      PID    PPID CMD                         %MEM %CPU
  3203507 3203495 /agent                       1.3  5.0
  3203566    1530 docker-untar / /var/lib/doc  2.6  5.0
  3203495 3203473 /sbin/docker-init -- /agent  0.0  3.0
    1530       1 /usr/bin/dockerd -H fd:// -   3.3  1.3
  3203473      1 /usr/bin/containerd-shim-ru   0.8  1.0
  ---------------------------------
  Top 5 Processes by Memory Usage
  ---------------------------------
      PID    PPID CMD                         %MEM %CPU
  3974346 3973042 nginx: worker process        7.0  0.0
  3974347 3973042 nginx: worker process        6.8  0.0
  3926835 3911293 /opt/microsoft/mdatp/sbin/w  5.7  0.0
  3911293       1 /opt/microsoft/mdatp/sbin/w  5.3  0.6
  839030        1 /usr/bin/telegraf -config /  4.6  0.1
```

This project is part of [Roadmap.sh](https://roadmap.sh/projects/server-stats) which is a community-driven project that aims to help developers to choose the right path in the software development field.