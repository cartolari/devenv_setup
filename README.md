# Development environment setup
This script will turn your machine into a development environment.
It'll install a bunch of tools like vim, ruby, python, wget, curl, etc.
This will be done using ansible. If the system have ansible installed
it'll be used, otherwise a new version will be downloaded.

## Installing
The script will generally need to run as sudo, since it'll install things
on a machine. To run the script, simple clone the repository and run a

```bash
sudo ./install.sh
```

## What this script provides
To see the list of what packages will be installed check the
[vars file](roles/devenv/vars/main.yml)

Beyond the packages in the [vars file](roles/devenv/vars/main.yml)
some components will be installed by 3rd party roles:
  - Ruby 2.1.3 (managed by chruby\*)
  - Java 1.8u25 (configured with alternatives, so no need to change path)
  - Ag the silver searcher (a really fast substitute for grep in development
  environments)
  - Vagrant (development environments in a virtual machine)
  - Docker (run your apps into lightweight containers)

\* chruby requires you to source a file before start to work if you use bash
this is done automatically by adding a file in /etc/profiles.d/. But if you do
not use bash you need to do that in your shell rc script (if it's zsh you can
do in your ~/.zshrc). For chruby to work just add the following lines in your
rc file:
```bash
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
```

## Supported OS
Today the only supported OSs (at least for now) are Debian derivatives

## Running the tests
This script contains tests for guaranteeing that it works properly (at least in
a recent version of Ubuntu).

The tests are written in Ruby using RSpec and ServerSpec.

If you want to run the tests you'll need Ansible, Vagrant and therefore
Virtualbox, and ruby(for all of these dependencies you can first run the
script in the target machine)

With all dependencies installed run a
```ruby
bundle install
```
to install the test libraries and after that run
```ruby
bundle exec rake
```
this will create a virtual box machine provision it and run the tests against it.
