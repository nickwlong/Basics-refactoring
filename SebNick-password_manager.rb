class PasswordManager2

    def initialize
        #Create an array to fill with hashes of data.
        @passwords = [
            {'service' => 'facebook', 'password' => 'qwerty', 'added_on' => '28/7/22'}, #Added a couple of examples for testing
            {'service' => 'amazon', 'password' => 'pwrd123', 'added_on' => '29/7/22'}
        ]
    end

    def uniquePass(pass)
        #Checks if the input password is unique, returns true if unique, false if already present.
        !@passwords.any? { |p| p["password"] == pass}
    end

    def uniqueServ(service)
        #As above but for service
        !@passwords.any? { |p| p["service"] == service}
    end

    def add(service, password)
        #Checks to see if arguments are unique, pushes a new hash to the array.
        if uniquePass(password) && uniqueServ(service)
            @passwords.push({ 'service' => service, 'password' => password, 'time' => Time.now })
        end
    end

    def remove(service)
        #Deletes the element from the array if the service == input
        @passwords.delete_if {|s| s['service'] == service}
    end

    def services
        #Produces an array of just the services
        @passwords.map {|e| e['service']}
    end

    def sort_by(type, order = nil)
        #sorts the array itself by type (have to downcase as capitals are alphabetically before lower cases)
        @passwords.sort_by! {|e| e[type].downcase}
        #if a second argument is given as 'reverse' then the order of the array is reversed.
        @passwords.reverse! if order == 'reverse'
        #produces a list of the services in order as determined above
        @passwords.map {|e| e['service']}
    end

    def password_for(service)
        #finds and returns the password for the input service
        @passwords.find {|e| e['service']==service}['password'] 
    end

    def update(service, new_password)
        #checks if the input password is unique. If so, replaces the existing password for a service with the new input. Also adds a new k:v for when it was updated.
        if uniqPass(new_password)
            @passwords.find{|e| e['service'] == service}['password'] = new_password
            @passwords.find{|e| e['service'] == service}['updated_on'] = Time.now
        end
    end
end

