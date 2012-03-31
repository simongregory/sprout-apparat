module Apparat

  class Coverage < Sprout::Executable::Base

    ##
    # The source file to strip
    #
    add_param :input, File, { :required => true, :shell_name => '-i', :delimiter => ' ' }

    ##
    # The stipped file
    #
    add_param :output, String, { :shell_name => '-o', :delimiter => ' ' }

    ##
    # The default executable target
    #
    set :executable, :coverage

  end

end

def coverage *args, &block
  exe = Apparat::Coverage.new
  exe.to_rake(*args, &block)
  exe
end
