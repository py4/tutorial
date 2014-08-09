module ApplicationHelper
	def get_name user
		user.firstname + " " + user.surname
	end

	def persian_number(str)
		str = str.to_s if str.class == Fixnum
    str ? str.unpack('U*').map{ |e| (0..9).to_a.include?(e-48) ? e + 1728 : e }.pack('U*') : ''
  end

  def persian_date(date)
    (date ? persian_number(JalaliDate.new(date).format("%A %d %b %Y - %H:%m")) : '').split('-')[0]
  end

  def coderay(text)  
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do  
      CodeRay.scan($3, $2).div(:css => :class)  
    end  
  end  

  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end
  
end
