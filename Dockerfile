FROM 474668427249.dkr.ecr.ca-central-1.amazonaws.com/node_base_image
RUN echo 'moving to file copy phase'

#Make directory to preserve application directory
RUN mkdir -p /calculator/app

# Set working directory
WORKDIR /calculator/app

# Install dependencies
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)

ENV NODE_VERSION 23.7.0

COPY package*.json ./

RUN npm install

# Bundle app source
COPY *.js ./

EXPOSE 3000

#CMD [ "node", "index.js" ]
ENTRYPOINT ["node", "index.js" ]
