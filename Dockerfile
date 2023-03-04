FROM allsoftware/symfony:5-php-8.1-v1

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN tar vxf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN cp wkhtmltox/bin/wk* /usr/local/bin/

RUN apt-get -y update && apt-get install -y \
php-exif \
git \
zip \
unzip \
nodejs \
mcrypt \
zlib1g-dev \
libgmp-dev \
libfontconfig1 \
libxrender1 \
libxml2-dev \
libxslt-dev \
php-soap \
yarn \
gitlab-runner \
libz-dev libzip-dev \
nano \
libfontconfig1 \
libxrender1 \
libwebp-dev \
libjpeg62-turbo-dev \
libpng-dev \
libfreetype6-dev \
zlib1g-dev \
libicu-dev \
exiftool \
g++

RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-configure xsl \
&& docker-php-ext-install -j$(nproc) pdo_mysql \
&& docker-php-ext-install soap zip gd xsl intl \
&& docker-php-ext-install -j$(nproc) gmp opcache
RUN docker-php-ext-configure exif \
&& docker-php-ext-install exif \
&& docker-php-ext-enable exif


