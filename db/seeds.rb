# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

toitsu = PieceDefinition.create(name: "対子", natural: true,  condition: Condition.from_array([:And, :Same, [:NTimes, 2, [:ATile, 0]]]))
mentsu = PieceDefinition.create(name: "面子", natural: false, condition: Condition.from_array(:False), piece_definitions: [
  PieceDefinition.create(name: "順子", natural: true,
  condition: Condition.from_array([:And, :OneColored, [:NumberIs, [:Sequence, 1]], [:NTimes, 3, [:ATile, 0]]])),
  PieceDefinition.create(name: "刻子", natural: true,
  condition: Condition.from_array([:And, :Same, [:NTimes, 3, [:ATile, 0]]]), piece_definitions: [
    PieceDefinition.create(name: "槓子", natural: false, condition: Condition.from_array([:And, :Same, [:NTimes, 4, [:ATile, 0]]]))
  ])
])

GoalDefinition.create(name: "4面子1雀頭", fu: 0, point: 0, condition: Condition.from_array([:Split, [:Piece, 0, toitsu.id], [:NTimes, 4, [:Piece, 0, mentsu.id]]]))