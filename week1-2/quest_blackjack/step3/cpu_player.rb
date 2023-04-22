class CpuPlayer < Player
    def initialize(deck, name)
        super
    end

    def first_draw
        super
        add_hit
    end

    def hit
        super
    end

    #17以下の場合。追加でドローするかどうかの判断
    def add_hit
        return unless @current_score < 17

        hit

        total_score
    end

end