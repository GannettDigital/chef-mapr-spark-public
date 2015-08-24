package 'mapr-spark'
package 'mapr-spark-historyserver'

execute 'hadoop fs -mkdir /apps/spark' do
  not_if 'hadoop fs -stat /apps/spark'
end

execute 'hadoop fs -chmod 777 /apps/spark'
execute '/opt/mapr/server/configure.sh -R'
