class Account
    def initialize(password)
        @password = password
        @time = Time.now
    end

    attr_accessor :service, :password, :time
end


class PasswordManager2

    def initialize
        @manager = {}
    end

    def uniquePass(pass)
        !@manager.any?{|k,v| v.password == pass}
    end

    def uniqueServ(serv)
        !@manager.any?{|k,v| v.service == serv}
    end

    def add(service, password)
        @manager[service] = Account.new(password) if uniqueServ(service) && uniquePass(password)
    end

    def remove(service)
        @manager.delete(service)
    end

    def services
        @manager.keys
    end

    def sort_by(type, order = nil)

        arr = []

        if type == 'service'
            arr = @manager.keys.sort
        elsif type == 'added_on'
            arr = @manager.keys.sort_by { |service| @manager[service].time }
            p arr.map { |service| @manager[service].time }
        end

        order == 'reverse' ? arr.reverse : arr
    end

    def password_for(service)
        @manager[service].password
    end

    def update(service, new_password)
        if uniquePass(new_password)
            @manager[service].password = new_password
            @manager[service].time = Time.now
        end
    end    
end

pm2 = PasswordManager2.new

pm2.add('netflix', 'qwerty')
pm2.add('facebook', 'LOL123')
pm2.add('github', 'code111')
pm2.add('github', 'asdgfjhjn')

p pm2.services

p pm2.sort_by('added_on', 'reverse')






