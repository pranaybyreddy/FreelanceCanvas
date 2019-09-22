# Project 6: Freelance Canvas Web Application

### Roles 
   - Pranay: Overall Manager
   - Yi: Implementation Manager 
   - Trevor: Test Manager 
   - Zhengqi: Documentation Manager 

### How to get start?

#### Environment setup
```ruby
$ bundle update 
$ bundle install
$ rails s
```

#### Create an account
1. Click the sign up button 
2. Fillout correct information 
3. An email would send to you mailbox. Remind that the link in the confirmation email is using prefix: 'localhost:3000/'. Please click that link on your localhost. Don't click that on your phone as it's not deployed to a server yet. If the link doesn't work (you cannot access an localhost url, then you need to do the following
```ruby
  $ rails c 
  >> User.find_by(name: "example").confirm
  >> exit
  $ rails s
```
4. After confirm, login the website with correct password
5. Explore various feature, which includes Post a photo, Follow other users, like a public post, make a comment, Update profile, and etc..

#### Install imagemagick

1. If you're on Mac OS X, you'll want to run the following with Homebrew:
```bash
brew install imagemagick
```

2. If you are on Ubuntu (or any Debian base Linux distribution), you'll want to run the following with apt-get:
```bash
sudo apt-get install imagemagick -y
```


### Description

The orginial idea was derived from the 500 px website, a photo sharing website for professional photographers. Our webiste extend the original feature and allow the users to present their work to the internet. The way to use this website is pretty easy. As a public user, you can visite all the work that had posted by the current users. However, in order to interact with the authoer (such as leave a comment, like..), you must register an account to be a valid user. To register an account, you need to click the login button in the top right corner and fill out all required information. After the registration, you have the right to post your work and see all you followers and who you are following as well. In the Post page, you can see all the posts that you had published. In the Profile page, you can modify you information and update them. To create a new page, you need to go to page file and click "New Post", then you can create a new post. 

### Roles

* Overall Project Manager: Pranay Byreddy
* Coding Manager: Zhengqi Dong 
* Testing Manager: Trevor Shirey
* Documentation: Yi Zhao

### Contributions: 

* Pranay Byreddy: Implemented form partial for comments. Implemented controller, view for comments, added validations, fixed rediretion issues. Added front end design using bootstrap for homepage.
* Zhengqi Dong: implemeted the View for layout (includes header/footer partials, and the stylesheet in custom.css), wrote and tested the routes for welcome, worte and test the model and controller for users.
* Trevor Shirey: Implemented Like MVC using general implementation. 
* Yi Zhao: 
   - Implemented Devise User MVC. (Email verification, adding profile to user, adding customized column on User. Adding association with like, post, follow and corresponding helper functions. Adding all views into '/views/users' to make front end looks nice and clean.)
   - Implemented Follow(Relationship) MVC. (Create all views in '/views/relationships'. Create '.js.erb' file to implement follow (Ajax implementation). Create controller and model for relationship to implemented following functionality.) . 
   - Implemented Post MVC. (Create all views in '/views/post'. Implemented model and controller for post.)
   - Implemented Like MVC (Ajax implementation). (Create create.js.erb and destroy.js.erb in '/views/likes/'. Create association with post & user. Implemented Model and Controller.)
   - Modified Comment MVC. (Associate comments with user, add verifications on delete button, change views (locates in "/views/posts/show") to make it looks nice.)
   - Adding Stylesheets to all views written to make it looks nice.


