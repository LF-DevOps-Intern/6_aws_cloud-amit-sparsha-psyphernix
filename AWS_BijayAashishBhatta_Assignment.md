1. **Writing a script that backs up an SQL dump and uploads it to an S3 Bucket (the contents of the S3 bucket should not be accessible via public):**

![image](https://user-images.githubusercontent.com/34814966/146380111-5cafda59-4dda-4813-9ab4-df10f09b3fe2.png)

![image](https://user-images.githubusercontent.com/34814966/146380188-36a6b0b3-dec4-414e-97ca-20b38b2274e3.png)

![image](https://user-images.githubusercontent.com/34814966/146391234-f760ea8b-a2b7-46e2-871f-6357246da00c.png)

2. **Creating a Lambda function that is triggered by an object being uploaded to an S3 bucket (If the object’s name starts with make_public, ensure that the object is publicly accessible):**



3. **Hosting a react application on an S3 Bucket and deliver it through cloudfront:**


4. **Creating two Lambda Functions - First Lambda function returns 200 Response as {“Hello”: “Default”}
and Second Lambda function returns 200 Response as {“Hello”: “{Dynamic route name}”} :**

   **Configure API Gateway with that hits first lambda function on / and the second lambda function on /* : **

