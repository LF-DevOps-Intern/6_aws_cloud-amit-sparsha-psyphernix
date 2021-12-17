#!/bin/bash
export AWS_MAX_ATTEMPTS=1
role=bab-bl-role-ga
fileName=bab-bl
timeOut=5
functionName=bab-bl-function-ga

# Creating role for lambda
timeout $timeOut aws iam wait role-exists --role-name $role

if [ $? -eq 124 ]; then
        echo "$role is not available!"
        echo "Creating $role ........."
        aws iam create-role --role-name $role --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}' --description "Lambda execution role for BAB"

        if [ $? -eq 0 ]; then
                echo "$role created successfully!"
                aws iam attach-role-policy --role-name $role --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole 
        else
                echo "$role cannot be created!"
                exit 254
        fi
fi

# Zipping the lambda function
zip $fileName.zip $fileName.py 

if [ $? -ne 0 ]; then
        echo "Zipping process is not successful!"
        exit 254
fi

# Creating function
timeout $timeOut aws lambda wait function-exists --function-name $functionName

if [ $? -eq 124 ]; then
        echo "$functionName does not exist. Creating function....."
        aws lambda create-function --function-name $functionName --zip-file fileb://$fileName.zip --handler fn-static.static_handler --runtime python3.9 --role arn:aws:iam::949263681218:role/$role
elif [ $? -eq 0 ]; then
        echo "$functionName is deployed successfully!"
else
        echo "Updating function........."
        aws lambda update-function-code --function-name $functionName --zip-file fileb://$fileName.zip
fi
