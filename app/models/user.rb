class User < ActiveRecord::Base
  belongs_to :person

  after_commit :send_devise_pending_notifications

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

 #Active Job usando Sucker Punch, para enviar los email de Devise.

  def send_devise_notification(notification, *args)
      if changed?
        devise_pending_notifications << [ notification, args ]
      else
        devise_mailer.send(notification, self, *args).deliver_later
      end
      # devise_mailer.send(notification, self, *args).deliver_later
  end

  def send_devise_pending_notifications
      devise_pending_notifications.each do |notification, args|
        devise_mailer.send(notification, self, *args).deliver_later
      end
      @devise_pending_notifications = []
  end

  def devise_pending_notifications
      @devise_pending_notifications ||= []
  end

end
