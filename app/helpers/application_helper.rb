module ApplicationHelper
  def default_meta_tags
    {
      site: 'Recipist',
      title: '作ったレシピの記録サイト',
      reverse: true,
      charset: 'utf-8',
      description: 'Recipistを使えば自分が作ったレシピを、レシピサイトのURLと一緒に記録し、シェアすることができます。',
      keywords: '料理,レシピ,ご飯',
      canonical: request.original_url,
      separator: '|',
      # icon: [
      #   { href: image_url('ogp.png') },
      #   { href: image_url('top_image.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      # ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.jpeg'),
        local: 'ja-JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@odendayoko',
        image: image_url('ogp.jpeg'),
      }
    }
  end
end

    
