require "backup_bindaas/version"
require "active_record"
module BackupBindaas
  class Backup
    def backup(args)
      puts "In lib file"
      puts args
      if args.eql?("dev") || args.eql?("development")
        # TODO run mysqldump command
        db_config = ActiveRecord::Base.configurations["development"]
        puts "Printing db config"
        puts db_config
        sh "mysqldump -u #{db_config['username']} -p#{db_config['password']} #{db_config['database']} > ~/projects/indian_food/testbk.sql"
        puts "Backup successful"
      end
    end
  end
end
