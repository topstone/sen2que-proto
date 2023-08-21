# frozen_string_literal: true

RSpec.describe SenToQueProto::MecabReader do
  context "with un11ja_mecab.txt" do
    it "1つ目の単語は「国際」" do
      un11 = described_class.new("ja")
      un11.file("spec/un11ja_mecab.txt")
      expect(un11.words[0].word).to eq "国際"
    end
  end
end
