FROM ruby:3.1.2

RUN apt-get update && apt-get install -y nodejs postgresql-client
# RUN apt-get update && apt-get install -y bash build-base nodejs postgresql-client tzdata

RUN mkdir /ruby-examples
WORKDIR /ruby-examples

COPY Gemfile Gemfile.lock ./
RUN gem install bundler --no-document
RUN bundle install --no-binstubs --jobs $(nproc) --retry 3

ADD . /ruby-examples

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
