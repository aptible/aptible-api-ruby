ARG RUBY_VERSION=3.4
FROM ruby:${RUBY_VERSION}

RUN apt-get upgrade -y ca-certificates

RUN egrep '^mozilla/emSign_ECC_Root_CA_-_G3.crt|^mozilla/Comodo_AAA_Services_root.crt' /etc/ca-certificates.conf; [ $? -eq 1 ]

WORKDIR /app
COPY Gemfile /app/
COPY aptible-api.gemspec /app/
RUN mkdir -p /app/lib/aptible/api/
COPY lib/aptible/api/version.rb /app/lib/aptible/api/

RUN bundle install

COPY . /app

CMD ["bash"]
