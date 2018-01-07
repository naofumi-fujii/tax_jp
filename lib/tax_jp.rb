require "tax_jp/version"

module TaxJp
  # Your code goes here...
  class IncomeTax
    def self.income_tax value
      # 195万円以下	5％	0円
      if value <= 195 * 10000
        return value - value * 0.05 + 0
      end
      # 195万円を超え 330万円以下	10％	97,500円
      if (1950001..3300000).include? value
        return value - (value * 0.10) + 97500
      end
      # 330万円を超え 695万円以下	20％	427,500円
      if (3300001..6950000).include? value
        return value - (value * 0.20) + 427500
      end
      # 695万円を超え 900万円以下	23％	636,000円
      if (6950001..9000000).include? value
        return value - (value * 0.23) + 636000
      end
      # 900万円を超え 1,800万円以下	33％	1,536,000円
      if (9000001..18000000).include? value
        return value - (value * 0.33) + 1536000
      end
      # 1,800万円を超え4,000万円以下	40％	2,796,000円
      if (18000000..40000000).include? value
        return value - (value * 0.40) + 2796000
      end
      # 4,000万円超	45％	4,796,000円
      if 40000000 < value
        return value - (value * 0.45) + 4796000
      end
    end
  end
end
