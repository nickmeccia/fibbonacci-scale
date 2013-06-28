module Fibbaaah
  def self.many_fibs_with_offset_from(options)
    offset = options.fetch(:offset)
    options.fetch(:starts) { [options.fetch(:start)] }
      .map    { |start| Fibbonacci.new(start).fast_forward_to(offset) }
      .select { |fibs|  fibs.current == offset }
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

    private

    def advance
      @a, @b = @a+@b, @a
    end
  end
end
