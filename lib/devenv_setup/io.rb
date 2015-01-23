module DevenvSetup
  class IO
    def self.pipe_to_stdout(command)
      ::IO.popen(command) do |pipe|
        while (line = pipe.gets)
          puts line
        end
      end
    end
  end
end
