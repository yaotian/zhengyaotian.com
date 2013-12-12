# 建立自己的私有docker repository

## 安装docker repositroy
      
      
      git clone https://github.com/dotcloud/docker-registry
      cd docker-registry/config
      cp config_sample.yml config.yml
      vi config.yml




      # This is the default configuration when no flavor is specified
      dev:
          storage: local
          storage_path: /home/vagrant/registry
          loglevel: debug



      mkdir /home/vagrant/registry
      sudo apt-get install build-essential python-dev libevent-dev python-pip libssl-dev
      cd ../
      sudo pip install -r requirements.txt


      sudo gunicorn --access-logfile - --debug -k gevent -b 0.0.0.0:8888 -w 1 wsgi:application &
      
      
## tag and 提交自己的docker

      sudo docker images
      sudo docker tag 8dbd9e392a96 150.236.233.184:8888/yt_ubuntu
      sudo docker push  150.236.233.184:8888/yt_ubuntu
  
成功后在repository里就有你的docker了


## 使用这些docker

      sudo docker run  -i -t 150.236.233.184:8888/yt_ubuntu  /bin/bash
      
      

