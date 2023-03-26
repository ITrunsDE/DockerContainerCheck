# Docker container check

If a specific docker container returns an error. Restart the container and send an email

## Installation

Copy the script to a local folder, make it executable via chmod and run it via a cronjob.

```bash
chmod +x docker_check.sh
```

For checking every 5 minutes add the following code to the cronjob.

```bash
*/5 * * * * /path/to/docker_check.sh
```