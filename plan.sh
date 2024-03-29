#!/bin/bash

# Export Path Variable
export PATH=$PATH:/opt

# If statement to ensure a user has provided a Terraform folder path
if [[ -z "$1" ]]; then
echo ""
echo "You have not provided a Terraform path."
echo "SYNTAX = ./plan.sh <PATH>"
echo "EXAMPLE = ./plan.sh terraform/instance"
echo ""
exit
fi

if az account show > /dev/null 2>&1 ; then
    echo ""
    echo "--------------------------------------------------------------------------------------------"
    echo ""
    echo "You have successfully authenticated with Microsoft Azure."
    echo ""
    echo "--------------------------------------------------------------------------------------------"
else
    echo ""
    echo "--------------------------------------------------------------------------------------------"
    echo ""
    echo "Authentication failure."
    echo "Please run the following command on your command line to authenticate with Microsoft Azure."
    echo ""
    echo "az login"
    echo ""
    echo "--------------------------------------------------------------------------------------------"
    echo ""
exit
fi

terraform init $1

#The Get command is used to download and update modules mentioned in the root module.
terraform get $1

#The Plan command is used to create an execution plan
terraform plan $1