#! /usr/bin/python

nohup java -Dapex.home=./apex -Dapex.images=/home/apexuser/apex/images -Dapex.erase -jar ./apex.war > apxlsnr.log &
