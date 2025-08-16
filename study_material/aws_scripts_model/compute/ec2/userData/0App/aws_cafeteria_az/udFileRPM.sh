#!/bin/bash -ex
yum -y update
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
yum -y install httpd mariadb-server wget
systemctl enable httpd
systemctl start httpd
systemctl enable mariadb
systemctl start mariadb
echo '<html><h1>Hello From Your Web Server!</h1></html>' > /var/www/html/index.html
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/CUR-TF-100-RSJAWS-1-23732/176-activity-JAWS-route53/s3/setup-v2.tar.gz
tar -zxvf setup-v2.tar.gz
wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/CUR-TF-100-RSJAWS-1-23732/176-activity-JAWS-route53/s3/db-v2.tar.gz
tar -zxvf db-v2.tar.gz
wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/CUR-TF-100-RSJAWS-1-23732/176-activity-JAWS-route53/s3/cafe-v2.tar.gz
tar -zxvf cafe-v2.tar.gz -C /var/www/html/
cd setup
./set-app-parameters.sh
cd ../db/
./set-root-password.sh
./create-db.sh