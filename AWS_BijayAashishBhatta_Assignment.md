1. **Writing a script that backs up an SQL dump and uploads it to an S3 Bucket (the contents of the S3 bucket should not be accessible via public):**

    At first, Let's create a database and some tables.

    ![image](https://user-images.githubusercontent.com/34814966/146380111-5cafda59-4dda-4813-9ab4-df10f09b3fe2.png)

    ![image](https://user-images.githubusercontent.com/34814966/146380188-36a6b0b3-dec4-414e-97ca-20b38b2274e3.png)

    ![image](https://user-images.githubusercontent.com/34814966/146391234-f760ea8b-a2b7-46e2-871f-6357246da00c.png)
    
    Now, lets create a s3 bucket where we have to upload a file
    
    ![image](https://user-images.githubusercontent.com/34814966/146405712-dd4d288e-ec72-40bd-8d9e-3d37532f05e5.png)

    ![image](https://user-images.githubusercontent.com/34814966/146405804-cecbe7cc-3608-4388-bbae-847cb6569d98.png)

    ![image](https://user-images.githubusercontent.com/34814966/146406050-170e87d4-d113-4287-8db8-c05cbb75872a.png)
    
    Lets create script:
        
        $ sudo vim dbbackup-s3.sh
        $ sudo chmod +x dbbackup-s3.sh
        
    Here is the script that will automate task: 
        
        #!/bin/sh
        echo "Starting database backup..."
        day="$(date +'%A%d%m%Y')"
        db_backup="bab_db_${day}.sql"
        sudo mysqldump  -u root --no-tablespaces AWS > /home/psyphernix/${db_backup}
        echo "Database backup completed."
        echo "Sending backup file to S3 bucket..."
        aws s3 cp $db_backup s3://bab-s3-bucket/db/
        echo "File is successfully sent to S3 bucket."
    
    Now lets backup using script:
        
        $ ./dbbackup-s3.sh
    
    ![image](https://user-images.githubusercontent.com/34814966/146414147-25718dcc-56cd-4747-aca3-98dddb8d1629.png)

    ![image](https://user-images.githubusercontent.com/34814966/146414041-f705cdac-2826-4570-9524-37968c726770.png)

    ![image](https://user-images.githubusercontent.com/34814966/146415357-0b45a6f8-2c0c-42b0-ac5b-ede48009c744.png)

    
2. **Creating a Lambda function that is triggered by an object being uploaded to an S3 bucket (If the object’s name starts with make_public, ensure that the object is publicly accessible):**

    ![image](https://user-images.githubusercontent.com/34814966/146435542-4a538cc3-a4bf-43ed-90a8-93e9d8e422df.png)

    ![image](https://user-images.githubusercontent.com/34814966/146435879-3a578e88-c2d6-447c-be44-af95b79eea85.png)
    
    ![image](https://user-images.githubusercontent.com/34814966/146438080-f8829634-d666-4f54-81e4-4eb622c2474e.png)

    ![image](https://user-images.githubusercontent.com/34814966/146445149-8fc8ccd9-ff7c-43e5-b900-6088e057f9a9.png)

    ![image](https://user-images.githubusercontent.com/34814966/146445379-9b7e2f1f-2276-48b9-9371-873124f81bb8.png)


3. **Hosting a react application on an S3 Bucket and deliver it through cloudfront:**

    ![image](https://user-images.githubusercontent.com/34814966/146485927-dab798ee-01ca-4374-8ed6-98240af39693.png)

    ![image](https://user-images.githubusercontent.com/34814966/146486006-ad37484d-c38f-4404-890a-4152bd18d84e.png)

    ![image](https://user-images.githubusercontent.com/34814966/146486221-e2dbcb83-aeaf-4d7c-9ac6-6a01a485f0a8.png)

    ![image](https://user-images.githubusercontent.com/34814966/146488116-5cd40a18-0f96-40ab-90f5-bd4fe3e9a61f.png)

    ![image](https://user-images.githubusercontent.com/34814966/146488377-ee509377-6eb2-478b-9f0b-319ec902aa97.png)

    I could not provide alternate domain name as ssl certificate is still pending, so I am doing without alternative domain name.
    
    ![image](https://user-images.githubusercontent.com/34814966/146491871-5f005626-b1f5-49c3-8f46-67379e7156a0.png)

    ![image](https://user-images.githubusercontent.com/34814966/146492039-210d8516-25ee-480e-84fd-fd1a1cfb87c6.png)

    ![image](https://user-images.githubusercontent.com/34814966/146494645-3c9757a1-9113-4048-9f11-31be9b2a4267.png)


4. **Creating two Lambda Functions - First Lambda function returns 200 Response as {“Hello”: “Default”}
and Second Lambda function returns 200 Response as {“Hello”: “{Dynamic route name}”} :**
#### - Configure API Gateway with that hits first lambda function on / and the second lambda function on /* : 
    
   - First Function:

   ![image](https://user-images.githubusercontent.com/34814966/146518294-e45bca9f-2538-4eed-a835-50cbe7177eca.png)
   
   - Second Function:
   
   ![image](https://user-images.githubusercontent.com/34814966/146518436-3fde7701-3afa-476e-91bd-f4a5d095aa4d.png)

   - API GATEWAY:

   ![image](https://user-images.githubusercontent.com/34814966/146519480-22a51129-7406-48b3-af30-343d01cd2b04.png)

   ![image](https://user-images.githubusercontent.com/34814966/146519686-f5c291ad-b826-4928-a021-fca4d031db0f.png)
   
   ![image](https://user-images.githubusercontent.com/34814966/146520007-d6226248-1bc7-4c5d-b7cf-e19fbbb03054.png)

