#!/bin/bash

set -e -u -o pipefail

bucket=my-lab035-snapshots
region=eu-west-2
access_key=aws_access_key_id
secret_key=aws_secret_access_key

# access="--store s3 --s3-bucket $bucket --s3-region $region --s3-key-id $access_key --s3-secret-key $secret_key"
access="--store s3 --s3-bucket $bucket --s3-region $region --s3-key-id"

# jq is used by this script, so install it. For other Linux distros, either preinstall jq
# and remove these lines, or change to the mechanism your distro uses to install jq.

sudo apt-get update
sudo apt-get install -y jq

# Run the installer.

sudo curl https://install.terraform.io/ptfe/stable | sudo bash -s fast-timeouts

# Wait for replicated to start before proceeding
until replicatedctl system status --template '{{and (eq .Replicated "ready") (eq .Retraced "ready")}}' | grep -q true; do
  sleep 1
  echo "Replicated is not yet ready."
done
echo "Replicated is ready."

# This retrieves a list of all the snapshots currently available.
replicatedctl snapshot ls $access -o json > /tmp/snapshots.json

# Pull just the snapshot id out of the list of snapshots
id=$(jq -r 'sort_by(.finished) | .[-1].id // ""' /tmp/snapshots.json)

# If there are no snapshots available, exit out
if test "$id" = ""; then
  echo "No snapshots found"
  exit 1
fi

echo "Restoring snapshot: $id"

# Restore the detected snapshot. This ignores preflight checks to be sure the application
# is booted.
replicatedctl snapshot restore $access --dismiss-preflight-checks "$id"

# Wait until the application reports itself as running. This step can be removed if
# something upstream is prepared to wait for the application to finish booting.
until sudo curl -f -s --connect-timeout 1 http://localhost/_health_check; do
  sleep 1
done


echo
echo "Application booted!"