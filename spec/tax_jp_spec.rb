RSpec.describe TaxJp do
  it "has a version number" do
    expect(TaxJp::VERSION).not_to be nil
  end

  let(:test_data) do
    [
      [195 * 10000, 0.05, 0],

      [195 * 10000 + 1, 0.10, 97500],
      [330 * 10000, 0.10, 97500],

      [330 * 10000 + 1, 0.20, 427500],
      [695 * 10000, 0.20, 427500],

      [695 * 10000 + 1, 0.23, 636000],
      [900 * 10000, 0.23, 636000],

      [900 * 10000 + 1, 0.33, 1536000],
      [1800 * 10000, 0.33, 1536000],

      [1800 * 10000 + 1, 0.40, 2796000],
      [4000 * 10000, 0.40, 2796000],

      [4000 * 10000 + 1, 0.45, 4796000],
    ]
  end

  # https://www.nta.go.jp/taxanswer/shotoku/2260.htm
  # 所得税の速算表
  # 課税される所得金額	税率	控除額
  # 195万円以下	5％	0円
  # 195万円を超え 330万円以下	10％	97,500円
  # 330万円を超え 695万円以下	20％	427,500円
  # 695万円を超え 900万円以下	23％	636,000円
  # 900万円を超え 1,800万円以下	33％	1,536,000円
  # 1,800万円を超え4,000万円以下	40％	2,796,000円
  # 4,000万円超	45％	4,796,000円

  example do
    test_data.each do |value, tax_rate, deductions|
      obj = TaxJp::Income.new(value)
      expect(obj.tax_rate).to eq tax_rate
      expect(obj.deductions).to eq deductions
      expect(obj.tax_value).to eq value * tax_rate
    end
  end
end
