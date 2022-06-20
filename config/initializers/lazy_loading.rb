# set all images to lazy-loading to reduce impact of huge pages full of thumbs
Rails.application.config.action_view.image_loading = "lazy"
