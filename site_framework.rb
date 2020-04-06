# frozen_string_literal: true

require 'selenium-webdriver'
require 'dotenv'

# Site-wide component
class Site
  def initialize
    Dotenv.load
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--ignore-certificate-errors')
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--disable-translate')
    prefs = {
      prompt_for_download: false, 
      default_directory: "~/Applications"
    }
    options.add_preference(:download, prefs)
    @driver = Selenium::WebDriver.for :chrome, options: options
    @driver.navigate.to "#{ENV['URL']}"
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

  def register_user
    path = '//*[@id="navbarLoginButton"]/span'
    element = @driver.find_element xpath: path
    element.click
    path = 'app-login.ng-star-inserted > div > mat-card > a:nth-child(3)'
    element = @driver.find_element css: path
    element.click
    path = '#emailControl'
    element = @driver.find_element css: path
    element.click
    element.send_keys 'test@email.com'
    path = '#passwordControl'
    element = @driver.find_element css: path
    element.click
    element.send_keys 'password'
    path = '#repeatPasswordControl'
    element = @driver.find_element css: path
    element.click
    element.send_keys 'password'
    sleep 1

    # path = 'div.mat-select-value'
    path = '#mat-select-4 > div > div.mat-select-value > span'
    path = '#mat-select-4 > div > div.mat-select-value > span'
    # path = '//*[@id="mat-select-2"]/div/div[1]'
    idname = 'mat-select-4'
    element = @driver.find_element(id: idname)
    binding.pry
    elements = element.find_elements tag_name: 'option'
    binding.pry
    elements.each { |option| option.click if option.text == "Mother's maiden name?" }
    sleep 1

    path = '#securityAnswerControl'
    element = @driver.find_element css: path
    element.click
    sleep 1
    element.send_keys 'MaidenName'
    path = '#registerButton > span'
    element = @driver.find_element css: path
    element.click
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

