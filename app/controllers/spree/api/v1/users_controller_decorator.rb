Spree::Api::V1::UsersController.class_eval do
  def login
    user = Spree.user_class.find_for_authentication(:email => params[:email])
    res = {}
    if user && user.valid_password?(params[:password])
      res[:error] = false
      res[:msg] = 'authentication succeeded'
      res[:email] = user.email
      res[:token] = user.spree_api_key
    else
      res[:error] = true
      res[:msg] = 'authentication failed'
    end
    @res = OpenStruct.new(res)
  end
end