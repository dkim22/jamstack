### aws

- iam
    - create user ⇒ programmer check ⇒ s3 full access and cloudfront check
    - aws cli v1 설치
        - $ aws configure
        - vi ~/.aws/credentials

        ```jsx
        [jam]
        aws_access_key_id = AKIAXICD4A5XVB5ALKUL
        aws_secret_access_key = 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
        ```

        - AWS_PROFILE=jam aws s3 ls (확인용)

- s3
    - public access uncheck
- cloudfront
    - Restrict Bucket Access ⇒ yes
    - Origin Access Identity ⇒ Create a New Identity
    - Comment ⇒ access-identity-jamstack-dkim22.s3.amazonaws.com
    - Grant Read Permissions on Bucket ⇒ yes
    - Compress Objects Automatically ⇒ yes
    - Default Root Object ⇒ index.html

- aws cli
    - deploy to bucket ⇒ cd build && AWS_PROFILE=jam aws s3 sync . s3://jamstack-dkim22

### terraform

- jamstack-terraform-dkim22 버킷 직접 생성후
  - main.tf 버킷을 미리 만들어 둬야 AWS_PROFILE=jam terraform init 이 가능함
- AWS_PROFILE=jam terraform init
- AWS_PROFILE=jam terraform plan
- AWS_PROFILE=jam terraform apply
  - 엑세스 안될 때는 aws_iam_policy_document를 한번 지우고 다시 만듦
- AWS_PROFILE=jam terraform destroy
