class User < ApplicationRecord
  has_many :favs
  has_many :favcds, through: :favs, source: :cd
  has_many :orders
  has_one :cart

  scope :active, -> { where(deleted: false)}
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザーのログイン情報を破棄する
 def forget
   update_attribute(:remember_digest, nil)
 end

 #カート周りの機能
 def order(cd)
 end

 #カート登録判定
 def  ordered?(cd)
    self.ordercds.include?(cd)
 end

 #お気に入り周りの機能
 def like(cd)
  favs.find_or_create_by(cd_id: cd.id)
 end

 def unlike(cd)
    fav = favs.find_by(cd_id: cd.id)
    fav.destroy if fav
 end

 #お気にり登録判定
 def  favcd?(cd)
    self.favcds.include?(cd)
 end


end
