# frozen_string_literal: true

require_relative "reader_base"

module SenToQueProto
  class ReaderBase
    # cloze 形式で書き出す
    def write_cloze
      # header
      puts '<?xml version="1.0" encoding="UTF-8"?>'
      puts "<quiz>"

      # question
      (1..9).each do |variant|
        text = ""
        @words.each do |w|
          sep = /^[.,:;]$/ =~ w.word ? "" : @separator
          text += if (rand(100) < 40) && (((w.pos == "名詞") && (w.pos_detail != "固有名詞") && (/^\p{Han}+$/ =~ w.word) && (w.word.length >= 2)) || (w.pos == "NN"))
                    "#{sep}{1:SHORTANSWER:=#{w.word}}"
                  else
                    "#{sep}#{w.word}"
                  end
          text.gsub!(/^ /, "")
        end
        puts '  <question type="cloze">'
        puts "    <name>"
        puts "      <text>QQQQ_V#{variant}</text>"
        puts "    </name>"
        puts '    <questiontext format="html">'
        puts "      <text>#{text}</text>"
        puts "    </questiontext>"
        puts "  </question>"
        puts ""
      end

      # footer
      puts "</quiz>"
    end
  end
end
