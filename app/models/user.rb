class User < ApplicationRecord
    has_many :target_messages, :class_name => 'Message'
    has_many :sender_messages, :class_name => 'Message'
    has_many :sender_invites, :class_name => 'Invite'
    has_many :target_invites, :class_name => 'Invite'
    has_many :passwords, dependent: :destroy
    has_many :user_email, dependent: :destroy
    has_many :organization_users, dependent: :destroy
    has_many :organizations, through: :organization_users
    has_many :invites
    has_many :comments, dependent: :destroy
    has_many :events
    before_save :check_pasw_and_email

    private
    def check_pasw_and_email
        self_psw_act_id = self.passwords.active.pluck(:id) 
        self_psw_active = self.passwords.active.pluck(:psw)
        total_passwords_without_mine = Password.active.where.not(id:self_psw_act_id).pluck(:psw)
        total_passwords_without_mine.each do |item|
            print("_item a comparar: ")
            puts(item)
            print("mi psw: ")
            puts(self_psw_active)
            if item.eql?(self_psw_active.first)
                print("oops the password is already used...")
                return false
            end
        end
        print("Eureka, password unique ")
        puts(self_psw_active)
        return true
    end
end
