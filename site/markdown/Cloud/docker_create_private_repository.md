# 建立自己的私有docker repository
      
      
      git clone https://github.com/dotcloud/docker-registry
      cd docker-registry/config
      cp config_sample.yml config.yml
      vi config.yml



...
# This is the default configuration when no flavor is specified
dev:
    storage: local
    storage_path: /home/vagrant/registry
    loglevel: debug
...


      mkdir /home/vagrant/registry
      sudo apt-get install build-essential python-dev libevent-dev python-pip libssl-dev
      cd ../
      sudo pip install -r requirements.txt

