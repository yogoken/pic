namespace :inactive_user do
  desc'Users中confirm_atから一週間が経過していれば削除'
  task :destroy_unconfirmed => :environment do
    User.all.each do |user|
      logger = Logger.new('log/inactive_user.log')
      logger.info "#{Time.now} -- destroy_unconfirmed_inactive_user -- #{user.to_yaml}"
      user.destroy if (Time.now > user.confirm_at + 1.weeks.ago)
    end
  end
end
