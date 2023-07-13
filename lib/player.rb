class Player
  attr_reader :first_name, :last_name, :monthly_cost, :contract_length, :total_cost, :nickname
  def initialize(name, monthly_cost, contract_length)
    whole_name = name.split
    @first_name = whole_name[0]
    @last_name = whole_name[1]
    @monthly_cost = monthly_cost
    @contract_length = contract_length
    @total_cost = contract_length * monthly_cost
    @nickname = nil
  end

  def set_nickname(name)
    @nickname = name
  end
end