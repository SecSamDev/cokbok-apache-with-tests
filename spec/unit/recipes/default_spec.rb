#
# Cookbook:: apache
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::default' do
  context 'When all attributes are default, on an CentOS 6.7' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'includes the install recipe' do
      expect(chef_run).to include_recipe('apache::install')
    end
    it 'includes the configuration recipe' do
      expect(chef_run).to include_recipe('apache::configuration')
    end
    it 'includes the service recipe' do
      expect(chef_run).to include_recipe('apache::service')
    end
  end
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'includes the install recipe' do
      expect(chef_run).to include_recipe('apache::install')
    end
    it 'includes the configuration recipe' do
      expect(chef_run).to include_recipe('apache::configuration')
    end
    it 'includes the service recipe' do
      expect(chef_run).to include_recipe('apache::service')
    end
  end
end
