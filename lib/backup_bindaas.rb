require "backup_bindaas/version"
require "active_record"
module BackupBindaas
  class Backup
    def backup
      if ARGV[0].eql?("dev") || ARGV[0].eql?("development")
        # TODO run mysqldump command
        db_config = ActiveRecord::Base.configurations["development"]
        puts db_config
        sh "mysqldump -u #{db_config['username']} -p#{db_config['password']} #{db_config['database']} > ~/projects/indian_food/testbk.sql"
        puts "Backup successful"
      end
    end
  end
end
