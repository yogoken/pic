namespace :cron do
  namespace :data do
    desc 'create finc.csv'
    task create: :environment do
    puts 'Yes you can create finc.csv'
    system("ls #{Rails.root}/log/")
      system("touch #{Rails.root}/log/finc.csv")
    end

    desc 'delete finc.csv'
    task delete: :environment do
      puts 'deleting i am deleting finc.csv'
      csv = "#{Rails.root}/log/finc.csv"
      system("rm #{csv}") if csv.presence
    end
  end
end
