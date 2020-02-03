module UsersHelper

  def pretty_address(address)
    return "" unless address.present?
    [:line_1, :line_2, :city, :state, :pincode, :landmark].map{|address_attr| address.send(address_attr)}.compact.join('<br>')
  end
end
