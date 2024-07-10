# Overview
This repository contains three Bash scripts:

*  Automated Test Script : Verifies the integration between frontend and backend services.
*  System Health Monitoring Script : Monitors CPU usage, memory usage, disk space, and running processes on a Linux system.
*  Log File Analyzer Script : Analyzes web server logs for common patterns such as the number of 404 errors, most requested pages, and IP addresses with the most requests.

### 1. Automated Test Script
#### Description
The automation_script.sh script verifies that the frontend service correctly displays messages returned by the backend service.
#### Usage
Ensure that the frontend and backend services are running in your _Minikube cluster._

```bash
git clone https://github.com/Simran-2000/AccuKnox_assignment/blob/main/automation_script.sh
```
```bash 
dos2unix automation_script.sh
```
```bash
 chmod +x automation_script.sh
```
```bash
 ./automation_script.sh
```
### 2. System Health Monitoring Script
#### Description
The system_health.sh script monitors the health of a Linux system by checking CPU usage, memory usage, disk space, and running processes. If any of these metrics exceed predefined thresholds (e.g., CPU usage > 80%), the script sends an alert to the console and logs it to a file.
#### Usage
```bash
 git clone https://github.com/Simran-2000/AccuKnox_assignment/blob/main/system_health.sh
```
 Make sure you update the path of the log file to yours in the script
```bash
dos2unix system_health.sh
```
```bash
chmod +x system_health.sh
```
```bash
sudo ./system_health.sh
```

### 3. Log File Analyzer Script
#### Description
The log_analyzer.sh script analyzes web server logs (e.g., Apache) for common patterns such as the number of 404 errors, the most requested pages, and IP addresses with the most requests. The script outputs a summarized report.
#### Usage
```bash
git clone https://github.com/Simran-2000/AccuKnox_assignment/blob/main/log_analyzer.sh
```
 Make sure you update the path of the log file to yours in the script
```bash
dos2unix log_analyzer.sh
```
```bash
chmod +x log_analyzer.sh
```
```bash
./log_analyzer.sh
```
