require 'csv'
require "open-uri"

class CustomerImporter

  def update_customers
    CustomerCategory.leaves.all.each do |cat|
      update_customers_for(cat) unless cat.external_name.blank?
    end
  end

  def update_customers_for(category)
    zimbra_url = Figaro.env.zimbra_url
    username = Figaro.env.zimbra_username
    password = Figaro.env.zimbra_password

    category_names = category.self_and_ancestors.map(&:external_name).collect { |x| URI.escape(x) }.join('/')
    category_url = [zimbra_url, category_names].join('/') + '?fmt=json'

    begin
      json_file = open(category_url, :http_basic_authentication => [username, password])
    rescue
      return
    end

    json_text = File.read(json_file)
    json = JSON.parse(json_text)['cn']

    json.each do |json_customer|
      customer_attributes = {
          ext_id: json_customer['id'],
          email: json_customer['_attrs']['email'],
          email2: json_customer['_attrs']['email2'],
          firstname: json_customer['_attrs']['firstName'],
          surname: json_customer['_attrs']['lastName'],
          company: json_customer['_attrs']['company'],
          function: json_customer['_attrs']['jobTitle'],
          url: json_customer['_attrs']['workURL'],
          mobile_phone: json_customer['_attrs']['mobilePhone2'],
          postal_code: json_customer['_attrs']['workPostalCode'],
          street: json_customer['_attrs']['workStreet'],
          phone: json_customer['_attrs']['workPhone'],
          postcode_city: json_customer['_attrs']['workCity'],
          #vita: json_customer['_attrs']['notes'],
          newsletter: true
      }

      if !json_customer['_attrs']['email'].blank? and customer = Customer.where(ext_id: json_customer['id']).first || (Customer.where(email: json_customer['_attrs']['email'], firstname: json_customer['_attrs']['firstName'], surname: json_customer['_attrs']['lastName'])).first
        customer.update_attributes(customer_attributes)
      else
        customer = Customer.create(customer_attributes)
      end

      customer.customer_categories << category unless customer.customer_categories.include?(category)
    end
  end
end
