class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups
  has_many :posts
  has_many :group_relationships
  has_many :participated_groups, :through => :group_relationships, :source => :group
  def is_member_of?(group)
       participated_groups.include?(group)
    end
end
