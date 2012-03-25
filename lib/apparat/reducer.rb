module Apparat

  class Reducer < Sprout::Executable::Base

    ##
    # The source file to reduce
    #
    add_param :input, File, { :required => true, :shell_name => '-i', :delimiter => ' ' }

    ##
    # The reduced file
    #
    add_param :output, String, { :shell_name => '-o', :delimiter => ' ' }

    ##
    # JPEG compression level. "1.0" is maximum quality, "0.0" is minimum quality.
    #
    add_param :quality, String, { :shell_name => '-q', :default => '1.0', :delimiter => ' ' }

    ##
    # The strength of the Flash Players internal deblocking filter
    #
    add_param :deblocking, String, { :shell_name => '-d', :delimiter => ' ' }

    ##
    # The default executable target
    #
    set :executable, :reducer

  end

end

def reducer *args, &block
  exe = Apparat::Reducer.new
  exe.to_rake(*args, &block)
  exe
end
