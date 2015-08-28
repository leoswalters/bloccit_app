# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


  require 'faker'

  # 50.times do
  #   Post.create!(
  #     title: Faker::Lorem.sentence,
  #     body: Faker::Lorem.paragraph
  #     )
  # end

  # posts = Post.all

  # 100.times do
  #   Comment.create!(
  #     post: posts.sample,
  #     body: Faker::Lorem.paragraph
  #     )
  # end

  # unique_post = Post.create!({title: "The Count of Monte Cristo", body: "This is such an amazing book!!!!"})

  # unique_post.comments.create!({body: "I also loved this book, so good!"})

  #if Post.find_by title: "The Hearts Code"
  if Post.uniq(title: "The Hearts Code")
    puts "That's already in the database!"
  else
    unique_post_3 = Post.create!({title: "Be Here Now", body: "A metaphysical classic!"})

    unique_post_3.comments.create!({body: "Yeah, Ram Dass is cool."})
  end

  puts "Seed finished"
  puts "#{Post.count} posts created"
  puts "#{Comment.count} comments created"

