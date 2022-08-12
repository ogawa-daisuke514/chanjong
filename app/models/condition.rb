class Condition < ApplicationRecord
  belongs_to :condition, optional: true
  has_many :roles
  has_many :piece_definitions
  has_many :goal_definitons
  has_many :conditions
  accepts_nested_attributes_for :conditions

  def self.build_all(params)
    return nil unless params.is_a?(Hash)
    cs = params[:conditions]
    Condition.new(
      arg: params[:arg],
      process_type_id: params[:process_type_id],
      conditions: (cs.is_a?(Array) ? cs.map{|c| Condition.build_all(c)} : [])
    )
  end
  def destroy_all
    conditions.each{|c| c.destroy_all }
    destroy
  end
  def replaced(ptype, word_type, is_show=true)
    word = nil
    case word_type
    when :head
      word = ptype.head_word
    when :middle
      word = ptype.middle_word
    when :tail
      word = ptype.tail_word
    end
    ptype.arg_type && word ? word.gsub("_ARG", ARGS[ptype.arg_type][arg].to_s) : word
  end
end
