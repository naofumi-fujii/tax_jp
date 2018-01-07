require 'tax_jp/version'

module TaxJp
  # Your code goes here...
  class IncomeTax
    def self.income_tax(value)
      # 195万円以下	5％	0円
      return value - value * 0.05 + 0 if value <= 195 * 10_000
      # 195万円を超え 330万円以下	10％	97,500円
      if (1_950_001..3_300_000).cover? value
        return value - (value * 0.10) + 97_500
      end
      # 330万円を超え 695万円以下	20％	427,500円
      if (3_300_001..6_950_000).cover? value
        return value - (value * 0.20) + 427_500
      end
      # 695万円を超え 900万円以下	23％	636,000円
      if (6_950_001..9_000_000).cover? value
        return value - (value * 0.23) + 636_000
      end
      # 900万円を超え 1,800万円以下	33％	1,536,000円
      if (9_000_001..18_000_000).cover? value
        return value - (value * 0.33) + 1_536_000
      end
      # 1,800万円を超え4,000万円以下	40％	2,796,000円
      if (18_000_000..40_000_000).cover? value
        return value - (value * 0.40) + 2_796_000
      end
      # 4,000万円超	45％	4,796,000円
      return value - (value * 0.45) + 4_796_000 if value > 40_000_000
    end
  end
end
