module Support
  module Auth
    def sign_in(login, pass)
      post session_url, params: {user: {email: login, password: pass}}
    end

    def sign_in_as(user)
      case user
      when :admin
        sign_in('admin1@test.home', '123')
      else
        raise "There is no user"
      end
    end
  end
end
