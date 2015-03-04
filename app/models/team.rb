class Team < ActiveRecord::Base
  has_and_belongs_to_many :tags

   validates :title, presence: {message: "- Team needs a title"}
    validates :title, uniqueness: { case_sensitive: false, message: "- Title should be unique" }
    validates_format_of :title, :with => /[a-zA-Z]/, message: "- Title should not contain numbers or symbols"

    validates :desc, presence: {message: "- Team needs a description"}
    validates :desc, length: { minimum: 5,
    maximum: 255, message: "- Please submit a description between 5-255 characters"}
end


