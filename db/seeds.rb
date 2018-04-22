# Initialize Admin User
 if User.find_by(email: "admin@test.com").nil?
   u = User.new
   u.email = "admin@test.com"           # 可以改成自己的 email
   u.password = "123456"                # 最少要六码
   u.password_confirmation = "123456"   # 最少要六码
   u.is_admin = true
   u.name = "bingo"
   u.sex = "男"
   u.age = "18"
   u.position = "Ruby"
   u.save
   puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
 else
   puts "Admin 已经建立过了，脚本跳过该步骤。"
 end
