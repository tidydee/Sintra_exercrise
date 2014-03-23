class Message < ActiveRecord::Base
  # validates :title, 
  #           presence: true,
  #           length: { minimum:3 }

  validates :author, 
            presence: true,
            length: { minimum:3 }

  validates :content,
            presence: true,
            length: { minimum:3 }

  validates_format_of :url, with: URI.regexp


  # def validate(url)
  #   unless uri?message.url == %w( http https ).include?(uri.scheme) 
  #     message.url.errors[:url] << 'The URL you entered is incorrect! Please insert a valit URL.'
  #   end
  # end
  
end