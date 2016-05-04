# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

User.destroy_all
Store.destroy_all
AdminUser.destroy_all
Booking.destroy_all

u1 = User.create!(name: 'Jasmeet',email: 'jascee.gtbit@gmail.comz',password: '12345678')
u2 = User.create!(name: 'JasmeetS',email: 'jascee.gtbit@gmail.comn',password: '12345678')
u3 = User.create!(name: 'JasmeetSi',email: 'jascee.gtbit@gmail.comno',password: '12345678')
u4 = User.create!(name: 'JasmeetSin',email: 'jascee.gtbit@gmail.comnop',password: '12345678')


s1 = Store.create!(name: 'Wasser',email: 'sabhi@gmail.com',password: '12345678')
s2 = Store.create!(name: 'Grundfos',email: 'sabhi@gmail.com1',password: '12345678')
s3 = Store.create!(name: 'Wilo',email: 'sabhi@gmail.com12',password: '12345678')
s4 = Store.create!(name: 'Mugerilal',email: 'sabhi@gmail.com123',password: '12345678')


u1.bookings.create!(store: s1,status: 'Complete',Service_type: 'Electrical')
u2.bookings.create!(store: s2,status: 'Pending',Service_type: 'Plumbing')
u4.bookings.create!(store: s3,status: 'Complete',Service_type: 'Plumbing')
u1.bookings.create!(store: s2,status: 'Pending',Service_type: 'Carpenter')
u1.bookings.create!(store: s1,status: 'Pending',Service_type: 'Building Material')
u2.bookings.create!(store: s2,status: 'Complete',Service_type: 'Painting')
u3.bookings.create!(store: s3,status: 'Pending',Service_type: 'Plumbing')
u4.bookings.create!(store: s3,status: 'Pending',Service_type: 'Electrical')

AdminUser.create!(email: 'jascee.gtbit@gmail.com', password: 'unclejoy', password_confirmation: 'unclejoy')
AdminUser.create!(email: 'manpreet28111995@gmail.com', password: 'unclejoy', password_confirmation: 'unclejoy')




