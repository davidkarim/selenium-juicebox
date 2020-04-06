# frozen_string_literal: true

require 'selenium-webdriver'
require 'pry'

# Item component
class Item < Site
  def select_item(item)
    item += 1
    sleep 2
    path = "mat-table > mat-row:nth-child(#{item}) > " \
    'mat-cell.mat-cell.cdk-column-Image.mat-column-Image.ng-star-inserted > img'
    element = @driver.find_element css: path
    element.click
    sleep 2
    path = '#mat-dialog-0 > app-product-details > mat-dialog-content > div > h1'
    element = @driver.find_element css: path
    element.text
  end

  def place_in_basket(item)
    item += 1
    path = "mat-table.mat-table > mat-row:nth-child(#{item}) > " \
    'mat-cell.mat-cell.cdk-column-Select.mat-column-Select.ng-star-inserted > ' \
    'button.mat-icon-button.ng-star-inserted > span > svg'
    element = @driver.find_element css: path
    element.click
    sleep 1
    path = 'div.heading > div.ng-star-inserted > p'
    element = @driver.find_element css: path
    element.text
  end
end