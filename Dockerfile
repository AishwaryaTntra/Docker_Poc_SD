FROM ruby:3.1.2

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \ 
    postgresql-client \
    nodejs \
    libqt5webkit5-dev \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

WORKDIR /Desktop/Sunrise_Trial
COPY Gemfile* ./
RUN bundle install
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
