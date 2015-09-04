class SignInPage
  include Capybara::DSL
  
  def login(username, password)
    within_frame 'iframeLogin' do
      fill_in 'signinField', :with => username
      fill_in 'password', :with => password
      find_by_id("signinButtonSend").click
    end
  end
  
end