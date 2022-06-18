module CollectionsHelper
  def iiif_image_tag base_url, size
    image_tag "#{base_url}/full/#{size},/0/default.jpg"
  end
end
