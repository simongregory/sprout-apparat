# encoding: utf-8

require 'rake/tasklib'

module TestCoverageReportWriter
  class Task < Rake::TaskLib
    attr_writer :server, :port

    def initialize name = :coverage_writer
      @name = name
      @server = '127.0.0.1'
      @port = 1025

      yield self if block_given?

      define
    end

    def define
      desc "Listens for coverage data from a unit test run and writes it to disk"
      task @name do
        start_socket
      end
    end
  end

  def start_socket
    def start(params=nil)
      @pid = fork do
        require 'socket'
        cs = CoverageServer.new(TCPServer.open(@server, @port))
      end

      Process.detach(@pid)
    end
  end
end

def coverage_writer *args, &block
  TestCoverageReportWriter::Task.new *args, &block
end
