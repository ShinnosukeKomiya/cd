require "date"

def full_title(page_title)
  base_title = "KomiReco Online"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

# ログインする
def sign_in_as(user)
  post login_path, params: { session: { email: user.email,
                                      password: user.password } }
end
