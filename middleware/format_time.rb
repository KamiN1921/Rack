class FormatTime
  attr_reader :errors

  FORMATS = { year: '%Y',
              month: '%m',
              day: '%d',
              hour: '%H',
              minute: '%M',
              second: '%S' }.freeze

  def initialize(params)
    @params = params
    @formats = []
    @errors = []
  end

  def call
    mass_of_params = @params.split(',')
    mass_of_params.each do |key|
      FORMATS.key?(key.to_sym) ? @formats.push(FORMATS[key.to_sym]) : @errors.push(key)
    end
  end

  def formatted
    format = @formats.join(' ')
    DateTime.now.strftime(format)
  end

  def valid?
    @errors.empty?
  end
end
