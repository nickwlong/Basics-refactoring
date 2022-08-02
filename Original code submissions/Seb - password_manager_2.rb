class PasswordManager2

    def initialize
        @passwords = []
    end


    def uniquePass(pass)
        if @passwords.any? { |p| p["password"] == pass}
            puts 'Password already exists, please try another one.'
            return false
        else 
            return true
        end
    end

    def uniqueServ(service)

        if @passwords.any? { |s| s["service"] == service}
            puts 'Service already exists, please use update password.'
            return false
        else
            return true
        end

    end

# add
# Adds a service and its password
# Ensure all passwords are unique
# Ensure all service names are unique
# Track when a password was added

    def add(service, password)
        time = Time.now

        hash = { 'service' => service, 'password' => password, 'time' => time }

        if uniquePass(password) && uniqueServ(service)
            @passwords.push(hash)
        else 
            return 'Unable to store password...'
        end
    end


# remove
# Deletes a service and its password
    
    def remove(service)
    
        @passwords = @passwords.filter{|s| s['service'] != service}

    end


# services
# Returns a list of all services

    def services

        return @passwords.map { |s| s['service'] }
    
    end


# sort_by
# Sorts by service name or date added
# Sort the list of services alphabetically and by date of password creation

    def sort_by(type, order = nil)

        arr = @passwords

        if type == 'service'
            
            arr.sort_by!{|s| s['service']}

            if order == 'reverse'
                arr.reverse!
            end
        elsif type == 'added_on'

            arr.sort_by!{|s| s['time']}

            if order == 'reverse'
                arr.reverse!
            end
        end

        @passwords = arr
        services

    end

# password_for
# Returns the password for a specific service

    def password_for(service)
        hash = @passwords.find{|s| s["service"] == service}
        return hash["password"]
    end


# update
# Update the passsword for a specific service
# Ensure all passwords are unique
# Track when a password was updated

    def update(service, password)
        if uniquePass(password)
            @passwords.filter_map{|s| s['password'] = password if s['service'] == service}
            @passwords.filter_map{|s| s['time'] = Time.now if s['service'] == service}
        end
    end

end
