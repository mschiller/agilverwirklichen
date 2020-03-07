#Paperclip.options[:command_path] = "/usr/bin"
#Paperclip::Attachment.default_options[:storage] = :fog
#Paperclip::Attachment.default_options[:fog_credentials] = {:provider => "Local", local_root: "#{Rails.root}/public"}
#Paperclip::Attachment.default_options[:fog_directory] = ""
#Paperclip::Attachment.default_options[:fog_host] = "http://localhost:3000"}

# use old and buggy attachment path
Paperclip::Attachment.default_options.update({
  url: "/system/:attachment/:id/:style/:filename",
  path: ":rails_root/public/system/:attachment/:id/:style/:filename"
})

#Paperclip.registered_attachments_styles_path = '/tmp/config/paperclip_attachments.yml'
