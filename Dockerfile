FROM ruby:2.5
RUN apt-get update
RUN apt-get install -y postgresql-client

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bin/rails", "server"]
