# frozen_string_literal: true

RSpec.describe SenToQueProto::TreeTaggerReader do
  context "with un11en_tt.txt" do
    it "6つ目の単語は「security」" do
      un11 = described_class.new("en")
      un11.file("spec/un11en_tt.txt")
      expect(un11.words[5].word).to eq "security"
    end
  end
end
