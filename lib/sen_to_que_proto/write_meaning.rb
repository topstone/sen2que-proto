# frozen_string_literal: true

require_relative "reader_base"

module SenToQueProto
  class ReaderBase
    # 意味問題を書き出す
    def write_meaning
      # header
      puts '<?xml version="1.0" encoding="UTF-8"?>'
      puts "<quiz>"
    end
  end
end
