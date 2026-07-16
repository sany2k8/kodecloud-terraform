aws --endpoint-url=http://aws:4566 \
    --region us-east-1 \
    ssm get-parameter \
    --name datacenter-ssm-parameter
