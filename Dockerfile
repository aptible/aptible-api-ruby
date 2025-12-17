ARG RUBY_VERSION=2.3.1
FROM ruby:${RUBY_VERSION}

ARG BUNDLER_VERSION=1.17.3
ENV BUNDLER_VERSION=${BUNDLER_VERSION}
RUN if [ "${BUNDLER_VERSION}" != "" ] ; then \
      gem install bundler -v "${BUNDLER_VERSION}" ; \
    fi

WORKDIR /app
COPY Gemfile /app/
COPY aptible-api.gemspec /app/
RUN mkdir -p /app/lib/aptible/api/
COPY lib/aptible/api/version.rb /app/lib/aptible/api/

RUN bundle install

COPY . /app

CMD ["bash"]
