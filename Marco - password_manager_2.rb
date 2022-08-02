# Requirements:
#   - Delete services (and their passwords)
#   - Track when a password was added
#   - Update passwords
#   - Track when a password was updated
#   - Ensure all service names are unique
#   - Ensure all passwords are unique
#   - Sort the list of services alphabetically and by date of password creation

class PasswordManager2
    def initialize
        @services = {}
        # e.g. {'Acebook' => {'password' => '123', added_on => 'Time.now'}}
    end

    # add - adds a service
    def add(service, password)
        # check if service doesn't exist
        service_unique = !@services[service]
        
        # check if all passwords doesn't match new password 
        password_unique = check_pass(password)

        if (service_unique && password_unique)
            @services[service] = { 'password' => password, 'added_on' => Time.now }
        end
    end

    # remove - deletes a service and its password
    def remove(service)
        @services.delete(service)
    end

    # services - returns a list of all services
    def services
        return @services.keys
    end

    # sort_by - sorts by service name or date added
    def sort_by(sorting_by, reverse = false)
        output = []
        # sort by alphabetically ('service')
        if sorting_by == 'service'
            output = @services.keys.sort
        end

        # sort by chronologically ('added_on')
        if sorting_by == "added_on"
            output = @services.sort_by do |service, info_hash|
                info_hash['added_on']
            end

            # output is an array i.e. [ [service, info_hash], ... ]
            # so need to map out just the first element from each listed array
            output = output.map { |service| service[0]}
        end

        # reverse if necessary
        if reverse
            output = output.reverse
        end

        return output
    end

    # password_for - returns the password for a specific service
    def password_for(service)
        return @services[service]['password']
    end

    # update - updates the password for a specific service
    def update(service, password)
        if (check_pass(password))
            @services[service]['password'] = password
            @services[service]['added_on'] = Time.now
        end
    end

    private

    # check if all passwords doesn't match new password 
    def check_pass(password)
        return @services.all? do |service, info_hash|
            info_hash['password'] != password
        end
    end
end
