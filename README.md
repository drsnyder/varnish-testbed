# Varnish Test Bed

A set of tools for testing and configuring varnish.

# Getting started

    ./run-varnish /usr/sbin/varnishd 
    ruby -rubygems backend-server.rb  -p 8089

    curl -I http://localhost:6083/

    for i in {1..1000}; do  echo "http://localhost:6083/pages/$i" >> urls.txt; done
    
    siege -i -f urls.txt -t 30S -c 20
