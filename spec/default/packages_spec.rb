require 'spec_helper'

describe 'devenv' do
  vars = Psych::load_file(File.expand_path('../../../roles/devenv/vars/main.yml', __FILE__))

  packages = vars['devenv_packages']['build'] +
    vars['devenv_packages']['editors'] +
    vars['devenv_packages']['general'] +
    vars['devenv_packages']['languages'] +
    vars['devenv_packages']['networking'] +
    vars['devenv_packages']['terminal'] +
    vars['devenv_packages']['version_control']

  packages.each do |pack|
    describe package(pack) do
      it { should be_installed }
    end
  end

  describe file('/usr/local/bin/ag') do
    it { is_expected.to be_executable  }
  end

end
