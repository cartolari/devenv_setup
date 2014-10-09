# Development environment setup
This script will turn your machine into a development environment.
It'll install a bunch of tools like vim, ruby, python, wget, curl, etc.
This will be done using ansible. If the system have ansible installed
it'll be used, otherwise a new version will be downloaded.

## Running the script
The only thing you need is a version of ruby installed, and you should
run the install.rb script
The script will generally need to run as sudo, since it'll install things
on a machine. To run the script, simple clone the repository and run a

```bash
sudo ./install.sh
```

## Supported OS
Today the only supported OSs (at least for now) are Debian derivatives
