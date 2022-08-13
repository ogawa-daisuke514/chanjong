class Condition < ApplicationRecord
  belongs_to :condition, optional: true
  has_many :roles
  has_many :piece_definitions
  has_many :goal_definitons
  has_many :conditions
  accepts_nested_attributes_for :conditions

  def self.build_all(params)
    cs = params[:conditions]
    children = []
    if !cs
    elsif (cs.is_a?(Array))
      children = cs.map{|c| Condition.build_all(c)}
    else
      cs.permit!.each_value{|v| children << Condition.build_all(v)}
    end
    Condition.new(
      arg: params[:arg],
      process_type_id: params[:process_type_id],
      conditions: children
    )
  end
  def save_all
    save
    conditions.map{|c| c.condition_id = id; c.save_all }
  end
  def deep_dup
    Condition.new(
      arg: arg,
      process_type_id: process_type_id,
      conditions: conditions.map{|c| c.deep_dup }
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
