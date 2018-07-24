# Jungle

## About the project

A mini e-commerce application built with Rails 4.2. The visitor can create an account and then post comments on products and buy items he puts in his cart. If the visitor comes back, he can log into his account. The user's password is encrypted and only an admin can have access to the admin tab, which controls certain features like adding categories and new products.

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* sass-rails
* uglifier
* jquery-rails
* turbolinks
* jbuilder
* sdoc
* bcrypt
* puma
* bootstrap-sass
* font-awsome-rails
* money-rails
* carrierwave
* rmagick
* faker

## Getting Started

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Screenshots

#### Home page
!["main.png"](https://github.com/sylvain-gdk/jungle-rails/blob/master/docs/main.png)

#### Detail view (logged in user can delete it's own review)
!["review-delete.png"](https://github.com/sylvain-gdk/jungle-rails/blob/master/docs/review-delete.png)

#### Product - Admin page
!["product-admin.png"](https://github.com/sylvain-gdk/jungle-rails/blob/master/docs/product-admin.png)