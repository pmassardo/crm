# crm

  Heroku - https://serene-gorge-54750.herokuapp.com/

Things I would change...

  1. use Rails only for the backend and jquery or react for the front end.
  2. add a roles to the user, to allow for supervisors, etc. Currently a user can only see their accounts, appointments, etc.
  3. spend more time on the front end. I did not have enough time to get a thorough look at the Statflo site to make my site look like the Statflo site. So, I bootstrap'd it and made a few slight modifications.
  4. Maybe, eliminated primary tables AccountType and AppointmentType and just go with arrays storing just an integer in the database.

Uses PostgreSQL, Rails 4.2.6, built on a mac using OS X El Capitan V 10.11.6

The database design...

![Database](/work/crm.jpg?raw=true "Database")

If you are setup for PostgreSQL and Rails 4.2.6 on a mac then.

- Clone the repo
- Bundle install
- rake db:migrate
- rails server (it will be on localhost:3000)

 I think thats it?

---------------------------------------
The following was taken from https://github.com/bitmakerlabs/rails-dev-setup-guide

rbenv

brew install rbenv
This installs rbenv, a lightweight tool to manage different versions of Ruby. OS X comes with an old version of Ruby, but we'll generally want to have our own, newer versions of it.

Installing rbenv will automatically install ruby-build, a plugin for rbenv to conveniently install different versions of Ruby.

Now we need to modify our bash config. Copy and paste the following in your terminal.

echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
Then close terminal and re-open it (restart Terminal) to apply the changes.

If you look at your path:

echo $PATH
It should look something like:

/Users/username/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
Reloading your config has inserted /Users/username/.rbenv/shims to the beginning of your $PATH variable. This is necessary for rbenv to work its magic.



Ruby

To install ruby 2.3.0 (substitute this for the latest stable version of Ruby indicated on the Ruby website):

rbenv install 2.3.0
This may take a while. Feel free to get a coffee while you wait.

After this finishes, you can setup your global (default) Ruby:

rbenv global 2.3.0
Make sure the right version is running:

ruby --version
It should say ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15] or something similar.

Note that you can override this global setting per project. See Choosing the Ruby Version for more information.

You can install older versions of Ruby this way as well if you ever find yourself working on a project that relies on an older version.

RubyGems

RubyGems is a package management framework for Ruby. We use it to install Ruby apps such as Rails.

Run the following to update to the latest version:

gem update --system
Next run the following to install Bundler, which is required by Rails for managing your app's gems:

gem install bundler
Postgres

The easiest way to install this is via Postgres.app (http://postgresapp.com/). Download it, drag it to the applications folder, and then double-click to launch. While it's open, the database server is running (it adds an elephant icon to your taskbar). When you close it, the database server shuts down.

Postgres Command-Line Tools

Install the Postgres command-line tools as follows:

echo 'export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH' >> ~/.bash_profile
Close and reopen Terminal, and then run:

psql --version
It should say something like:

psql (PostgreSQL) 9.5.4
For more information: Postgres Documentation (http://postgresapp.com/documentation/)

Rails

You need to have Rails installed in order to create new Rails projects. After the project is created (or if you're working with an existing Rails project), you'll be using the bundled versions of Rails specific to your project.

For this course, we'll be using Rails 4.2.6.

gem install rails -v 4.2.6
Never run sudo in front of these gem commands, or it may install to the wrong folder.

Rails might take a while to install. When the installation is done, you can look at your installed gems by running

gem list
Verify that Rails is there and that the version is 4.2.6. Now run:

rails --version
It should say Rails 4.2.6.
---------------------------------------
