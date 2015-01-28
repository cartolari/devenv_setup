require 'spec_helper'

describe 'devenv' do
  vars = Psych::load_file(File.expand_path('../../../roles/devenv/vars/main.yml', __FILE__))
  default_ruby = vars['ruby_default_version']
  rubies = vars['ruby_install_ruby_versions']
  ruby_gems = vars['devenv_packages']['ruby_gems']

  describe file('/usr/local/share/chruby/chruby.sh') do
    it { is_expected.to be_file  }
  end

  rubies.each do |ruby_version|
    describe file("/opt/rubies/ruby-#{ruby_version}") do
      it { is_expected.to be_directory  }
    end
  end

  describe file('/usr/local/bin/ag') do
    it { is_expected.to be_executable  }
  end

  describe command("chruby-exec #{default_ruby} -- gem list") do
    ruby_gems.each do |gem|
      its(:stdout) { should include gem }
    end
  end

end
