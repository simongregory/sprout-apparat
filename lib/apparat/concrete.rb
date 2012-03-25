module Apparat

  class Concrete < Sprout::Executable::Base

    ##
    # The files to enforce abstract method implementation on
    #
    add_param :input, String, { :required => true, :shell_name => '-i', :delimiter => ' ' }

    ##
    # The default executable target
    #
    set :executable, :concrete

  end

end

def concrete *args, &block
  exe = Apparat::Concrete.new
  exe.to_rake(*args, &block)
  exe
end
