class User < ActiveRecord::Base
    has_many
    has_secure_passsword

    validates_uniqueness_of(:username)
    
end