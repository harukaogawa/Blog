# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  title      :string(255)
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  # presence -> 必須チェック
  # length -> 文字数の制限
  validates :name, presence: true, length: { maximum: 10 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 1000 }
end
