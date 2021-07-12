# Follow-along with josh

## High-level goals

- get from `rails new` to `logged in via github (devise & omniauth?)` in sub-ten-minutes
- do something not-stupid with the user that's logged in
- ignore twitter, fb, email for now?

# The process

Following [Devise, Omniauth & Rails Posted by Leonor Colbert on July 14, 2020](https://leonorpdx.github.io/devise_omniauth_and_rails).

## Generate the App
```shell
$ rails new devise_practice_02
// using rails 6.1

$ cd devise_practice_02

$ ga .
$ gc -m "initial commit"
```

update this readme, off to the races

## Add Devise

add to gemfile, `rails g devise:install` gives:

```
rails g devise:install
Running via Spring preloader in process 65108
      create  config/initializers/devise.rb
      create  config/locales/devise.en.yml
===============================================================================

Depending on your application's configuration some manual setup may be required:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

     * Required for all applications. *

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

     * Not required for API-only Applications *

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

     * Not required for API-only Applications *

  4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views

     * Not required *
```

I wanted a page to look at, so I set my root to basic html

when I add devise-related methods, like:

```html
<% if user_signed_in? %>
	  <h1>User is LOGGED IN! :)</h1>
<% else %>
	  <h1>User is NOT logged in! :(</h1>
<% end %>
```

I get:

```

NoMethodError in Main#index

Showing /Users/joshthompson/workspace/learning_ruby_rails/devise_practice_02/app/views/main/index.html.erb where line #3 raised:

undefined method `user_signed_in?' for #<ActionView::Base:0x007fa1fe422118>
```

Lets generate a model:

Now I'm working through: [https://hackernoon.com/using-devise-in-your-ruby-on-rails-application-a-step-by-step-guide-m92i3y5s](https://hackernoon.com/using-devise-in-your-ruby-on-rails-application-a-step-by-step-guide-m92i3y5s)

So far, best guide.

```
rails g devise User

> rails g migration add_name_to_users name:string surname:string
> rails db:migrate
> b rails s
```

Visit localhost:3000, and you're in luck! It works!

![its live](/public/images/2021-07-12at3.22PM.jpg)

If you look at commit `5126396`, you'll see these changes.

### localhost:3000/users/sign_up

So we get some devise routes, like `/users/sign_up`

Lets visit it. Create a user. hit "sign in", and... now I'm signed in.

Cool.

Let's make a Github application thing

https://github.com/settings/applications/new

I've now got https://github.com/settings/applications/1665283

In `config/initializers/devise.rb` near line 270:

```

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

```

Add the app id and secret from your fancy new github app




