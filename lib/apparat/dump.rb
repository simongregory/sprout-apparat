module Apparat

  class Dump < Sprout::Executable::Base

    ##
    # The source file to dump
    #
    add_param :input, File, { :required => true, :shell_name => '-i', :delimiter => ' ' }

    ##
    # An optional output directory.
    #
    add_param :output, String, { :shell_name => '-o', :delimiter => ' ' }

    ##
    # If you speficy the "-swf" parameter the tag information of the file is exported
    #
    add_param :swf, Boolean, { :shell_name => '-swf', :hidden_value => true }

    ##
    # If you speficy the "-uml" parameter a UML graph for the given file is generated in
    # DOT format. This format can be opened with OmniGraffle in OS X or you can
    # transform it to an image or SVG with Graphviz.
    #
    add_param :uml, Boolean, { :shell_name => '-uml', :hidden_value => true }

    ##
    #  If you spefiy the "-abc" parameter, dump will output detailed ABC information.
    #
    add_param :abc, Boolean, { :shell_name => '-abc', :hidden_value => true }

    ##
    # If "-abc" is specified you can also change the way how methods are written.
    # "-bc raw" will show raw bytes, "-bc cfg" will output methods  as control flow graphs
    # in DOT format. "-bc default" will use Apparat's default bytecode representation.
    #
    add_param :bc, String, { :shell_name => '-bc', :delimiter => ' ' }

    ##
    # The default executable target
    #
    set :executable, :dump

  end

end

def dump *args, &block
  exe = Apparat::Dump.new
  exe.to_rake(*args, &block)
  exe
end
