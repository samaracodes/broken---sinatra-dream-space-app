Specifications for the Sinatra Assessment
*******************************************

Specs:

 [x] Use Sinatra to build the app

 [x] Use ActiveRecord for storing information in a database

 [x] Include more than one model class (e.g. User, Post, Category)
   *******User & Dream_post*******

 [x] Include at least one has_many relationship on your User model 
    (e.g.   User has_many Posts)
   *******User has many Dream Posts*******

 [x] Include at least one belongs_to relationship on another model 
    (e.g. [ ]Post belongs_to User)
   *******Dream Post belongs to User*******

 [x] Include user accounts with unique login attribute (username or email)

 [x] Ensure that the belongs_to resource has routes for Creating, Reading,
    Updating and Destroying
   *******User has full CRUD on dream posts*******

 [x] Ensure that users can't modify content created by other users
  *******Don't show edit or delete links, also use helper method in controller to ensure edit and delete actions can only happen if current user owns the entry.*******

 [x] Include user input validations
   *******Users cannot put in empty posts*******

 -----------------------------------------------------------------------
 BONUS - not required - 
  [x] Display validation failures to user with error    
    message (example form URL e.g. /posts/new)
    *******Used flash gem to display error messages throughout app*******

  [X]Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
  ----------------------------------------------------------------------
Confirm

 [x]You have a large number of small Git commits
 [x]Your commit messages are meaningful
 [x]You made the changes in a commit that relate to the commit message
 [x]You don't include changes in a commit that aren't related to the 
    commit message