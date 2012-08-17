require 'statistics2'

module ABAnalyzer

  # Calculate the minimum sample size (per group) based on the desire to detect
  # a increase from proportion p1 to proportion p2.  Significance is generally
  # safe at 0.05 (why? just because) and a power of 0.8 (why? just because)
  def self.calculate_size(p1, p2, significance, power)
    [ p1, p2, significance, power ].each { |a| 
      raise "All arguments to calculate_size must be Floats" unless a.is_a?(Float)
    }

    pbar = (p1 + p2) / 2.0
    sides = 2.0

    zcrit = Statistics2.pnormaldist(1 - (significance / sides))
    zpow = Statistics2.pnormaldist(power)

    numerator = (zcrit * Math.sqrt(2 * pbar * (1 - pbar)) + zpow * Math.sqrt(p2 * (1 - p2) + p1 * (1 - p1))) ** 2
    denominator = (p2 - p1) ** 2
    (numerator / denominator).ceil
  end

  # Calculate the confidence interval given the number of successes and trials at
  # the desired confidence level.  Returns an Array of [lower, upper]
  def self.confidence_interval(successes, trials, confidence)
    sides = 2.0
    alpha = 1 - confidence
    zcrit = Statistics2.pnormaldist(1 - (alpha / sides))
    p = successes.to_f / trials.to_f

    interval = zcrit * Math.sqrt((p * (1 - p)) / trials.to_f)
    [p - interval, p + interval]
  end

  # Like confidence_interval, but returns the relative interval compared to the baseline given
  # in compared_proportion
  def self.relative_confidence_interval(successes, trials, compared_proportion, confidence)
    ci = confidence_interval(successes, trials, confidence)
    [(ci.first - compared_proportion) / compared_proportion, (ci.last - compared_proportion) / compared_proportion]
  end
  
end
