xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0' do
  xml.channel do
    xml.title 'Writeabout'
    xml.description 'Recent prompts'
    xml.link root_url

    @prompts.each do |prompt|
      xml.item do
        xml.title prompt.full_prompt
        xml.pubDate prompt.created_at.to_fs(:rfc822)
        xml.link ''
        xml.guid ''
      end
    end
  end
end
