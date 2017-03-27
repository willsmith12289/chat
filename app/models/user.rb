class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_attached_file :avatar, styles: { medium: '152x152#', thumb: "80x80>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


  def name
    email.split('@')[0]
  end
end
