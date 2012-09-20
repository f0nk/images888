class Item < ActiveRecord::Base
	has_many :pictures
	acts_as_taggable
	acts_as_taggable_on :categorys, :sources
end
