#!/bin/bash

# Configuration
AMI_ID="ami-0123456789abcdef0"             # Replace with your AMI ID
INSTANCE_TYPE="t2.micro"                   # Instance type
KEY_NAME="my-keypair"                      # Replace with your EC2 key pair name
SECURITY_GROUP_ID="sg-0123456789abcdef0"   # Replace with your security group ID
SUBNET_ID="subnet-0123456789abcdef0"       # Optional, for VPC placement
TAG_NAME="MyEC2Instance"

# Launch EC2 instance
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id "$AMI_ID" \
  --instance-type "$INSTANCE_TYPE" \
  --key-name "$KEY_NAME" \
  --security-group-ids "$SECURITY_GROUP_ID" \
  --subnet-id "$SUBNET_ID" \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$TAG_NAME}]" \
  --query 'Instances[0].InstanceId' \
  --output text)

# Check if instance was created
if [ -n "$INSTANCE_ID" ]; then
  echo "Successfully launched EC2 instance with ID: $INSTANCE_ID"
else
  echo "Failed to launch EC2 instance"
fi
