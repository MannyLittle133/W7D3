# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string           not null
#
class User < ApplicationRecord
    validates :username, presence: true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6}, allow_nil: true
    before_validation :ensure_session_token

    attr_reader :password

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def ensure_session_token
        self.session_token ||= generate_session_token
    end

    def reset_session_token
        self.session_token = generate_session_token
        self.save! 
        self.session_token
    end

    private

    def generate_session_token 
        SecureRandom::urlsafe_base64
    end


end
