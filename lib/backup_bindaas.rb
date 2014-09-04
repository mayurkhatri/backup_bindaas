require "backup_bindaas/version"

module BackupBindaas
  class Backup
    def backup
      puts "Jai maata di"
      file = File.open("config/database.yml", "r");
      data = file.read
      file.close
      puts data
    end
  end
end
