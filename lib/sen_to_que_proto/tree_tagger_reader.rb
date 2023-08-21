# frozen_string_literal: true

require_relative "reader_base"

module SenToQueProto
  # TreeTagger 読み込み class。
  class TreeTaggerReader < ReaderBase
    # 1行ずつ読み込む処理
    def read_each_line(line)
      w = SingleWord.new
      line_items = line.split(/[\t]/)
      w.word = line_items[0]
      w.pos = line_items[1]
      w.plain_form = line_items[2]
      @words << w
    end
  end
end
