# ゲストアカウント
user = User.new(
    email: 'guest@example.com',
    name: 'ゲストアカウント',
    guest: true
)
user.save(validate: false)