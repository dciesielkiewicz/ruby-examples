FROM ruby:alpine

RUN apk update && apk add bash build-base nodejs postgresql-dev tzdata

RUN mkdir /ruby-examples
WORKDIR /ruby-examples

COPY Gemfile Gemfile.lock ./
RUN gem install bundler --no-document
RUN bundle install --no-binstubs --jobs $(nproc) --retry 3

ADD . /ruby-examples

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]