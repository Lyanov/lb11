class CalculatorController < ApplicationController
    before_action :parse, only: :output

  def input
  end

  def armstrong_number?(arg)
    number = arg.to_s.length
    arg == arg.to_s.split('').map(&:to_i).map { |elem| elem**number }.inject(&:+)
  end

  def add_to_db(arg)
      new_result = Result.create(param: @param.to_s, res: @result.to_s)
  end

  def find_armstrongs(arg)
      if arg == '' || arg.to_i.nil? || arg.to_i.zero?
          @result = 'There is no data or the data is incorrect'
          nil
      else
          @result = []
          ((10**(arg.to_i - 1))..(10**arg.to_i - 1)).each do |i|
              @result << i if armstrong_number?(i)
          end
      end

  end

  def output
    if Result.find_by(param: "#{@param}") == nil
        find_armstrongs(@param)
        add_to_db(@result)
    else
        tmp_res = Result.find_by(param: @param)

        if tmp_res.res != 'There is no data or the data is incorrect'
            @result = tmp_res.res[1..-1].split(', ').map {|elem| elem.to_i}
        else
            @result = 'There is no data or the data is incorrect'
        end

    end
  end

  def parse
      @param = params[:param]
  end
end
