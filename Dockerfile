FROM ruby:2.6.6

RUN apt-get -y update -y && apt-get -y upgrade && apt-get install -y build-essential curl git
RUN mkdir -p /usr/src/app
ADD . /usr/src/app/
WORKDIR /usr/src/app
RUN gem install bundler
RUN bundle install
CMD ["ruby", "/usr/src/app/test/integration_test.rb"]
