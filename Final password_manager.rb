#Tasks:
#1/ Make uniquePassword? and uniqueService? (can we include "?" in method names?)
#2/ Make remove method
#3/ Make services method
#4/ Make password_for
#5/ Later: add / update / sort_by

class PasswordManager2

    def initialize
        @passwords = [
            {'service' => 'facebook', 'password' => 'qwerty', 'added_on' => '28/7/22'},
            {'service' => 'amazon', 'password' => 'pwrd123', 'added_on' => '29/7/22'}
        ]
    end

    def uniquePass(pass)
    end

    def uniqueServ(service)
    end

    def add
    end

    def remove
    end

    def services
    end

    def sort_by
    end

    def password_for
    end

    def update
    end
end
