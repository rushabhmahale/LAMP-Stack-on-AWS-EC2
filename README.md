# LAMP-Stack-on-AWS-EC2

## What is LAMP Stack?
The LAMP stack is a popular open-source solution stack used primarily in web development.

LAMP consists of four components necessary to establish a fully functional web development environment. The first letters of the components' names make up the LAMP acronym:

- Linux is an operating system used to run the rest of the components.
- Apache HTTP Server is a web server software used to serve static web pages.
- MySQL is a relational database management system used for creating and managing web databases, but also for data warehousing, application logging, e-commerce, etc.
- PHP, Perl, and Python are programming languages are used to create web applications.

## steps to be followed :-
Login to your aws account 
![image](https://user-images.githubusercontent.com/63963025/164738889-f810f515-a1a4-400b-bf55-05f4938fe353.png)

## select region Mumbai- <b>ap-south1<b>
![image](https://user-images.githubusercontent.com/63963025/164739356-be65e072-155f-4fb3-8807-91f76d683d45.png)

## Create Ec2 Instance
  ![image](https://user-images.githubusercontent.com/63963025/164740612-21ceebdf-7135-4d8e-8043-0d223f6469a5.png)
## Step1:- go to launch instance 
## Name your vm machine :- apache webserver  
## Select OS
  ![image](https://user-images.githubusercontent.com/63963025/164741237-be833004-95e4-4766-8542-3a88c06c7177.png)
## Select Instance Type t2.micro 
  ![image](https://user-images.githubusercontent.com/63963025/164741646-c9140014-d417-43c5-8ae5-bb4a3bfbf078.png)
## Create a key pair for ssh in the machine it will create a pem file 
  ![image](https://user-images.githubusercontent.com/63963025/164742003-797a6219-7f72-4a5b-89f0-3e06736a5e5f.png)
##  now save the key in RSA format and select pem create the key
  ![image](https://user-images.githubusercontent.com/63963025/164742145-8d2ba34b-9ea1-4af6-b560-0665df3b0878.png)
## go to network setting edit option create a security group custom name the security group apache webserver
 ![image](https://user-images.githubusercontent.com/63963025/164745812-e1eed815-905c-4a17-a19a-041700415b91.png)
  ![image](https://user-images.githubusercontent.com/63963025/164745292-a428ee6e-419a-4509-9801-4540a7372617.png)

## select storage default 
  ![image](https://user-images.githubusercontent.com/63963025/164744278-8b23333b-8083-4ee0-a96e-582d6e4740fd.png)
## we dont need advance option here so left as defualt here 
## apache-webserver instance launched succesfully 
  ![image](https://user-images.githubusercontent.com/63963025/164749839-7f3622ce-4aff-40de-b94d-8de1f8e8048e.png)
## create same instance but this time we need to change network setting 
## instance name :- Mysql database
## Network setting disable public ip because of database your  database must be private  
  ![image](https://user-images.githubusercontent.com/63963025/164750960-5207d4c4-3283-4de8-b453-2c494f0d04e5.png)
## create a new security group 
  ![image](https://user-images.githubusercontent.com/63963025/164751367-fd7f375e-b36f-4b56-a5bd-2c376e1637b0.png)
## also we have to add mysql port number to connect our db to apache webserver 
  ![image](https://user-images.githubusercontent.com/63963025/164751491-180aba65-edda-4ec1-ae6a-56a97916cf16.png)
 
  ![image](https://user-images.githubusercontent.com/63963025/164751863-91faa0c2-33f8-41a5-8096-caee4096885f.png)
## Now lets install apache inside apache-vm as well as php (connect to your vm you can also use putty to ssh your vm)
  ![image](https://user-images.githubusercontent.com/63963025/164752132-ea8b3ca2-52da-4d02-a10a-0b5dc7d78447.png)
## use this cmd to install apache and php in apache-webserver vm
  ```
sudo apt-get update
  sudo apt-get install apache2 -y
sudo apt-get install php-curl -y
sudo apt-get install php-mysql -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update 
sudo apt install php7.1-curl -y
sudo apt-get install php7.2-mbstring -y
sudo apt-get install php-xml -y 
sudo apt-get install php-gd -y
sudo apt-get install libapache2-mod-php -y
sudo apt-get install mysql-client -y

```
## after installtion of copy external ip of apache-webserver vm and paste to you browser 
  ![image](https://user-images.githubusercontent.com/63963025/164874646-03df0b33-d63b-45b2-87e3-706fec52d76b.png)

  ![image](https://user-images.githubusercontent.com/63963025/164874675-05b1c142-a1eb-4298-8645-92b0b6ced526.png)
## Now add php file inside folder /var/www/html/ 
  ``` 
  sudo rm /var/www/html/index.html
  cd /var/www/html 
  sudo nano index.html 
  <?php

  phpinfo();

  ?>
  :wq!
  
  ```
  ## now here you will see php webpage 
  ![image](https://user-images.githubusercontent.com/63963025/164875173-2dbbf399-6563-4eab-9cd4-82e0dbfe7c9f.png)
  
  ## now we have to ssh another vm using bastion host because it contain internal ip so we can not ssh without bastion host so we will create a bastion host instance here but in GCP we have IAP (Identity-Aware Proxy) which is use intercepts web requests sent to your application, authenticates the user making the request using the Google Identity Service, and only lets the requests through if they come from a user you authorize. that is secure as well as you can also ssh internal ip using IAP here in aws there is similar bconcept called system manager but there is some limitations in aws the ssm agent is only install in aws and windows machine to access internal ip vm but here we are using ubuntu machine so thats why i am using  bastion host to access machine  
  
  ## lets create bastion host 
  
  ## name:- bastion host 
  
  ## OS ubuntu

  ## only in networking part we will change security group select ip of database vm to access  
  ![image](https://user-images.githubusercontent.com/63963025/164936839-b97cbfef-8f80-44e2-bc9b-0c65f59f5a26.png)

  ## bastion host is created sucessfully 
  ![image](https://user-images.githubusercontent.com/63963025/164937032-fdced89b-07d2-4673-b2c3-f431ffb3bd21.png)

 ## now connect to bastion host 
  ![image](https://user-images.githubusercontent.com/63963025/164937370-0f18a9d1-3f0c-4fab-b35f-a58c76b7ea5c.png)
  
  ## create a pem file inside the machine but make sure the name should be same go to your local system download and copy the key content and add into your bastion host to access mysql db instance 
  ![image](https://user-images.githubusercontent.com/63963025/164938776-d3e317e0-6941-4b6f-8772-7f77ab463843.png)

  ## copy the key content inside the file 
  ![image](https://user-images.githubusercontent.com/63963025/164939093-e1821052-e0b0-4698-a6bb-0dbf004423b4.png)

  ## create a pem file with same name 
  ![image](https://user-images.githubusercontent.com/63963025/164939483-c6032979-5501-4a8a-a126-01b3a56b201b.png)

  ## copy key inside that file 
  ![image](https://user-images.githubusercontent.com/63963025/164940726-3f7241f7-7812-4da7-8e4c-bf487284d570.png)
## now use this cmnd 
  ```
  chmod 0400 Lampkey.pem 
  ls -l
  ```
  ![image](https://user-images.githubusercontent.com/63963025/164941717-6ad1de02-d632-4f58-abcc-ee21b3a60c0c.png)
  
  ## here we are 
  
  ![image](https://user-images.githubusercontent.com/63963025/164942389-1b98a6f6-29ba-4426-849f-1daff2d84e88.png)
## if you are net able to connect vm or ssh to machine make sure your firewall rule(security group)
## mysql
  ![image](https://user-images.githubusercontent.com/63963025/164956832-6ff6b16d-f314-4bb8-a674-2d514f34f2d4.png)
##apache-web
  ![image](https://user-images.githubusercontent.com/63963025/164956880-468f0a2f-af77-4732-a4c9-ff2d5224de50.png)
## now there is 1 issue our mysql instance will not able to download package because not have internet connectivity so here we have to create NAT gateway 
  go to VPC---> NAT Gateway ---> create NAT gateway 
  ![image](https://user-images.githubusercontent.com/63963025/164957097-a8b2f702-19b8-49eb-aade-1dc7b604fcfe.png)

 ![image](https://user-images.githubusercontent.com/63963025/164957124-bc48ab05-e5d5-488f-894e-fb1954e1ff7e.png)

 ## 

  

  
  




  


 
  
