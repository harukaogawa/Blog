if Rails.env == 'development'
  (1..100).each do |i|
      Post.create(name: "ユーザ#{i}", title: "タイトル#{i}", content: "本文#{i}")
  end

  Tag.create([
      { name: '生活' },
      { name: '仕事' },
      { name: '学校' },
      { name: 'お金' },
      { name: '恋愛' }
  ])
end