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

end
