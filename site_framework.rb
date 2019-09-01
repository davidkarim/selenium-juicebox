# frozen_string_literal: true

require 'selenium-webdriver'

# Site-wide component
class Site
  def initialize
    @driver = Selenium::WebDriver.for :chrome
    @driver.navigate.to 'https://dk-juiceshop.herokuapp.com'
  end

  def dismiss_welcome
    path = '//*[@id="cdk-overlay-0"]/snack-bar-container/app-welcome-banner/div/button/span'
    element = @driver.find_element xpath: path
    element.click
    path = '/html/body/div[1]/div/a'
    element = @driver.find_element xpath: path
    element.click
  end

  def resize_window
    @driver.manage.window.resize_to(1624, 800)
  end

  def login
    path = '//*[@id="navbarLoginButton"]/span'
    element = @driver.find_element xpath: path
    element.click
    element = @driver.find_element name: 'email'
    element.send_keys "#{ENV['EMAIL']}"
    element = @driver.find_element name: 'password'
    element.send_keys "#{ENV['PASSWORD']}"
    path = '//*[@id="loginButton"]/span'
    element = @driver.find_element xpath: path
    element.click
    @driver.title
  end

  def take_screenshot(filename)
    @driver.save_screenshot(filename)
  end

  def finish
    @driver.quit
  end
end
