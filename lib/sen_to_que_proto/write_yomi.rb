# frozen_string_literal: true

require_relative "reader_base"

module SenToQueProto
  class ReaderBase
    # 読み問題を書き出す
    def write_yomi
      yomi_list = {}

      @words.each do |w|
        yomi_list[w.word] = w.yomi if (w.pos == "名詞") && (/^\p{Han}+$/ =~ w.word) && (w.word.length >= 2)
      end

      yomi_list.each do |word, yomi|
        puts "::読み「#{word}」::[html]「#{word}」のフリガナをカタカナで書きなさい。{=#{yomi}}"
        puts ""
      end
    end
  end
end
