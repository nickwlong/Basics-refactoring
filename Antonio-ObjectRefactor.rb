class PasswordManager2
  def initialize
    @serviceDB = []
  end
  def add(string1, string2)
    if(!@serviceDB.map{|a| a.service}.include?(string1)) && (!@serviceDB.map{|a| a.password}.include?(string2)) #checks if service and password is unique
    string1 = Database.new string1, string2
    @serviceDB << string1
    #adds the service, password, with date from class
  end
  end
  def password_for(string)
    return @serviceDB.select{|a| a.service == string}[0].password
    #selects the object from array with service matching the string and returns password
  end
  def services
    return @serviceDB.map{|a| a.service}
    #lists services
  end
  def remove(string)
    @serviceDB.delete(@serviceDB.select{|a| a.service == string}[0])
    #searches the object service matching the string and deletes it
  end
  def update(string1,string2)
    if !@serviceDB.map{|a| a.password}.include?(string2)
    @serviceDB.select{|a| a.service == string1}[0].password = string2
   end
   #checks if password is unique and then updates
  end
  def sort_by(by, reverse = false)

    if(by == "service" ) 
      @output = @serviceDB.sort_by{|a| a.service}.map{|a| a.service}
    elsif (by == "added_on")
      @output = @serviceDB.sort_by{|a| a.date}.map{|a| a.service}
    end
    #sorts by either service or date
    if reverse
      @output.reverse!
    end
    #reverses if reverse variable is given
    return @output
  end
end



class Database
  def initialize(service, password)
    @service = service
    @password = password
    @date = Time.new
  end
 
  attr_accessor "service","password","date"
  #initializes a new object and makes it available to access with attr_accessor
end