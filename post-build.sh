#!/bin/bash

# Function to SSH into the bastion and master maachine
# This function will rollout the update and rollback the update.
# To rollout the update
# Set Environment Variable DEPLOYMENT_UPDATE to "update" and to rollback set to "rollback"


function applyUpdate() {
  eval `ssh-agent`
  ssh-add ~/.ssh/id_rsa
  ssh -A $5@$1 << EOF
    ssh $5@$2 << ABC
     #git clone $3
     if [ "$6" == "update" ]; then git clone $3 && kubectl apply -f $4/kubernetes/app/ && rm -rf $4 ; fi
     if [ "$6" == "rollback" ]; then kubectl rollout undo deployments/hello-world --namespace production ; fi
     #rm -rf $4
     exit
ABC
    exit

EOF
}



applyUpdate $BASTION_HOST $MASTER_IP $REPO_HTTPS_URL $REPO_NAME $USERNAME $DEPLOYMENT_UPDATE
