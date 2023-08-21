# frozen_string_literal: true

require_relative "reader_base"

module SenToQueProto
  # Mecab 読み込み class。
  class MecabReader < ReaderBase
    # 1行ずつ読み込む処理
    def read_each_line(line)
      return if line.chomp == "EOS"

      w = SingleWord.new
      line_items = line.split(/[,\t]/)
      w.word = line_items[0]
      w.pos = line_items[1]
      w.pos_detail = line_items[2]
      w.plain_form = line_items[7]
      w.yomi = line_items[8]
      @words << w
    end
  end
end
