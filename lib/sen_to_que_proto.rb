# frozen_string_literal: true

require_relative "sen_to_que_proto/version"
require_relative "sen_to_que_proto/mecab_reader"
require_relative "sen_to_que_proto/tree_tagger_reader"

# 中身をまとめた名前空間。
module SenToQueProto
  # 汎用 error。
  class Error < StandardError; end
  # Your code goes here...
end
