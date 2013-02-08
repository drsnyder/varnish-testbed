require 'sinatra'

PAYLOAD_SIZE=15*2**10
def rchr
    (97 + rand(27)).chr
end

def generate_random_block(n)
    n.times.collect { rchr }.join("")
end

def emit_body(text)
    body "<html><body>\n" + \
        text + \
        "</body></html>\n"
end

get '/' do
    status 200
    emit_body(generate_random_block(PAYLOAD_SIZE) + "\n" +  \
    "<esi:include src=\"/esi\" />\n" + \
    "<esi:include src=\"/esi\" />\n" + \
    "<esi:include src=\"/esi\" />\n" + \
    generate_random_block(PAYLOAD_SIZE))
    

end

get '/esi' do
    status 200
    headers "Cache-Control" => "s-maxage=0"
    body generate_random_block(2**10)
end

