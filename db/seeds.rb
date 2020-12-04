#here is where I will create some seed data to work with and test associations

#Create 2 users
samara = User.create(name: "Samara", email: "sam@example.com", password: "password")
cameron = User.create(name: "Cameron", email: "cameron@example.com", password: "password")

# Create some dream posts

DreamPost.create(content: "Today is Tuesday and it's great", user_id: samara.id)

# Use ActiveRecord to pre-associate data:
samara.dream_posts.create(content: "We are building a SUPER FUN Sinatra App! YAY")
cameron.dream_posts.create(content: "Its 2AM and Im writing code!!!")


