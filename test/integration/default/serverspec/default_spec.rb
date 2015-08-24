require 'serverspec'

set :backend, :exec

describe package('mapr-spark') do
  it { should be_installed }
end

describe package('mapr-spark-historyserver') do
  it { should be_installed }
end

describe command('su - mapr -c "hadoop fs -ls /apps/"') do
  its(:stdout) do
    should match %r{drwxrwxrwx.+/apps/spark}
  end
end
