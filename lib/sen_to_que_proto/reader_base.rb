# frozen_string_literal: true

require_relative "single_word"
require_relative "write_cloze"
require_relative "write_meaning"
require_relative "write_yomi"

module SenToQueProto
  # data 読み込み用の基底 class。
  class ReaderBase
    attr_reader :words, :language, :separator

    # 初期化処理
    def initialize(language)
      @language = language
      @separator = @language == "en" ? " " : ""
      @words = [] # SingleWord の配列。
    end

    # 標準入力を受け取る
    def stdin
      while (line = gets)
        read_each_line(line.chomp)
      end
    end

    # file を開く
    def file(filename)
      File.open(filename, "r") do |f|
        f.each do |line|
          read_each_line(line.chomp)
        end
      end
    end

    # 1行ずつ読み込む処理
    def read_each_line(line)
      raise "read_each_line の内容が定義されていません"
    end
  end
end
