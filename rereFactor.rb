class Account
    def initialize(service, password)
        @service = service
        @password = password
        @time = Time.now
    end

    attr_accessor :service, :password, :time
end


class PasswordManager2

    def initialize
        @manager = []
    end

    attr_accessor 'manager'

    def uniquePass(pass)
        !@manager.any?{|acc| acc.password == pass}
    end

    def uniqueServ(serv)
        !@manager.any?{|acc| acc.service == serv}
    end

    def add(service, password)
        @manager << Account.new(service, password)
    end

    def remove(service)
        @manager.delete_if{|acc| acc.service == service}
    end

    def services
        @manager.map{|acc| acc.service}
    end

    def sort_by(type, order = nil)

        if type == 'service'
            @manager.sort_by!{|acc| acc.service}
        elsif type == 'added_on'
            @manager.sort_by!{|acc| acc.time}
        end

        @manager.reverse! if order == 'reverse'

        @manager.map{|acc| acc.service}
    end

    def password_for(service)
        @manager.find{|acc| acc.service == service}.password
    end

    def update(service, new_password)

        acc = @manager.find{|acc| acc.service == service}

        if uniquePass(new_password)
            acc.password = new_password
            acc.time = Time.now
        end
    end    
end

pm2 = PasswordManager2.new








