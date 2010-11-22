
Then /^I am not finished here$/ do
  pending # express the regexp above with the code you wish you had
end


Given /^I created new task "([^"]*)" described "([^"]*)"$/ do |name , description|

    steps %Q{Given I am on the new_task page
		When I choose "task_priority_1"     
		When I fill in the following:
      | Nazwa     	     | #{name} 		    |
			| Opis      	     | #{description} |
			| Postęp    	     | 1						  |
			| Czas zakończenia | 2010-12-24		  | 
		When I press "przeslij"}

end



Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)"$/ do |email, password| #and login "([^\"]*)"$/ do |email, password, login|
  User.new(:email => email,
           #:login => login,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  #login = 'Testing man'
  password = 'secretpass'

  Given %{I have one user "#{email}" with password "#{password}"} # and login "#{login}"}
  And %{I go to the new_user_session page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end


def password
  "123abcde"
end

def create_my_user(params)
  unless user = User.find_by_email(params[:email])
    params[:password_confirmation] = params[:password]
    user = User.create!(params)
    ## This makes the user look 'confirmed'
    #user.update_attribute(:confirmation_token,nil)
    #user.update_attribute(:confirmed_at,Time.now)
  end
  user
end

Given /^I am logged in as (.*)$/ do |email|
    @current_user = create_my_user(:email => email, :password => password )
    visit new_user_session_path
    fill_in("Email", :with => email )
    fill_in("Password", :with => password )
    click_button("Sign in")
    #response.body.should =~ /Lista/
end
