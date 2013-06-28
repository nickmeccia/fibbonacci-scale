require 'fibbaaah'

describe Fibbaaah do
  def call_one(n)
    described_class.fibs_with_offset(n)
  end

  def call_many(options)
    described_class.many_fibs_with_offset_from(options)
  end

  example { call_one(1).take(5).should == [1, 1, 2, 3, 5] }
  example { call_one(14).take(5).should == [14, 14, 15, 16, 18] }
  example do
    call_many(starts: (-5..9), offset: 16)
       .map { |fibs| fibs.take 2 }
       .should == [[16, 29], [16, 24], [16, 21]]
  end
end
