#
# Cookbook:: apache
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::configuration' do
  context 'When all attributes are default, on an Centos 6.7' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'creates user apache' do
      expect(chef_run).to create_user('apache')
    end
    it 'creates group apache' do
      expect(chef_run).to create_group('apache')
    end
    it 'creates the file index.html' do
      expect(chef_run).to create_template('/var/www/html/index.html').with(user: 'apache')
    end
    it 'renders the file index.html' do
      expect(chef_run).to render_file('/var/www/html/index.html').with_content(/Welcome Home/)
    end
  end

  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'creates user www-data' do
      expect(chef_run).to create_user('www-data')
    end
    it 'creates group www-data' do
      expect(chef_run).to create_group('www-data')
    end
    it 'creates the file index.html' do
      expect(chef_run).to create_template('/var/www/html/index.html').with(user: 'www-data')
    end
    it 'renders the file index.html' do
      expect(chef_run).to render_file('/var/www/html/index.html').with_content(/Welcome Home/)
    end
  end
end
