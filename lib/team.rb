class Team
  attr_reader :roster, :player_count
  def initialize(name, city)
    @name = name
    @city = city
    @roster = []
    @player_count = get_roster_count
  end

  def add_player(player)
    @roster << player
    get_roster_count
  end

  def get_roster_count
    @player_count = @roster.length
  end

  def long_term_players
    @roster.find_all do |player|
      (player.contract_length / 12) > 2
    end
  end

  def short_term_players
    @roster.find_all do |player|
      (player.contract_length / 12) <= 2
    end
  end

  def total_value
    summed_value = 0
    @roster.each do |player|
      summed_value += player.total_cost
    end
    summed_value
  end

  def details
    {
      "total_value" => total_value,
      "player_count" => player_count
    }
  end

  def average_cost_of_player
    average_cost = total_value / player_count
    dollor_amount = "$#{average_cost.to_s}"
    #Yes its only for this situation,
    #I couldn't think of the right method for this
    if dollor_amount.length == 9
      dollor_amount.insert(6, ",").insert(3, ",")
    end
  end

  def players_by_last_name
    last_names = []
    @roster.each do |player|
      last_names << player.last_name
    end
    sorted_names = last_names.sort
    last_name_string = ""
    sorted_names.each do |name|
      last_name_string.concat(" #{name},")
    end
    last_name_string.chop!
    last_name_string.strip
  end
end