module Fibbaaah
  def self.many_fibs_with_offset_from(options)
    offset = options.fetch(:offset)
    starts = options.fetch(:starts) { [options.fetch(:start)] }
    buffer = options.fetch(:buffer, 0)

    starts.map    { |start| Fibbonacci.new(start).fast_forward_to(offset) }
          .select { |fibs|  fibs.current == offset }
          .each   { |fibs|  fibs.regress buffer }
  end

  class Fibbonacci
    def initialize(n)
      @a = 1
      @b = 0
      @n = n - 1
    end

    def fast_forward_to(n)
      advance while current < n
      self
    end

    include Enumerable
    def each
      return self unless block_given?
      loop do
        yield current
        advance
      end
    end

    def current
      @a + @n
    end

    def advance
      @a, @b = @a+@b, @a
      self
    end

    def regress(n=1)
      n.times { @a, @b = @b, @a-@b }
      self
    end
  end
end
