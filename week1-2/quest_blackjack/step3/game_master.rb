
require_relative './deck'
require_relative 'player'
require_relative './dealer'
require_relative './judge'
require_relative './user'
require_relative './cpu_player'


#ゲームの流れを実行するクラス
class GameMaster
  include JudegModule

  def initialize
    #52枚のカード作成してデッキ作る。ドローはデッキから行う。
    @card = Card.new
    @deck = Deck.new

    # Deckクラスのインスタンスを渡して参照できるようにしている。
    @user = User.new(@deck, "あなた")
    @dealer = Dealer.new(@deck, "ディーラー")

    #プレイヤーとディーラーのインスタンスを渡す。バーストとかの条件分岐はここでする。
    @judge = Judge.new(@user, @dealer)
  end

  def start
    puts '----------------------------------------------'
    puts 'ブラックジャックを開始します。'
  end

  #プレイヤーの人数選択
  def choose_player_count
    puts 'プレイ人数を選んで下さい。'
    puts '1人から3人まで選べます!'
    print '1〜3の数字を選んで下さい。'
    loop do
      case player_count = gets.chomp.to_i
      when 1
        puts "#{player_count}人でプレイします。"
        first_turn(player_count)
        break
      when 2
        puts "#{player_count}人でプレイします。"
        @cpu_one = CpuPlayer.new(@deck, "CPU1")
        first_turn(player_count)
        break
      when 3
        puts "#{player_count}人でプレイします。"
        @cpu_one = CpuPlayer.new(@deck, "CPU1")
        @cpu_two = CpuPlayer.new(@deck, "CPU2")
        first_turn(player_count)
        break
      else
        puts '1,2,3のいずれかを入力してください。'
      end
    end
  end

  #最初の2枚ドローのターン
  def first_turn(player_count)
    #ディーラーの最初の処理
    @dealer.first_draw
    @dealer.second_draw

    #プレイヤーの最初の処理
    @user.first_draw(2)

    #プレイヤーの人数による分岐
    player_count_judge(player_count)
  end

  #選ばれたプレイヤーの人数によってCPUの追加分岐
  def player_count_judge(player_count)
    case player_count
    when 1
      return
    when 2
      @cpu_one.first_draw(2)
    when 3
      @cpu_one.first_draw(2)
      @cpu_two.first_draw(2)
    end
  end

  # プレイヤーのヒットするかどうかの判断とその繰り返しメソッド呼び出す。バーストしたら終了に分岐。
  def player_draw_turn
    score = @user.select_thing
    if burst?(score)
      puts 'バーストしました。あなたの負けです。'
      end_turn
    else
      dealer_draw_turn
    end
  end

  # プレイヤーのヒットが終わったら呼び出される。バーストしなければ得点の比較に入るジャッジターンを呼び出す。
  def dealer_draw_turn
    @dealer.show_second_draw
    score = @dealer.total_score
    if burst?(score)
      puts 'バーストしました。'
      puts 'プレイヤーの勝ちです。'
      end_turn
    else
      judge_turn
    end
  end

  #ジャッジクラスの勝敗決めを呼び出す。
  def judge_turn
    @judge.game_judge
    end_turn
  end

  #終了見せる
  def end_turn
    puts 'ブラックジャックゲームを終了します。'
    puts '----------------------------------------------'
  end

  def game_start
    start
    choose_player_count
    player_draw_turn
  end

end


game_master = GameMaster.new
game_master.game_start