class Book < ApplicationRecord
  belongs_to :category
  has_one_attached :image 
  attribute :new_image #擬似的なカラムを用意(self.imageを受ける)
  validates :title,presence:true,length:{maximum:50}
  validates :price,presence:true,numericality:{
    only_integer:true,
    greater_than:1
  }
  validates :publish_date,presence: true
  validates :description,presence: true,length:{maximum:1000}
  
  before_save do
    self.image = new_image if new_image #画像データをself.imageに保存する
  end
end
