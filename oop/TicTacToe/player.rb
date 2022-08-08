class Player
  attr_reader :name
  attr_reader :marker

  def initialize(name, marker)
    @name = name.capitalize
    @marker = marker
  end
end
