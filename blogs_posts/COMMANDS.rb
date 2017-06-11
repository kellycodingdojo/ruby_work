#Create 5 users 
User.create(first_name: 'Mike', last_name: "Jones", email: "mikejones@who.com")
User.create(first_name: 'Michael', last_name: "Scott", email: "boss@dundermifflin.com")
User.create(first_name: 'Jim', last_name: "Halper", email: "jim@halpert.com")
User.create(first_name: 'Dwight', last_name: "Schrute", email: "bears.beets@battlestar.com")
User.create(first_name: 'Andy', last_name: "Bernard", email: "wadodododo@andy.com")
#Create 5 blogs 
Blog.create(name: "8004", description: "2813308004")
Blog.create(name: "Kellys Vehicle History", description: "Epic")
Blog.create(name: "Urinal Cleanliness and YOU", description: "How not to be a slob")
Blog.create(name: "Beer Digest", description: "Frequently")
Blog.create(name: "World's Cutest Puppies", description: "Michelles idea")
#Have the first 3 blogs be owned by the first user
User.first.owners.create(blog: Blog.first)
Blog.find(2).owners.create(user: User.first)
Owner.create(blog: Blog.third, user: User.first)
#Have the 4th blog you create be owned by the second user
Blog.find(4).owners.create(user: User.find(2))
#Have the 5th blog you create be owned by the last user 
Blog.find(5).owners.create(user: User.last)
#Have the third user own all of the blogs that were created
Owner.all.update_all(user_id: User.find(4).id)
#Have the first user create 3 posts for the blog with an id of 2.
Post.create(title: "I got hit by a jerk", content: "It was a sad day", user: User.find(1), blog: Blog.find(2))
Post.create(title: "I got hit by another jerk", content: "It was an expensive day", user: User.find(1), blog: Blog.find(2))
Post.create(title: "I got while parked", content: "It was a frustrating day", user: User.find(1), blog: Blog.find(2))
#Remember that you shouldn't do Post.create(user: User.first, blog_id: 2) but more like Post.create(user: User.first, blog: Blog.find(2)). Again, you should never reference the foreign key in Rails. Have the second user create 5 posts for the last Blog. Have the 3rd user create several posts for different blogs. Have the 3rd user create 2 messages for the first post created and 3 messages for the second post created Have the 4th user create 3 messages for the last post you created. 
#Change the owner of the 2nd post to the last user. 
Post.find(2).update(user: User.last)
#Change the 2nd post's content to be something else. 
Post.find(2).update(content: "It was a ******** expensive day!!")
#Retrieve all blogs owned by the 3rd user
User.find(3).blogs
# Retrieve all posts that were created by the 3rd user
User.find(3).posts
#Retrieve all messages left by the 3rd user
User.find(3).messages
#Retrieve all posts associated with the blog id 5 as well as who left these posts
Post.joins(:user, :blog).where(blog: Blog.find(5)).select("*")
#Retrieve all messages associated with the blog id 5 along with all the user information of those who left the messages Grab all user information of those that own the first blog (make this work by allowing Blog.first.owners to work). 
Message.joins(:user).where(post: Blog.find(5).posts).select("*")
#Change it so that the first blog is no longer owned by the first user.
Owner.find_by(blog: Blog.first).update(user: User.fourth)