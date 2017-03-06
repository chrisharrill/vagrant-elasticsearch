sudo apt-get update

# Install JDK
sudo apt-get -y install default-jdk

# Install Elasticsearch
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -  
sudo apt-get -y install apt-transport-https  
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list  
sudo apt-get update && sudo apt-get -y install elasticsearch

# Setup firewall
sudo ufw allow 22  
sudo ufw allow 9200  
sudo ufw enable

# Copy Elasticsearch configuration
sudo cp /vagrant_data/elasticsearch.yml /etc/elasticsearch  
sudo cp /vagrant_data/jvm.options /etc/elasticsearch

# Enable Elasticsearch on startup, and start it
sudo /bin/systemctl daemon-reload  
sudo /bin/systemctl enable elasticsearch.service  
sudo /bin/systemctl start elasticsearch.service
