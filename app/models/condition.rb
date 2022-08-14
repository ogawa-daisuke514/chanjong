class Condition < ApplicationRecord
  belongs_to :condition, optional: true
  has_many :roles
  has_many :piece_definitions
  has_many :goal_definitons
  has_many :conditions
  accepts_nested_attributes_for :conditions

  # [ptype, arg, child1, child2, ..] の形式で配列化する。
  # ptypeはparentを持つものであれば省略する。
  # argは持たないものであれば省略する。
  # 上述のどちらかの省略があり、子を1つも持たないなら、
  # 残った要素をarrayから出して返す。
  def self.from_array(array, ptype_id=nil)
    unless array.is_a?(Array)
      array = [array]
    end
    array = array.dup
    if ptype_id
      ptype = ProcessTypes[ptype_id]
    else
      name = array.shift.to_s
      ptype = ProcessTypes.find{|pt| pt.name == name }
    end
    if ptype
      child = ProcessTypes.find{|pt| pt.parent == ptype.id }
      child_id = nil
      child_id = child.id if child
      arg = nil
      if ptype.arg_type
        arg = array.shift
      end
      return Condition.new(
        process_type_id: ptype.id,
        arg: arg,
        conditions: array.map{|a| Condition.from_array(a, child_id) }
      )
    else
      p "not found:" + name
      nil
    end
  end
  # hashまたはparamsからconditionを構成する。
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
  # <=> from_array
  def to_array
    ptype = ProcessTypes[process_type_id]
    result = []
    result << ptype.name.intern unless ptype.parent
    result << arg if ptype.arg_type && arg 
    result += conditions.map{|c| c.to_array }
    result = result[0] if result.size == 1 && conditions.empty?
    result
  end
  def save_all
    save
    conditions.map{|c| c.condition_id = id; c.save_all }
  end
  # <=> build_all
  def to_hash
    {
      process_type_id: process_type_id,
      arg: arg,
      conditions: conditions.map{|c| c.to_hash }
    }
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
