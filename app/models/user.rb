class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :target_messages, :class_name => 'Message'
    has_many :sender_messages, :class_name => 'Message'
    has_many :sender_invites, :class_name => 'Invite'
    has_many :target_invites, :class_name => 'Invite'
    has_many :passwords, :dependent => :delete_all
    has_many :emails, :dependent => :delete_all
    has_many :organization_users, :dependent => :delete_all
    has_many :organizations, through: :organization_users
    has_many :invites
    has_many :comments, :dependent => :delete_all
    has_many :events, :dependent => :delete_all
    before_save :check_pasw_and_mail
    before_destroy :notify_org
    scope :activemail, ->{ joins(:emails).merge(Email.active)}
    private
    def check_pasw_and_mail
        self_psw_act_id = self.passwords.active.pluck(:id) 
        self_psw_active = self.passwords.active.pluck(:psw)
        self_mail_act_id = self.emails.active.pluck(:id) 
        self_mail_active = self.emails.active.pluck(:mail)
        total_mails_without_mine = Email.active.where.not(id:self_mail_act_id).pluck(:mail)
        total_passwords_without_mine = Password.active.where.not(id:self_psw_act_id).pluck(:psw)
        puts(total_passwords_without_mine)
        puts(self_psw_active)
    end
    def notify_org
        id_list = Organization.joins(organization_users: :users)
    end
end
