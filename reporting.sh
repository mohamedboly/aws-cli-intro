#!/bin/bash
# Auteur : Mohamadou Boly
# Date : 22/12/2022
set -x       # Active le mode debug et affiche chaque commande avant son exécution
set -e       # Interrompt le script dès qu'une commande retourne une erreur
set -o pipefail  # Si une commande dans un pipe (|) échoue, le script s'arrête

# Liste des aws S3 buckets
echo "Liste des buckets S3"
aws s3 ls

# Liste des instances EC2
echo "Liste des instances EC2"
aws ec2 describe-instances | jq '.Reservations[].Instances[] | {InstanceId: .InstanceId, InstanceType: .InstanceType, State: .State.Name, PublicIpAddress: .PublicIpAddress, PrivateIpAddress: .PrivateIpAddress}'

#Liste des lambdas functions
echo "Liste des lambdas functions"
aws lambda list-functions