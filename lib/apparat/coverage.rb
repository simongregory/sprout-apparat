module Apparat

  class Coverage < Sprout::Executable::Base

    ##
    # The swf to add coverage output to
    #
    add_param :input, File, { :required => true, :shell_name => '-i', :delimiter => ' ' }

    ##
    # Optional coverage swf to generate.
    #
    add_param :output, String, { :shell_name => '-o', :delimiter => ' ' }

    ##
    # The source path to use. To define multiple paths seperate with :
    #
    add_param :source, String, { :shell_name => '-s', :delimiter => ' ' }

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
