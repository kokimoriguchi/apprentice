class CpuPlayer < Player
  def initialize(deck, name)
    super
  end

  def first_draw(draw_count = 0)
    super
    add_hit
  end

  def hit
    super
  end

  #17以下の場合。追加でドローするかどうかの判断
  def add_hit
    return unless @current_total_score < 17

    hit

    total_score
  end

end