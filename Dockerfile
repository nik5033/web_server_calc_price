FROM ruby:2.7

WORKDIR /usr/src

COPY ./Gemfile* ./
RUN bundle install

COPY . .

EXPOSE 5678

CMD ["ruby", "http_server.rb"]
