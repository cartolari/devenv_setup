require 'spec_helper'

describe 'devenv' do
  describe file('/usr/local/bin/ag') do
    it { is_expected.to be_executable  }
  end
end
