package 'mapr-spark' do
  version node['mapr']['versions']['spark']
end

package 'mapr-spark-historyserver' do
  version node['mapr']['versions']['spark']
end

execute 'hadoop fs -mkdir -p /apps/spark' do
  not_if 'hadoop fs -stat /apps/spark'
end

execute 'hadoop fs -chmod 777 /apps/spark'
execute '/opt/mapr/server/configure.sh -R'
