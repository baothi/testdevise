module Admin::AdminsHelper
  def gravatar_for(admin_admin, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(admin_admin.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: admin_admin.name, class: "gravatar")
  end
end
