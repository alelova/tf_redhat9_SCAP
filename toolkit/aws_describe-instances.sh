#aws ec2 describe-instances  --query "Reservations[*].Instances[*].{InstanceId:InstanceId,PublicIP:PublicIpAddress,IP:PrivateIpAddress,Name:Tags[?Key=='Name']|[0].Value,Status:State.Name}" --output table
# we only need internal ip for services
aws ec2 describe-instances  --query "Reservations[*].Instances[*].{InstanceId:InstanceId,IP:PrivateIpAddress,Name:Tags[?Key=='Name']|[0].Value,Status:State.Name}" --output table
