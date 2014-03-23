class Message < ActiveRecord::Base

  validates :author, 
            presence: true,
            length: { minimum:3 }

  validates :content,
            presence: true,
            length: { minimum:3 }

  validates_format_of :url, with: URI.regexp
  
end