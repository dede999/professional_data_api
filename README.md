# Professional Data API

## Table of Contents
1. [**About It**](#about-it)
2. [**Getting things ready**](#get-things-ready)
    1. [**Installing Ruby and Rails**](#install-ruby-on-rails)
    2. [**Configuring environment**](#environment)
3. [**Contributing**](#contributing)
4. [**Notes to Consider**](#notes)

<a name="about-it"></a>
## About it

This API is meant for showing your professional and/or 
scientific data in a simple way, so you can concentrate 
further on your front end. 

This software is being built by software developers and
mostly FOR developers as well. It does not mean you have
to have a major on computer science to use it. It means
you have to know how to use a terminal and deploy it. More
than it, you may have to know to build your own front
end or how to embed this API elsewhere. This project's
goals are quite simple: build an structure with which 
you can use and create collections as you please.

Fist versions will come with built-in collections as will be
mentioned. However, it would be amazing if someone could
create others on the fly. Make the API become adaptive to
each ones' needs, with no need to create other files and
migrations. This is a plan for the future. 

As long as this future doesn't come, you can clone this repo
and extend it as you please. For documentation on how this API
works, check out the Wiki when it's ready.

Enough talking, let's get to the code

<a name="get-things-ready"></a>
## Getting things ready

<a name="install-ruby-on-rails"></a>
### Installing Ruby and Rails

``` console
# Installing ruby with rbenv
user@pc $ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
user@pc $ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
user@pc $ echo 'eval "$(rbenv init -)"' >> ~/.bashrc
user@pc $ source ~/.bashrc
user@pc $ type rbenv # Type this if you want to check if it worked

user@pc $ rbenv install -l # lists the versions of ruby
user@pc $ rbenv install `the version you chose` # it installs the version you chose
user@pc $ ruby [-v|--version] # if something went wrong on the way, 
                            # this command may not print the version
> ruby 2.5.5p0 (2018-12-25 revision 66547) [x86_64-linux]
user@pc $ gem install rails
user@pc $ rails [-v|--version] # checking if everything went right
> Rails 5.2.2 # The version it's used in this project
```

``` console
# Installing Ruby without rbenv
# There are no big differences between the options if you pay close attention
user@pc $ sudo apt update 
user@pc $ sudo apt install ruby-full
user@pc $ ruby [-v|--version] 
> ruby 2.5.5 (2018-12-25 revision 66547) [x86_64-linux] # the version it's used in this project
user@pc $ gem install rails 
user@pc $ rails [-v|--version] 
> Rails 5.2.2 # The version it's used in this project
```

Now we have everything installed, we can now to to the 
next step.

<a name="enviroment"></a>
### Configuring environment

In order to create an environment for development,test
and production, there are some steps to go through.

``` console
user@pc $ export PG_USER='user'
user@pc $ export PG_PSW='My Not So Secret Password'
        => I hope you are more creative than this xD
user@pc $ export YOUR_KEY='Be smart and create a safe key'
user@pc $ gem install bundler # just in case you don't have it installed yet
user@pc $ bundle install #install dependencies
user@pc $ rake db:create # create database
user@pc $ rake db:migrate # run migrations
```

#### About the Environment Variables

According to the site [Computer Hope](https://www.computerhope.com/jargon/e/envivari.htm), 
An environment variable is a dynamic "object" on a computer,
containing an editable value, which may be used by one or
more software programs. In this project there are 3 very
important ones
* `PG_USER` -- PostgrSQL username [1](#postgres)
* `PG_PSW` -- PostgrSQL password [1](#postgres)
* `APP_KEY` -- Whenever you try to make a POST|PUT|PATCH request
    you'll need to have this key [2](#app-key)

You have two manners of including these variables. First is
shown above. The other manner, but a little less safe is 
creating an `.env` file. It will offer you no headaches if
you keep this file on the `.gitgnore` 

<a name="contributing"></a>
## Contributing

Feel free to use, clone and fork this project. And don't 
hesitate to leave your Pull Request (PR) in case you fell
have you have something in mind to make this more useful
and/or accessible. There is a lot of things to implement,
so fell free to come along. 

<a name="notes"></a>
## Notes to Consider

<a name="ruby-v"></a>
### Ruby Version
It's 2.5.5 by now, but I will change.

<a name="postgres"></a>
### PostgreSQL variables
Gotta check this, but likely to be useless on production

<a name="app-key"></a>
### App Key
Since it's a single-user application, I found no need to
create an authentication system. This env variable is set
to allow data changing requests to be accepted for those
who know this key only.
