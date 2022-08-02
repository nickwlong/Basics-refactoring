class PasswordManager2

    def initialize
        @passwords = [
            {'service' => 'facebook', 'password' => 'qwerty', 'added_on' => '28/7/22'},
            {'service' => 'amazon', 'password' => 'pwrd123', 'added_on' => '29/7/22'}
        ]
    end

    def uniquePass(pass)
        !@passwords.any? { |p| p["password"] == pass}
    end

    def uniqueServ(service)
        !@passwords.any? { |p| p["service"] == service}
    end

    def add(service, password)
        newHash = { 'service' => service, 'password' => password, 'time' => Time.now }
        
        if uniquePass(password) && uniqueServ(service)
            @passwords.push(newHash)
        end
    end

    def remove(service)
        @passwords.delete_if {|s| s['service'] == service}
    end

    def services
        @passwords.map {|e| e['service']}
    end

    def sort_by(type, order = nil)
        @passwords.sort_by! {|e| e[type].downcase}

        @passwords.reverse! if order == 'reverse'

        @passwords.map {|e| e['service']}
    end

    def password_for(service)
        @passwords.find {|e| e['service']==service}['password'] 
    end

    def update(service, new_password)
        if uniqPass(new_password)
            @passwords.find{|e| e['service'] == service}['password'] = new_password
            @passwords.find{|e| e['service'] == service}['updated_on'] = Time.now
        end
    end
end

