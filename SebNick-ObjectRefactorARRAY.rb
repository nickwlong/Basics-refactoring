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

    def uniquePass(pass)
        !@manager.any?{|account| account.password == pass}
    end

    def uniqueServ(serv)
        !@manager.any?{|account| account.service == serv}
    end

    def add(service, password)
        @manager << Account.new(service, password) if uniquePass(password) && uniqueServ(service)
    end

    def remove(service)
        @manager.delete_if{|account| account.service == service}
    end

    def services
        @manager.map{|account| account.service}
    end

    def sort_by(type, order = nil)

        if type == 'service'
            @manager.sort_by!{|account| account.service}
        elsif type == 'added_on'
            @manager.sort_by!{|account| account.time}
        end

        @manager.reverse! if order == 'reverse'

        @manager.map{|account| account.service}
    end

    def password_for(service)
        @manager.find{|account| account.service == service}.password
    end

    def update(service, new_password)

        account = @manager.find{|account| account.service == service}

        if uniquePass(new_password)
            account.password = new_password
            account.time = Time.now
        end
    end    
end

pm2 = PasswordManager2.new

pm2.add('netflix', 'qwerty')
pm2.add('facebook', 'LOL123')
pm2.add('github', 'code111')
pm2.add('github', 'yes123')
pm2.add('wooo','qwerty')

p pm2.services








