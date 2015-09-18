require 'chefspec'
require 'chefspec/berkshelf'
require 'spec_helper'


describe 'mapr-spark::default' do
  let(:chef_run) {
    ChefSpec::SoloRunner.new(platform: 'centos', version: '6.6').converge(described_recipe)
  }

  before do
    stub_command('hadoop fs -stat /apps/spark').and_return(false)
  end

  it 'should have installed "mapr-spark"' do
    expect(chef_run).to install_package('mapr-spark')
  end

  it 'should have installed "mapr-spark-historyserver"' do
    expect(chef_run).to install_package('mapr-spark-historyserver')
  end

  it 'should configure maprfs correctly' do
    expect(chef_run).to run_execute('hadoop fs -mkdir -p /apps/spark')
    expect(chef_run).to run_execute('hadoop fs -chmod 777 /apps/spark')
  end

  it 'should run configure.sh -R' do
    expect(chef_run).to run_execute('/opt/mapr/server/configure.sh -R')
  end
end
