module Apparat

  class Stripper < Sprout::Executable::Base

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
    set :executable, :stripper

  end

end

def stripper *args, &block
  exe = Apparat::Stripper.new
  exe.to_rake(*args, &block)
  exe
end
