require 'date'

class PasswordManager2
    def initialize
        @passwords = [

        ]
    end

    def password_exists(p)
        return @passwords.any? do |element|
            element["password"] == p
        end
    end

    def service_exists(s)
        return @passwords.any? {|element| element['service']== s}
    end

    def add(service, password)

        newservice = {}
        newservice['service'] = service
        newservice['password'] = password
        newservice['added_on'] = DateTime.now.strftime("%d/%m/%Y") 
        
        if not service_exists(service) || password_exists(password)
            @passwords.push(newservice)
        end
    end

    def remove(service)
        @passwords.delete_if {|element| element['service'] == service}
    end

    def services
        return @passwords.map {|element| element['service']}
    end

    def sort_by(input, reverse='no')
        @passwords.sort_by! {|services| services[input]}
        if reverse == 'reverse'
            @passwords.reverse!
        end
        return @passwords.map {|element| element['service']}
    end

    def password_for(service)
        return @passwords.find {|element| element['service']==service}['password'] 
    end

    def update(service, new_password)

        if not password_exists(new_password)
            @passwords.find{|element| element['service'] == service}['password'] = new_password
            @passwords.find{|element| element['service'] == service}['updated_on'] = DateTime.now.strftime("%d/%m/%Y")
        end
    end
end

