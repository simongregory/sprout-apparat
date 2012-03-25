module Apparat

  ##
  # The TDSI tool performs various bytecode transformations. Besides specific transformations the
  # application will always try to do certain peephole optimizations. Most of them will fix
  # problems with older ActionScript compiler versions.
  #
  class TDSI < Sprout::Executable::Base

    ##
    # The source file to apply turbo to
    #
    add_param :input, File, { :required => true, :shell_name => '-i', :delimiter => ' ' }

    ##
    # The turbo powered swf/swc
    #
    add_param :output, String, { :shell_name => '-o', :delimiter => ' ' }

    ##
    # If you specify the "-f" argument TDSI will try to fix certain problems with files generated
    # by the Alchemy compiler. This transformation will only affect code generated from C/C++
    # sources. This option defaults to false. The best way to optimize an Alchemy file with TDSI
    # is by calling "tdsi -i input.swc -o output.swc -f true -a false -e false -m false".
    #
    add_param :fix, Boolean, { :shell_name => '-f', :default => false, :delimiter => ' ' }

    ##
    # This option will inline Alchemy operations from ActionScript. If you use the Memory class
    # provided by the apparat-ersatz library those operations will be replaced with fast Alchemy
    # op codes. More information is available at http://code.google.com/p/apparat/wiki/MemoryPool
    #
    # default true
    #
    add_param :alchemy, Boolean, { :shell_name => '-a', :default => false, :delimiter => ' ' }

    ##
    # Perform inline expansion. If your class extends the apparat.inline.Inline class all its static
    # methods will be inlined when called. Those methods may not contain exceptions and must
    # be static.
    #
    # default - true
    #
    add_param :inlined, Boolean, { :shell_name => '-e', :default => false, :delimiter => ' ' }

    ##
    # Whether or not to enable macro expansion. Macros are like a type-safe copy and paste that
    # happens at compile time. More information is available here:
    # http://code.google.com/p/apparat/wiki/MemoryPool
    #
    add_param :macro, Boolean, { :shell_name => '-m', :default => false, :delimiter => ' ' }

    ##
    # The default executable target
    #
    set :executable, :reducer

  end

end

def tdsi *args, &block
  exe = Apparat::TDSI.new
  exe.to_rake(*args, &block)
  exe
end
