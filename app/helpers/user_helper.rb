module UserHelper
	def send_mail(to, subject, body)
		Pony.mail({
        :to => to,
        :from => "fenaravindhan@gmail.com",
        :subject => subject,
        :body => body,
        :via => :smtp,
        :via_options => {
          :address        => 'smtp.gmail.com',
          :port           => '587',
          :user_name      => 'fenaravindhan',
          :password       => ENV['MAIL_PASSWORD'],
          :authentication => :plain,
          :domain         => "gmail.com"
        }
      })
	end
end
