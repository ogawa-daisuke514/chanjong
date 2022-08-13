ProcessType = Struct.new( :id,
  :name, :arg_type, :children_count, :in_unit, :in_type, :out_unit, :out_type,
  :head_word, :middle_word, :tail_word,
  :outline, :parent
)

ProcessTypes = []
ProcessTypes << ProcessType.new( 0,
  "True", nil, 0, nil, nil, :any, :any,
  "不問", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 1,
  "False", nil, 0, nil, nil, :any, :any,
  "構築不能", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 2,
  "Includes", nil, 1, :out, :out, :any, :any,
  nil, nil, "を含む",
  "", nil
)
ProcessTypes << ProcessType.new( 3,
  "ConsistsOf", nil, 1, :set, :out, :any, :any,
  nil, nil, "からなる",
  "", nil
)
ProcessTypes << ProcessType.new( 4,
  "AllOf", nil, 1, :set, :out, :any, :any,
  nil, nil, "の全種",
  "", nil
)
ProcessTypes << ProcessType.new( 5,
  "Is", nil, 1, :out, :out, :any, :any,
  nil, nil, "である",
  "", nil
)
ProcessTypes << ProcessType.new( 6,
  "Split", nil, -1, :out, :out, :any, :any,
  nil, "と", nil,
  "", nil
)
ProcessTypes << ProcessType.new( 7,
  "NTimes", :num, 1, :out, :out, :any, :any,
  nil, nil, "_ARG個",
  "", nil
)
ProcessTypes << ProcessType.new( 8,
  "And", nil, -1, :out, :out, :any, :any,
  nil, "かつ", nil,
  "", nil
)
ProcessTypes << ProcessType.new( 9,
  "Or", nil, -1, :out, :out, :any, :any,
  nil, "または", nil,
  "", nil
)
ProcessTypes << ProcessType.new( 10,
  "Not", nil, 1, :out, :out, :any, :any,
  nil, nil, "でない",
  "", nil
)
ProcessTypes << ProcessType.new( 11,
  "Combine", nil, -1, :out, :out, :any, :any,
  "それぞれ", "となり、", "となるようなもの",
  "", nil
)
ProcessTypes << ProcessType.new( 12,
  "CombineArray", nil, -1, :out, :out, :any, :any,
  nil, "と", nil,
  "", 11
)
ProcessTypes << ProcessType.new( 13,
  "CombineCount", :num, 1, :out, :out, :any, :any,
  nil, nil, "_ARG個",
  "", 12
)
ProcessTypes << ProcessType.new( 14,
  "Every", nil, 1, :out, :out, :any, :any,
  "各々が", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 15,
  "Counts", nil, 1, :out, :out, :any, :any,
  nil, nil, "を含む(複数で重複)",
  "", nil
)
ProcessTypes << ProcessType.new( 16,
  "PartOf", nil, 1, :out, :out, :any, :any,
  nil, nil, "の一部である",
  "", nil
)
ProcessTypes << ProcessType.new( 17,
  "Same", nil, 0, nil, nil, :any, :any,
  "同じ", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 18,
  "Different", nil, 0, nil, nil, :any, :any,
  "異なる", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 19,
  "Piece", :exposed, 1, :piece, :tile, :piece, :tile,
  "_ARG", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 20,
  "PieceChild", :piece, 0, nil, nil, :piece, :tile,
  "_ARG", nil, nil,
  "", 19
)
ProcessTypes << ProcessType.new( 21,
  "ATile", :exposed, 0, nil, nil, :tile, :tile,
  "_ARG牌", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 22,
  "Sequence", :num, 0, nil, nil, :any, :num,
  "_ARGつ違い", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 23,
  "OneColored", nil, 0, nil, nil, :any, :tile,
  "一色である", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 24,
  "TilesAre", nil, 1, :tile, :out, :piece, :any,
  "牌ごとで", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 25,
  "NumberIs", nil, 1, :out, :num, :any, :tile,
  "数字が", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 26,
  "ColorIs", nil, 1, :out, :color, :any, :tile,
  "色が", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 27,
  "NumberKindIs", nil, 1, :out, :num, :any, :tile,
  "数字の種類が", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 28,
  "Tiles", nil, -1, :set, :tile, :set, :tile,
  "牌種を指定:", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 29,
  "TilesPred", :tile, 0, nil, nil, :set, :tile,
  "_ARG", nil, nil,
  "", 28
)
ProcessTypes << ProcessType.new( 30,
  "Numbers", nil, -1, :set, :num, :set, :num,
  "数字を指定:", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 31,
  "NumPred", :tile_num, 0, nil, nil, :set, :num,
  "_ARG", nil, nil,
  "", 30
)
ProcessTypes << ProcessType.new( 32,
  "Colors", nil, -1, :set, :color, :set, :color,
  "色を指定", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 33,
  "ColPred", :color, 0, nil, nil, :set, :color,
  "_ARG", nil, nil,
  "", 32
)
ProcessTypes << ProcessType.new( 34,
  "Chanfon", nil, 0, nil, nil, :set, :tile,
  "荘風牌", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 35,
  "Menfon", nil, 0, nil, nil, :set, :tile,
  "門風牌", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 36,
  "Yaochuu", nil, 0, nil, nil, :set, :tile,
  "幺九牌", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 37,
  "Routou", nil, 0, nil, nil, :set, :tile,
  "老頭牌", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 38,
  "CharTile", nil, 0, nil, nil, :set, :tile,
  "字牌", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 39,
  "NextOf", nil, 1, :set, :tile, :set, :tile,
  nil, nil, "のネクスト牌",
  "", nil
)
ProcessTypes << ProcessType.new( 40,
  "DoraPred", nil, 0, nil, nil, :set, :tile,
  "ドラ表示牌", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 41,
  "UraDoraPred", nil, 0, nil, nil, :set, :tile,
  "裏ドラ表示牌", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 42,
  "KanDoraPred", nil, 0, nil, nil, :set, :tile,
  "槓ドラ表示牌", nil, nil,
  "", nil
)
ProcessTypes << ProcessType.new( 43,
  "KanUraPred", nil, 0, nil, nil, :set, :tile,
  "槓裏ドラ表示牌", nil, nil,
  "", nil
)

ProcessTypes.freeze

ARGS = {}
ARGS[:num] = [1,2,3,4,5,6];
ARGS[:tile_num] = [1,2,3,4,5,6,7,8,9];
ARGS[:tile] = ["1m", "2m", "3s"];
ARGS[:color] = ["萬子", "筒子", "索子"];
ARGS[:exposed] = ["", "明", "暗"];
ARGS[:piece] = ["対子", "順子", "刻子"];

ARGS.freeze