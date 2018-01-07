require "tax_jp/version"

module TaxJp
  # Your code goes here...
  class Income
    def initialize value
      @value = value
    end

    def value
      @value
    end

    def tax_rate
      # 195万円以下	5％	0円
      if value <= 195 * 10000
        return  0.05
      end
      # 195万円を超え 330万円以下	10％	97,500円
      if (1950001..3300000).include? value
        return 0.10
      end
      # 330万円を超え 695万円以下	20％	427,500円
      if (3300001..6950000).include? value
        return 0.20
      end
      # 695万円を超え 900万円以下	23％	636,000円
      if (6950001..9000000).include? value
        return 0.23
      end
      # 900万円を超え 1,800万円以下	33％	1,536,000円
      if (9000001..18000000).include? value
        return 0.33
      end
      # 1,800万円を超え4,000万円以下	40％	2,796,000円
      if (18000000..40000000).include? value
        return 0.40
      end
      # 4,000万円超	45％	4,796,000円
      if 40000000 < value
        return 0.45
      end
    end

    def deductions
      # 195万円以下	5％	0円
      if value <= 195 * 10000
        return 0
      end
      # 195万円を超え 330万円以下	10％	97,500円
      if (1950001..3300000).include? value
        return 97500
      end
      # 330万円を超え 695万円以下	20％	427,500円
      if (3300001..6950000).include? value
        return 427500
      end
      # 695万円を超え 900万円以下	23％	636,000円
      if (6950001..9000000).include? value
        return 636000
      end
      # 900万円を超え 1,800万円以下	33％	1,536,000円
      if (9000001..18000000).include? value
        return 1536000
      end
      # 1,800万円を超え4,000万円以下	40％	2,796,000円
      if (18000000..40000000).include? value
        return 2796000
      end
      # 4,000万円超	45％	4,796,000円
      if 40000000 < value
        return 4796000
      end
    end

    def income_tax
      # 195万円以下	5％	0円
      if value <= 195 * 10000
        return value - value * tax_rate + deductions
      end
      # 195万円を超え 330万円以下	10％	97,500円
      if (1950001..3300000).include? value
        return value - (value * tax_rate) + deductions
      end
      # 330万円を超え 695万円以下	20％	427,500円
      if (3300001..6950000).include? value
        return value - (value * tax_rate) + deductions
      end
      # 695万円を超え 900万円以下	23％	636,000円
      if (6950001..9000000).include? value
        return value - (value * tax_rate) + deductions
      end
      # 900万円を超え 1,800万円以下	33％	1,536,000円
      if (9000001..18000000).include? value
        return value - (value * tax_rate) + deductions
      end
      # 1,800万円を超え4,000万円以下	40％	2,796,000円
      if (18000000..40000000).include? value
        return value - (value * tax_rate) + deductions
      end
      # 4,000万円超	45％	4,796,000円
      if 40000000 < value
        return value - (value * tax_rate) + deductions
      end
    end
  end
end
