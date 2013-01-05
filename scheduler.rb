require "yaml"

class Vehicle 
  attr_accessor :make, :model, :customer, :date, :status
  
  def initialize(make,model,customer,date,status)
    @model    = model
    @make     = make
    @customer = customer
    @date     = date
    @status   = status 
  end

  def id
    "#@make #@model from #@customer"
  end  
end


class Jobs
  attr_accessor :jobs, :date
  def initialize(date,*veh_array)
    @jobs   = []
    @date   = date
    
    if File.exists?(@date + ".yaml")
      load
    else
      veh_array.each {|i| 
        i.select {|vehicle| vehicle.date == @date}.each {|vehicle| add_veh(vehicle) }}
    end
    
    save
  end
  
  def load
    @jobs = open(@date + ".yaml") { |f| YAML.load(f) }
  end
  
  def save
    open(@date + ".yaml", 'w') { |f| YAML.dump(@jobs, f) }
  end

  def add(vehicle)
      @jobs << vehicle
      save
  end
  
  def which_cars_are(status)
    @jobs.select {|vehicle| vehicle.status == status}
  end
end

def add_a_vehicle(vehicle)
  Jobs.new(vehicle.date).add(vehicle)
end
