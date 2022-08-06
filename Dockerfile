FROM ubuntu
RUN apt-get update -y -q && apt-get upgrade -y -q 
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y -q curl build-essential ca-certificates git zsh
RUN apt install curl git python3 python3-pip golang-go jq vim -y
ENV GOPATH $HOME/go
ENV PATH="/usr/local/go/bin:${PATH}:/go/bin"
# install JSScanner
RUN cd /opt && git clone https://github.com/0x240x23elu/JSScanner.git
RUN cd /opt/JSScanner &&  pip3 install -r  requirements.txt
# install paramspider
RUN cd /opt && git clone https://github.com/devanshbatham/ParamSpider
RUN cd /opt/ParamSpider && pip3 install -r requirements.txt
# install arjun
RUN pip3 install arjun
# install go tools
RUN go install -v github.com/tomnomnom/assetfinder@latest
RUN go install -v github.com/tomnomnom/anew@latest
RUN go install -v github.com/tomnomnom/waybackurls@latest
RUN go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
RUN go install -v github.com/KathanP19/Gxss@latest
RUN go install -v github.com/hahwul/dalfox/v2@latest
RUN go install -v github.com/OWASP/Amass/v3/...@master
RUN go install -v github.com/bp0lr/gauplus@latest
RUN go install -v github.com/sensepost/gowitness@latest
RUN go install -v github.com/Emoe/kxss@latest
RUN go install -v github.com/lc/subjs@latest
RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
RUN go go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
VOLUME /home
