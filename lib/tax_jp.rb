require 'tax_jp/version'

module TaxJp
  # Your code goes here...
  class Income
    def initialize(value)
      @value = value
    end

    attr_reader :value

    # 所得税率
    def tax_rate
      # 195万円以下	5％	0円
      return 0.05 if value <= 195 * 10_000
      # 195万円を超え 330万円以下	10％	97,500円
      return 0.10 if (1_950_001..3_300_000).cover? value
      # 330万円を超え 695万円以下	20％	427,500円
      return 0.20 if (3_300_001..6_950_000).cover? value
      # 695万円を超え 900万円以下	23％	636,000円
      return 0.23 if (6_950_001..9_000_000).cover? value
      # 900万円を超え 1,800万円以下	33％	1,536,000円
      return 0.33 if (9_000_001..18_000_000).cover? value
      # 1,800万円を超え4,000万円以下	40％	2,796,000円
      return 0.40 if (18_000_000..40_000_000).cover? value
      # 4,000万円超	45％	4,796,000円
      return 0.45 if value > 40_000_000
    end

    # 所得税額
    def tax_value
      (value * tax_rate)
    end

    # 控除額
    def deductions
      # 195万円以下	5％	0円
      return 0 if value <= 195 * 10_000
      # 195万円を超え 330万円以下	10％	97,500円
      return 97_500 if (1_950_001..3_300_000).cover? value
      # 330万円を超え 695万円以下	20％	427,500円
      return 427_500 if (3_300_001..6_950_000).cover? value
      # 695万円を超え 900万円以下	23％	636,000円
      return 636_000 if (6_950_001..9_000_000).cover? value
      # 900万円を超え 1,800万円以下	33％	1,536,000円
      return 1_536_000 if (9_000_001..18_000_000).cover? value
      # 1,800万円を超え4,000万円以下	40％	2,796,000円
      return 2_796_000 if (18_000_000..40_000_000).cover? value
      # 4,000万円超	45％	4,796,000円
      return 4_796_000 if value > 40_000_000
    end

    def with_tax_value
      return value - tax_value + deductions
    end
  end
end
