FROM ruby:2.6.6

RUN apt-get -y update -y && apt-get -y upgrade && apt-get install -y build-essential curl git

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock /usr/src/app/
RUN bundle check || bundle install
COPY . /usr/src/app/

EXPOSE 3000

CMD ["irb"]
