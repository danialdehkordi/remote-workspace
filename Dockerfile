FROM nginx:latest

# Install prerequisite CLI tools
RUN apt-get update && apt-get install man wget tar jq xz-utils apt-transport-https gpg curl -y
    

# Download latest VS code server
#RUN wget https://az764295.vo.msecnd.net/stable/$(curl https://update.code.visualstudio.com/api/commits/stable/server-linux-x64-web | cut -d '"' -f 2)/vscode-server-linux-x64-web.tar.gz && \
RUN wget https://update.code.visualstudio.com/latest/server-linux-x64/stable && \
	tar -xvf vscode-server-linux-x64.tar.gz && \
	chmod -R 775 vscode-server-linux-x64 && \
	rm -rf vscode-server-linux-x64.tar.gz
  
# Install VS code extensions
RUN /opt/vscode/vscode-server-linux-x64-web/bin/code-server --accept-server-license-terms --telemetry-level off --extensions-dir=/opt/vscode/extensions \
	--install-extension GitHub.copilot
