require 'spec_helper'

describe package('hitch') do
  it { should be_installed }
end

describe service('hitch') do
  it { is_expected.not_to be_running }
end
