1. **Creating a bash script to deploy lambda functions:**
    
    ![image](https://user-images.githubusercontent.com/34814966/146597483-957ec49d-3d2b-4de3-b817-70bf2a82a5fe.png)
    
        $ sudo vim deployLambda.sh
        
    ![image](https://user-images.githubusercontent.com/34814966/146601829-915f3087-92c8-4c8a-beb4-d7dfef85ee03.png)

        $ chmod +x deployLambda.sh
        $ ./deployLamda.sh
        
    ![image](https://user-images.githubusercontent.com/34814966/146602993-dda8d560-5d2c-47c5-9838-a071b4486338.png)
    
    ![image](https://user-images.githubusercontent.com/34814966/146603162-465803fa-fff1-4419-8581-66fedfc25310.png)


2. **Creating a bash script to deploy react app to S3:**

        $ sudo vim deployReactS3.sh

    ![image](https://user-images.githubusercontent.com/34814966/146590822-0c6fff90-e466-4622-b205-769dac702044.png)

        $ sudo chmod +X deployReactS3.sh
        $./deployReactS3.sh
        
    ![image](https://user-images.githubusercontent.com/34814966/146591558-e4f6a0ab-92f0-4a50-8d21-cf5419649804.png)
        
    ![image](https://user-images.githubusercontent.com/34814966/146591496-07755c6b-bae8-4553-a3a5-ddda2b1d3452.png)

3. **Integrating both these scripts with Github Actions:**

