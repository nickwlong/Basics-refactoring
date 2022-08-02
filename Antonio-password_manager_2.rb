class PasswordManager2
    def initialize
      @database = []
    end
    def add(string1, string2)
      if(!services.include?(string1)) && (!@database.map{|a| a.values[0]}.include?(string2))
      @database << {string1 => string2 , "Date" => Time.new}
      end
    end
    def password_for(string)
      return @database.find{|a| a[string]}.values[0]
    end
    def services
      return @database.map{|a| a.keys[0]}
    end
    def remove(string)
      @database.delete_if { |key,value| key.include? string }
    end
    def update(string1,string2)
      if(!@database.map{|a| a.values[0]}.include?(string2))
       @database[@database.find_index{|a| a.keys[0] == string1}][string1] = string2
      end
    end
    def sort_by(by, reverse = false)

      if(by == "service" ) 
        @output = @database.sort_by(&:to_a)
      elsif (by == "added_on")
        @output = @database.sort_by{|a| a["Date"]}
      end
      
      if reverse
        @output.reverse!
      end
      return @output.map{|a| a.keys[0]}
    end
  end

  # database = [ {"name1" => "pass1", "date" => "01.01.2000"}, {"name2" => "pass2", "date" => "02.02.2022"} ]
  