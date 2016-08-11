class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def sales?
    can_do_this = role == "sales"

    boss? || can_do_this
  end

  def boss?
    role == "boss"
  end
end
