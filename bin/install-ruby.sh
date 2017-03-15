RUBY_VERSION=2.4.0
######## install rbenv
# for yum
sudo yum install -y git gcc gcc-c++ openssl-devel readline-devel bzip2
# for apt
sudo apt-get install git build-essential libssl-dev
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
rbenv -v

######## install ruby-build
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
ls ~/.rbenv/plugins/ruby-build/bin/

######## install ruby
rbenv install --list
rbenv install ${RUBY_VERSION}
rbenv global ${RUBY_VERSION}
rbenv rehash
rbenv versions
ruby -v

######## update gem
gem -v
gem update --system
gem -v
 
######## bundlerのインストール
gem install bundler

