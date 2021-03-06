class Item
  attr_reader :name, :desc, :weight, :value
  
  def initialize(name, desc, weight, value=nil)
    @name = name
    @desc = desc
    @weight = weight
    @value = value
  end
  def to_s
    @name
  end
  def info
    "#@name : #@desc [#{@weight}g] [#{@value}sv]"
  end
  
  def type?(type)
    type.map(&:name).include?(self.name)
  end
end

class Doll < Item
  attr_reader :hp, :mp, :atk, :amr, :agl, :atr, :ret
  
  def initialize(name, desc, weight, value, hp: BASE_HP, mp: BASE_MP, atk: BASE_ATK, amr: BASE_AMR, agl: BASE_AGL, atr: BASE_ATR, ret: BASE_RET)
    super(name, desc, weight, value)
    @hp = hp
    @mp = mp
    @atk, @amr, @agl, @atr, @ret = atk, amr, agl, atr, ret
  end
  def info
    super + " [HP #@hp] [MP #@mp] [ATK #@atk] [AMR #@amr] [AGL #@agl] [ATR #@atr] [RET #@ret]"
  end
  
end

@dolls = []
@dolls << @doll_proto = Doll.new("인형 소체 프로토", "마네이드를 주입할 일반적인 인형.", 50, 100)
@dolls << @doll_alpha = Doll.new("인형 소체 알파", "공격 성능이 향상된 인형.", 50, 200, atk: 20)
@dolls << @doll_beta = Doll.new("인형 소체 베타", "방어 성능이 향상된 인형.", 50, 200, hp: 150, amr: 10, agl: -5, atr: 50)

class Equipment < Item
  attr_reader :part, :atk, :amr, :agl, :atr, :ret
  
  def initialize(name, desc, weight, value, part, atk: 0, amr: 0, agl: 0, atr: 0, ret: 0)
    super(name, desc, weight, value)
    @part = part
    @atk, @amr, @agl, @atr, @ret = atk, amr, agl, atr, ret
  end
  
end

@equipments = []
@equipments << @sword = Equipment.new("검", "표준적인 무기.", 5, 10, atk: 5)
