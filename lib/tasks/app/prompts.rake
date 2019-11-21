namespace :app do
  desc 'Seed the database with all our prompts'
  task seed: :environment do
    require_relative '../../../db/seeds/states.rb'

    Rake::Task['app:seed:lookups'].invoke
    Rake::Task['app:seed:rights'].invoke
    Rake::Task['app:seed:states'].invoke
    
    puts 'Setting default account types, groups and charts...'
    execute_sql_file('sql/default_accounts.sql')
    puts 'Done.'
  end

  def execute_sql_file(file_name)
    seed_path = Rails.root.join('db','seeds')
    file_path = File.join(seed_path, file_name)
    sql = File.read(file_path)
    execute_sql(sql)
  end

  def execute_sql(sql)
    ActiveRecord::Base.connection.execute(sql)
  end
end