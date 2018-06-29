#!/bin/bash

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -t|--tag)
    TAG="$2"
    shift # past argument
    shift # past value
    ;;
    -c|--cluster-name)
    CLUSTER_NAME="$2" # not in use atm
    shift # past argument
    shift # past value
    ;;
    *)
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

sudo docker run \
  -e AAD_CLIENT_ID=$AAD_CLIENT_ID \
  -e AAD_SECRET=$AAD_SECRET \
  -e AAD_TENANT=$AAD_TENANT \
  -e STORAGE_ACCOUNT_NAME=$STORAGE_ACCOUNT_NAME \
  -e STORAGE_ACCOUNT_KEY=$STORAGE_ACCOUNT_KEY \
  -e ADMIN_USER_NAME=$ADMIN_USER_NAME\
  -e ADMIN_USER_PASSWORD=$ADMIN_USER_PASSWORD \
  -e SUBSCRIPTION_ID=$SUBSCRIPTION_ID \
  -e RESOURCE_GROUP=$RESOURCE_GROUP \
  -e REGION=$REGION \
  -e AZURE_CONTAINER_NAME=$AZURE_CONTAINER_NAME \
  -e FS_SCRIPT_DIRECTORY=$FS_SCRIPT_DIRECTORY \
  -e FS_RESULT_DIRECTORY=$FS_RESULT_DIRECTORY \
  -e FS_MODEL_DIRECTORY=$FS_MODEL_DIRECTORY \
  -e FS_DATA_DIRECTORY=$FS_DATA_DIRECTORY \
  -e LOCAL_SCRIPT_FILE=$LOCAL_SCRIPT_FILE \
  -e LOCAL_MODEL_FILE=$LOCAL_MODEL_FILE \
  -e WORKSPACE=$WORKSPACE \
  -e EXPERIMENT=$EXPERIMENT \
  -e JOB_NAME_PREFIX=$JOB_NAME_PREFIX \
  -e JOB_NODE_COUNT=$JOB_NODE_COUNT \
  -e CLUSTER_NAME=$CLUSTER_NAME \
  -e CLUSTER_CONTAINER_MNT_PATH=$CLUSTER_CONTAINER_MNT_PATH \
  -e CLUSTER_VM_SIZE=$CLUSTER_VM_SIZE \
  -e CLUSTER_VM_PRIORITY=$CLUSTER_VM_PRIORITY \
  -e CLUSTER_MINIMUM_NODE_COUNT=$CLUSTER_MINIMUM_NODE_COUNT \
  -e CLUSTER_MAXIMUM_NODE_COUNT=$CLUSTER_MAXIMUM_NODE_COUNT \
  -e CLUSTER_INITIAL_NODE_COUNT=$CLUSTER_INITIAL_NODE_COUNT \
  ${TAG}