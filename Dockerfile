FROM ruby:2.4.1-alpine

ENV RAILS_ROOT /opt/app
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

RUN set -x \
  && apk upgrade --no-cache \
  && apk add --no-cache --virtual build-dependencies \
    build-base \
    sqlite-dev \
    nodejs \
  && apk add --no-cache \
    libxml2-dev \
    libxslt-dev \
  && gem install --no-document nokogiri \
    -- --use-system-libraries \
    --with-xml2-config=/usr/bin/xml2-config \
    --with-xslt-config=/usr/bin/xslt-config \
  && gem install --no-document bundler rails

RUN bundle config --global jobs 4
ENV BUNDLE_PATH vendor/bundler

CMD ['echo' 'hi']
