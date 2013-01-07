class Vehicle 
  attr_accessor :make, :model, :customer, :date, :status
  
  def initialize(make,model,customer,date,status)
    @model    = model
    @make     = make
    @customer = customer
    @date     = date
    @status   = status 
  end

  def to_s
    "#@make #@model from #@customer"
  end
end
