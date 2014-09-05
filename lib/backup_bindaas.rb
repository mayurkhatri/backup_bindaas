require "backup_bindaas/version"
require "yaml"

module BackupBindaas
  class Backup
    def backup(args)
      puts "Jai maata di"
      config = YAML.load_file('config/database.yml')
      development_details = Hash.new
      production_details = Hash.new
      config.each do |environment, details|
        if environment.equals("development")
          development_details["adapter"] = details["adapter"]
          development_details["database"] = details["database"]
          development_details["username"] = details["username"]
          development_details["password"] = details["password"]
        elsif  environment.equals("production")
          production_details["adapter"] = details["adapter"]
          production_details["database"] = details["database"]
          production_details["username"] = details["username"]
          production_details["password"] = details["password"]
        end
      end
      if args.eql?("dev") || args.eql?("development")
        # TODO run mysqldump command
        puts "before sh command"
        sh "mysqldump -u #{development_details["username"]} -p#{development_details["password"]} #{development_details["database"]} > ~/projects/indian_food/testbackup1.sql")
        puts "Backup successful"
      end
    end
  end
end
