module ApplicationHelper
  def default_meta_tags
    {
      site: 'Recipist',
      title: 'レシピの記録サイト',
      reverse: true,
      charset: 'utf-8',
      description: '日々の料理レシピを、レシピサイトのURLと一緒に記録し、シェアできます。',
      keywords: '料理,レシピ,ご飯',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: nil,
        local: 'ja-JP',
      },
      twitter: {
        card: 'summary_large_image',
        image: nil,
      }
    }
  end
end

    
