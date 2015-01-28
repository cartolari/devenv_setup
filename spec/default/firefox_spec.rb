require 'spec_helper'

describe 'devenv' do

  describe file('/usr/bin/firefox') do
    it { is_expected.to be_executable  }
  end

end
