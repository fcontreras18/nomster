namespace :db do
  desc "Fill database"
  task :populate => :environment do
    require 'faker'

    [Place, Photo].each

    #Place.all.each do  |place|
      # => Photo.picture = Faker::Avatar.image("random sentence", "250x250", "jpg")
      # Photo.create!(picture: Faker::Avatar.image("random sentence", "250x250", "jpg") )
    #Photo.all.each = { |photo| photo.avatar = File.open(Dir.glob(File.join(Rails.root, "random sentence", "250x250", "jpg")).sample); Photo.save! }
    
    Place.populate 2 do |place|
      place.name        = Faker::Company.name
      place.address     = Faker::Address.street_address
      place.description = Faker::Lorem.sentence      
    #   Photo.populate 10 do |photo|
    #     photo.caption     = Faker::Lorem.sentence
    #     photo.picture     = Faker::Avatar.image
    #   end    
    end

    # Place.all.each  |place| 
    #   photo.avatar = File.open(Dir.glob(File.join(Rails.root, "random sentence", "250x250", "jpg")).sample); photo.create! 
    # end
  end
end

# Places.all.each do  | place |
#   Photo.create!(picture: Faker::Avatar::image("random sentence", "250x250", "jpg") )
# end