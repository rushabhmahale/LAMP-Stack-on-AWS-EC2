# LAMP-Stack-on-AWS-EC2

## What is LAMP Stack?
The LAMP stack is a popular open-source solution stack used primarily in web development.

LAMP consists of four components necessary to establish a fully functional web development environment. The first letters of the components' names make up the LAMP acronym:

- Linux is an operating system used to run the rest of the components.
- Apache HTTP Server is a web server software used to serve static web pages.
- MySQL is a relational database management system used for creating and managing web databases, but also for data warehousing, application logging, e-commerce, etc.
- PHP, Perl, and Python are programming languages are used to create web applications.

## Architecture Diagram of LAMP Stack:- 
![new LAMP architect daigram](https://user-images.githubusercontent.com/63963025/165558448-429ad2eb-8866-4675-8d68-d8ea7dba9825.png)



## Reffer this blogs:- 
 - https://www.interserver.net/tips/kb/configure-wordpress-external-database/
 - https://www.tecmint.com/install-wordpress-in-ubuntu-lamp-stack/

## steps to be followed :-
Login to your aws account 
![image](https://user-images.githubusercontent.com/63963025/164738889-f810f515-a1a4-400b-bf55-05f4938fe353.png)

## select region Mumbai- <b>ap-south1<b>
![image](https://user-images.githubusercontent.com/63963025/164739356-be65e072-155f-4fb3-8807-91f76d683d45.png)

## Create VPC 
  ![image](https://user-images.githubusercontent.com/63963025/164967294-346a22ab-9ad7-48d9-a7ce-9579466b4fee.png)
## add CIDR range 
 ![image](https://user-images.githubusercontent.com/63963025/164968136-232b2b95-fdc3-4071-bbc2-53bb25546ada.png)
  
## Now Create Internet Gateway for interact with outside world internet VPC ----> Internet Gateways 
  ![image](https://user-images.githubusercontent.com/63963025/164967475-bf6825da-2147-4945-85bf-dd17922ee756.png)

  ![image](https://user-images.githubusercontent.com/63963025/164967527-fdac80fc-37b0-4f8c-b597-5f5637c28946.png)
## After creation of Igw we have to attach to VPC that we have created now go to action and attach to your VPC 
  ![image](https://user-images.githubusercontent.com/63963025/164967618-6da3ecfd-922f-403d-bd22-d2c098e039ab.png)
![image](https://user-images.githubusercontent.com/63963025/164967648-da776ba9-f5e2-4218-8a5e-41524b12ecd4.png)
## Now lets create 2 subnet (public,private)

  ## In Filter select your VPC 
  ![image](https://user-images.githubusercontent.com/63963025/164967753-7e70ad84-47a3-4022-bc71-648bb6ae01a5.png)
## VPC ----> subnet create subnet 
  ## select your vpc 
  ![image](https://user-images.githubusercontent.com/63963025/164968246-ab2415e8-a358-4800-9ef5-5f382aaad714.png)

## add subnet (public subnet)
  ![image](https://user-images.githubusercontent.com/63963025/164968366-0da4dffd-fae5-46fa-adf7-516c1dd524dc.png)

## add subnet (private subnet)
 ![image](https://user-images.githubusercontent.com/63963025/164968436-c7dec02a-d647-41ff-8f7a-d9fb6c77824e.png)

## create subnet
![image](https://user-images.githubusercontent.com/63963025/164968455-8b448293-170e-46e3-bf20-6c761288bb5b.png)

 ## now configure route table VPC---> Route Tables we will create 2 route tables here 
 ## public route table
  ![image](https://user-images.githubusercontent.com/63963025/164968533-8cd527f9-d1db-49a8-85ca-554bbc1ee5c4.png)
## private route table 
 ![image](https://user-images.githubusercontent.com/63963025/164968685-2ffe2899-d498-44e2-ac5c-18417cfe45c6.png)
![image](https://user-images.githubusercontent.com/63963025/164968711-e5b2f757-6707-40ef-9bd8-3bc8ec55d73d.png)
## now select public routetable  go to subnet associations add public subnet 
  ![image](https://user-images.githubusercontent.com/63963025/164968835-9effa5f8-82e2-410c-9bfa-8500cb25c5a7.png)

  ![image](https://user-images.githubusercontent.com/63963025/164968760-3aba2bc1-a7b1-49f6-a4d0-505747b83041.png)
## same in private add private subnet  
![image](https://user-images.githubusercontent.com/63963025/164968843-ea643827-76ee-4333-b2f4-f1f12055073e.png)
## in public route table go to routes 
  ![image](https://user-images.githubusercontent.com/63963025/164968915-73230ea9-8b96-4fd0-9922-cfbe3c6a9b61.png)
## edit  routes add 0.0.0.0/0 to internet gateway  
  ![image](https://user-images.githubusercontent.com/63963025/164968950-d82fce79-9c7c-4c59-be83-d5b4751e7d73.png)
  
## now we will create 2 ec2 instance one will be public and one will be private  

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
## go to network setting edit option create a security group custom name the security group apache webserver (select public subnet here) as well as enable Auto-assign public IP
![image](https://user-images.githubusercontent.com/63963025/164969334-9000b852-e6e6-4659-9a09-2035f6d15323.png)

![image](https://user-images.githubusercontent.com/63963025/164969261-5f652539-459f-405d-891e-6c4f36f83489.png)

## select storage default 
  ![image](https://user-images.githubusercontent.com/63963025/164744278-8b23333b-8083-4ee0-a96e-582d6e4740fd.png)
## we dont need advance option here so left as defualt here 
## apache-webserver instance launched succesfully 
  ![image](https://user-images.githubusercontent.com/63963025/164749839-7f3622ce-4aff-40de-b94d-8de1f8e8048e.png)
## create same instance but this time we need to change network setting 
## instance name :- Mysql database
## Network setting disable public ip because of database your  database must be private  
 ![image](https://user-images.githubusercontent.com/63963025/164969472-c489eb00-caa6-4109-ab70-b190804331d9.png)

## create a new security group 
  ![image](https://user-images.githubusercontent.com/63963025/164969486-ea860f8f-9c95-49e2-81e7-40532ea74ac6.png)

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
  sudo nano index.php 
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
 ![image](https://user-images.githubusercontent.com/63963025/164969620-fb3a5de9-bbf1-47af-908f-d8c83758d3d5.png)
![image](https://user-images.githubusercontent.com/63963025/164969638-9cb449c2-478b-4627-95a2-4cd2b53cb412.png)


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
## if you are net able to connect vm or ssh to machine make sure your firewall rule(security group) if not use sudo to ssh also go through steps 
## mysql
  ![image](https://user-images.githubusercontent.com/63963025/164956832-6ff6b16d-f314-4bb8-a674-2d514f34f2d4.png)
##apache-web
  ![image](https://user-images.githubusercontent.com/63963025/164956880-468f0a2f-af77-4732-a4c9-ff2d5224de50.png)
## now there is 1 issue our mysql instance will not able to download package because not have internet connectivity so here we have to create NAT gateway 
  go to VPC---> NAT Gateway ---> create NAT gateway 
![image](https://user-images.githubusercontent.com/63963025/164976625-295151ce-dfad-4586-951f-d61db930d6c4.png)

![image](https://user-images.githubusercontent.com/63963025/164976689-6a32f3b4-39ce-42bb-90e4-c11ffa0bb081.png)


 ## go to route table and change routes select private route make this point clear we are creating NAT in public subnet and editing routes in private route table 
  go to routes---> edit routes ----> add routes----> select 0.0.0.0/0 and nat gateway (save changes)
  ![image](https://user-images.githubusercontent.com/63963025/164976819-90837321-8a78-4538-a081-aad2b9a929ef.png)

  ## thats great you can access to internet now (ssh to mysql machine using bastion host) 
  ![image](https://user-images.githubusercontent.com/63963025/164976915-e6ce4c2b-b906-4e62-a857-7c44c9a24283.png)

  
 ## now install this packaage 
  ```
  sudo su 
  apt-get update
  apt-get upgrade -y
  apt-get install mysql-server mysql-client -y
  mysql_secure_installation
  
  ```
  ## after installation use this point according to that set permission 
 - Enable Validate Password Plugin? No
- Change the password for root? No
- Remove anonymous users? Yes
- Disallow root login remotely? Yes
- Remove test database and access to it? Yes
- Reload privilege table now? Yes
  
  ## now access mysql using cmd 
  ```
  sudo mysql -uroot -p
  ```
  
  ![image](https://user-images.githubusercontent.com/63963025/164978651-e6261857-d83b-435d-9c91-e4f8b069d5e5.png)

  ## now go to this file and add internal ip of mysql internal ip 
  ```
  sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf
  ```
 ![image](https://user-images.githubusercontent.com/63963025/164979701-6677d194-6a37-4fa7-b949-37155c5c66f4.png)


  ## In the file, find a line containing bind-address add your mysql internal ip 
  ![image](https://user-images.githubusercontent.com/63963025/164979742-37e5e44c-4ff8-4a6c-894c-815bbe0b5b55.png)
```
  systemctl restart mysql 
  ```
  
  ## now go to MySQL database 
  ```
  mysql -uroot -p;
 ```
  
  ## now inside Mysql database use this databse cmd 
 - mysql> CREATE DATABASE wordpress;
- mysql> CREATE USER 'wordpressUser'@'1.2.3.4' IDENTIFIED BY 'qawsedrf123';
- mysql> GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressUser'@'1.2.3.4';
- mysql> FLUSH PRIVILEGES;

  ![image](https://user-images.githubusercontent.com/63963025/164982294-de0b0a05-fdc9-4fa1-992e-b32d89232710.png)
## lets check connectivity we are able to connect database or not so go to apache web machine 
  '''
  telnet <internal ip of mysql machine> 3306
  '''
  ## so there is connectivity between apache vm and mysql machine 
  ![image](https://user-images.githubusercontent.com/63963025/164982565-11b1007e-b016-4d60-82e1-a97ac9964baf.png)
## lets install wordpress inside apache machine now 
  ```
   cd /var/www/html
 rm -rf *
 wget https://wordpress.org/latest.tar.gz
 tar -xzvf latest.tar.gz
 mv wordpress/* ./
 rm latest.tar.gz
 chown -R www-data:www-data /var/www/html
  systemctl restart apache2
  ```

## wordpress succesfully installed and running 
  ![image](https://user-images.githubusercontent.com/63963025/164984265-264251b7-0467-42a8-a0eb-46dd825be4eb.png)

 ![image](https://user-images.githubusercontent.com/63963025/164984276-c4f546d0-11e7-47b5-a2cf-6ef7109362e8.png)

 ![image](https://user-images.githubusercontent.com/63963025/164984294-065bdb60-e37c-4863-b71e-a8e0aa27e7e9.png)

  ![image](https://user-images.githubusercontent.com/63963025/164984323-ba61ca81-6de8-4b3c-a421-174a24afd5c5.png)


  


  


 
  
