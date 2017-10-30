# Rails Routing, Partials, and CSS Challenge

Before attempting this challenge ensure that you have watch part 1 of my latest Rails CRUD videos. This challenge will give you practice with routing, view partials, and adding CSS to a Rails application.
During this challenge you may also have to research certain aspects of Rails by way of the Rails guides, the Rails API, and our Rails course notes.

* Rails Routing Guide
* Rails Views (Partials Section)
* Our Rails Overview Course Notes
* Official Rails API

If you get stuck at any point chat with some classmates or send me an email with a specific question.
Note: You should be using git throughout this challenge. You should have (at an absolute minimum) one commit per part.

## PART ZERO

You shold have ruby and rails set up with your vagrant 

Check:

    ruby -v 
    
    sqlit3 --version 
    
    rails --version 
    
in case of missiong rails

    gem install rails
    

## PART ONE - Routing Pages

* Create a new Rails application.

    ` rails new chanllenging_times `

* Add a controller to this application called pages.

    ` rails g controller pages `
    
* Add two actions to the controller, along with their views.
   
    * A home action with an associated view.
    * An about action with an associated view.    
    * Both views should include a h2 header and some lorem ipsum.
    
    ``` rails g controller pages home about ```

* Edit config/routes.rb to add routes for these two actions:
    * The root URL for your app should route to the home action
    ``` get '/', to: 'pages#home', as: 'root' ```
    * The /about URL for your app should route to the about action.
    ``` get 'about', to: 'pages#about', as: 'about' ```
    * Ensure that both routes are named using the “as” parameter.
    
* Create an HTML menu that includes links to both of the actions you created above:
    * Links should be built using the link_to helper making use of their route names.
    * The menu should be added to the application layout file.
    
* Edit config/routes.rb to change the URL associated with the about page from /about to /about_us and ensure that your menu still works. (You should not have to edit the application layout menu after this change has been made.)
    
    ``` get '/about_us', to: 'pages#about', as: 'about' ```
    
## PART TWO - Routing Lizards

Add a lizards action to your pages controller.
Create the associated view.
    ``` rails g controller pages lizard ```
Define a route for this action that includes a number parameter.
For example:
* get 'lizard/:number', to: 'pages#lizards', as: 'lizards'
    ``` get 'lizard/:number', to: 'pages#lizard', as: 'lizards', number: /\d+/ ```
* Set up the lizards action and view such that the view displays n lizard emoji, where n is the number included in the route.

``` ruby

  def lizard
    @lizards = "🦎" * (params[:number]).to_i
  end

```

For example, the following URL should display 56 lizard emojis:
**http://localhost:3000/lizards/56**

* Add three links to your home view that link to this lizards route using the link_to helper:
* The first should link to page that displays 12 lizards.
* The second should link to a page that display 444 lizards.
* The third should link to a page that display 9672 lizards.

## PART THREE - Menu Partial

* Take the menu you added to the application layout in part one and convert it to a partial. This partial can be saved to a new common sub-folder of your app/views folder.

* Render this menu partial from the application layout.

## PART FOUR - Faker Faker
    
* Generate a new model that includes at least two parameters. Base your model on something that the Faker gem can generate.
    
    `rails g model products name:string quantity:integer price:decimal `
* Add a few relevant validations to your new model.

    ` validates :name, :quantity, :price, presence: true` 
    
* Migrate the database table associated with this model.

    `rails db:migrate `
* Add the Faker gem to your Gemfile. (And then run: bundle install)

    `gem 'faker' `
    
    `bundle install`
    
    `bundle info faker` to validate
    
* Use the Faker gem along with the db/seeds.rb file to generate 100 entries in your new db table. (See my classroom CRUD repo if for an example of how to do this.)

``` ruby
    100.times do
        Products.create(name: Faker::Beer.name, quantity: Faker::Number.number(3), price: Faker::Number.decimal(2) )        
    end 
```
unique 
``` ruby

100.times do
  Product.create(name: Faker::Book.unique.title, quantity: Faker::Number.number(3), price: Faker::Number.decimal(2) )
end

```

* Don’t forget to run the seed task: ``` rails db:seed ```
``` ruby 
    rails db:migrate
    rails db:seed
```

## PART FIVE- I’m Partially Partial to Your Partial

* Add a new controller which is the plural of the model you created in part four. 
So if you created a Vehicle model, your controller will be called vehicles.

    ``` rails g controller products view ```
* Add a route/action/view to display the entire collection of objects from your new table. 
So, if you created a Vehicle model, your /vehicles URL should display all your vehicles.

    _``` get 'products', to: 'products#view', as: 'products' ```_ changed
    
    ``` get 'products', to: 'products#index', as: 'products' ```
* Add a route/action/view to display a single member from your new database table. 
So, continuing the Vehicle model example, the /vehicles/1 URL would display the first vehicle in the vehicles table. (Assuming your table includes an row with a primary key of 1.)

    ``` get 'products/:id', to: 'products#view', as: 'product', id: /\d+/ ```
* Similar to what I did in the Part 1 video, create a partial to remove the repetition in the two views you create in this part of the challenge. Continuing the Vehicle model example, you’d create a /app/views/vehicles/_vehicle.html.erb partial which you would then render in both views.

    ``` add partial _product.html.erb and modified index and view views of product```
## PART SIX - Style for Miles

* Add some CSS styling to your application to style your various pages.

    add [mian.scss](app/assets/stylesheets/main.scss) in the folder app/assets/stylesheets/ 

## PART SEVEN - GIT’R DONE

* Create a new repo on github call “Challenging-Times”.

* Add this github repo as a remote to your local challenge repo.
* Push all your local commits to this github repo.
* Zip up the challenge folder and submit it to the challenge dropbox.
* Submit the github repo URL as comment along with your submission.
