# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Store.destroy_all
AdminUser.destroy_all
StoreCategory.destroy_all
StoreSubCategory.destroy_all
Booking.destroy_all
RespondBooking.destroy_all
# --------------------------------------- Users  =------------------------------------------
u1 = User.create!(name: 'Jasmeet',email: 'jascee.gtbit@gmail.comz',password: '12345678')
u2 = User.create!(name: 'JasmeetS',email: 'jascee.gtbit@gmail.comn',password: '12345678')
u3 = User.create!(name: 'JasmeetSi',email: 'jascee.gtbit@gmail.comno',password: '12345678')
u4 = User.create!(name: 'JasmeetSin',email: 'jascee.gtbit@gmail.comnop',password: '12345678')

# --------------------------------------- Stores  =------------------------------------------
s1 = Store.create!(name: 'Wasser',email: 'sabhi@gmail.com',store_name: 'Medha',password: '12345678',address:'312,Chand Nagar,New Delhi-110018')
s2 = Store.create!(name: 'Grundfos',email: 'sabhi@gmail.com1',store_name: 'Lalit Sablania',password: '12345678',address:'312,DLF Phase,Gurgaon')
s3 = Store.create!(name: 'Wilo',email: 'sabhi@gmail.com12',password: '12345678',store_name: 'Medha Singh',address:'Z-5 , khyala, New Delhi')
s4 = Store.create!(name: 'Mugerilal',email: 'sabhi@gmail.com123',store_name: 'Harish',password: '12345678',address: 'CB-153/8, Naraina, Ring Road, New Dehi')

# --------------------------------------- Store Categories------------------------------------------
sc1 = StoreCategory.create!(category: 'Hardware Material')
sc2 = StoreCategory.create!(category: 'Plumbing Material')
sc3 = StoreCategory.create!(category: 'Painting Material')
sc4 = StoreCategory.create!(category: 'Electrical Material')
sc5 = StoreCategory.create!(category: 'Construction Material')

# --------------------------------------- Store Sub Categories------------------------------------------
 ssc11 = sc1.store_sub_categories.create!(subcategory: 'General Hardware work')
 ssc12 = sc1.store_sub_categories.create!(subcategory: 'Industrial Hardware work')

 ssc21 = sc2.store_sub_categories.create!(subcategory: 'General Plumbing work')
 ssc22 = sc2.store_sub_categories.create!(subcategory: 'Industrial Plumbing work')

 ssc31 = sc3.store_sub_categories.create!(subcategory: 'General Painting work')
 ssc32 = sc3.store_sub_categories.create!(subcategory: 'Industrial Painting work')

 ssc41 = sc4.store_sub_categories.create!(subcategory: 'General Electrical work')
 ssc42 =  sc4.store_sub_categories.create!(subcategory: 'Industrial Electrical work')

 ssc51 = sc5.store_sub_categories.create!(subcategory: 'General Construction work')
 ssc52 = sc5.store_sub_categories.create!(subcategory: 'Industrial Construction work')

# ----------------------------------------------Booking Categories ---------------------------------------

#u1.bookings.create!(status: 'Complete',store_category: sc1 ,address:'312 hajsn,naraina', store_sub_category: ssc11 )
#u2.bookings.create!(status: 'Pending',store_category: sc1 ,address:'3442 shyam Road,Gurgaon',store_sub_category: ssc12 )
#u4.bookings.create!(status: 'Complete',store_category: sc2 ,address:'312 hajsn,new delhi', store_sub_category: ssc21 )
#u1.bookings.create!(status: 'Pending',store_category: sc3 ,address:'312 hajsn,naraina', store_sub_category: ssc32 )
#bu1 = u1.bookings.create!(store_category: sc2 ,address:'32 han,naraina', store_sub_category: ssc22 )
#bu2 = u2.bookings.create!(store_category: sc5,address:'2 hajddfv,naraina', store_sub_category: ssc51 )
#bu3 =  u3.bookings.create!(store_category: sc4 ,address:'312 hadsfsfdn,naraina', store_sub_category: ssc42 )
#bu4 = u4.bookings.create!(store_category: sc4 ,address:'312 hajsdf,naraina', store_sub_category: ssc41 )

#---------------------------------------------Respond Bookings -------------------------------------------------
#s1.respond_bookings.create!(discount: '10', booking_id: bu1)
#s1.respond_bookings.create!(discount: '15', booking_id: bu2)
#s2.respond_bookings.create!(discount: '12',booking_id: bu1)
#s2.respond_bookings.create!(discount: '20', booking_id: bu4)
#----------------------------------------------------------------------------------------------------------------
AdminUser.create!(email: 'jascee.gtbit@gmail.com', password: 'unclejoy', password_confirmation: 'unclejoy')
AdminUser.create!(email: 'manpreet28111995@gmail.com', password: 'unclejoy', password_confirmation: 'unclejoy')




