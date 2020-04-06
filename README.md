# selenium-juicebox

## Overview

This is an example of a Selenium testing framework. When these tests are run, Selenium Web Driver will execute the tests on the target website. In this case, the target is the OWASP Juice Box project. The OWASP Juice Box project is a project that was developed for penetration testing, but we can use it for functional testing and then later use our Selenium scripts to perform pen testing.

## Requirements

* Ruby
* Bundler
* [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/home)

## Initiating Tests

Register a test user on your site. The sample test site is located at https://dk-juiceshop.herokuapp

Clone this repo. Then, create a .env file that defines the environment variables:

```
export EMAIL=<registered_user_email>
export PASSWORD=<registered_user_password>
export URL=https://dk-juiceshop.herokuapp.com
```

Install the gems and run the tests:

```bash
> bundle install
# Run tests
> rspec -fd site_test.rb

OWASP Juice Box Website
  can login to the dashboard
  can navigate to an item
  can place items in basket

Finished in 24.81 seconds (files took 0.62725 seconds to load)
3 examples, 0 failures
```
