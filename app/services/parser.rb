class Parser
  def self.parse_collection url: 
    col_obj = IIIF::Service.parse(fetch(url))
    col_id = col_obj["@id"]
    col_lbl = Array(col_obj["label"]).first

    # TODO: if we find it, we probably want to wipe out old manifests and images
    col = Collection.find_or_create_by(manifest_url: col_id)
    col.label = col_lbl

    col.manifests = col_obj.manifests.map do |mf|
      parse_manifest(url: mf["@id"])
    end

    col.save
    col
  end

  def self.parse_manifest url: 
    mf_obj = IIIF::Service.parse(fetch(url))
    mf_id = mf_obj["@id"]
    mf_lbl = Array(mf_obj["label"]).first
    mf_htm = mf_obj["rendering"]["@id"]

    man = Manifest.find_or_create_by(manifest_url: mf_id)
    man.label = mf_lbl
    man.html_url = mf_htm

    image_urls = mf_obj.sequences.first&.canvases&.map do |can|
      img_service = can["images"].first["resource"]["service"]
      img_service["@id"] if img_service
    end&.compact
    man.images = (image_urls || []).map { |url| Image.find_or_create_by(image_url: url) }

    man.save
    man
  end

  def self.fetch(url)
    response = Faraday.get(url)
    response.body
  end
end
