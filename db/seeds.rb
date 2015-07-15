# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User_list =[
  ["baothi246@gmail.com","123456"],
  ["baothi@gmail.com","123456"],
  ["baothi2@gmail.com","123456"],
  ["baothi4@gmail.com","123456"],
  ["baothi6@gmail.com","123456"],
  ["baothi46@gmail.com","123456"],
  ["baothi26@gmail.com","123456"]
]
User_list.each do |email,password|
 User.create(email: email, password: password)
end

Profile_list = [
  ["thi","bao","2015-07-14 12:40:03.455414",1],
  ["thi1","bao1","2015-07-14 12:40:03.455414",1],
  ["thi2","bao2","2015-07-14 12:40:03.455414",2],
  ["thi22","bao22","2015-07-14 12:40:03.455414",2],
  ["thi3","bao3","2015-07-14 12:40:03.455414",3],
  ["thi4","bao4","2015-07-14 12:40:03.455414",4],
  ["thi44","bao44","2015-07-14 12:40:03.455414",4],
  ["thi7","bao77","2015-07-14 12:40:03.455414",7]
]

profiles = Array.new
Profile_list.each do |fristname,lastname,brithday,user_id|
  profiles << {
    fristname: fristname,

    ...
    locations_attributes:[
      ....
    ]
  }

 # Profile.create(fristname: fristname, lastname: lastname,brithday: brithday, user_id: user_id)
end

Profile.create(profiles)

# Location_list = [
#   ["so 13 duong 30 phuong an phu",1],
#   ["so 18 duong trang nao quan 2",1],
#   ["thi2",2],
#   ["thi22",2],
#   ["thi3",3],
#   ["thi4",4],
#   ["thi44",4],
#   ["thi7",7]
# ]
# Location_list.each do |address,profile_id|
#  Location.create(address: address, profile_id: profile_id)
# end