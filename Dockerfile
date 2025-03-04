FROM debian

RUN apt update && apt install -y curl gpg
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | tee /usr/share/keyrings/nodesource.gpg
RUN echo 'deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x bullseye main' > /etc/apt/sources.list.d/nodesource.list
RUN apt update && apt install -y nodejs

# Install the below as they are needed by the chromium bundled with Puppeteer
RUN apt install -y \
 libasound2 \
 libatk-bridge2.0-0 \
 libatk1.0-0 \
 libatomic1 \
 libatspi2.0-0 \
 libc6 \
 libcairo2 \
 libcups2 \
 libdbus-1-3 \
 libdrm2 \ 
 libevent-2.1-7 \
 libexpat1 \
 libflac8 \
 libfontconfig1 \
 libfreetype6 \
 libgbm1 \
 libgcc-s1 \
 libglib2.0-0 \
 libjpeg62-turbo \
 libjsoncpp24 \
 liblcms2-2 \
 libminizip1 \
 libnspr4 \
 libnss3 \
 libopenjp2-7 \
 libopus0 \
 libpango-1.0-0 \
 libpng16-16 \
 libpulse0 \
 libre2-9 \
 libsnappy1v5 \
 libstdc++6 \
 libwebp6 \
 libwebpdemux2 \
 libwebpmux3 \
 libx11-6 \
 libxcb1 \
 libxcomposite1 \
 libxdamage1 \
 libxext6 \
 libxfixes3 \
 libxkbcommon0 \
 libxml2 \
 libxrandr2 \
 libxslt1.1 \
 libx11-xcb1 \
 libxcb-dri3-0 \
 libpangocairo-1.0-0 \
 libgtk-3-0 \
 zlib1g


ADD index.js .
ADD package.json .

RUN npm install

ENTRYPOINT ["npm", "start"]
