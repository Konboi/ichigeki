require 'time'

module Ichigeki
  class Hissatsu
    attr_reader :exec_date, :confirm_dialog, :log_file_postfix,
      :script, :in_compilation, :dialog_message

    attr_accessor :is_running

    def initialize(init_properties = {})
      init_properties = {
        exec_date: Time.now.strftime("%Y-%m-%d"),
        confirm_dialog: 1,
        log_file_postfix: '.log',
        file: '',
        dialog_message: "Do you really execute %s",
        in_compilation: 1,
        script: $0,
        is_running: nil,
      }.merge(init_properties)

      @exec_date        = init_properties[:exec_date]
      @confirm_dialog   = init_properties[:confirm_dialog]
      @in_compilation   = init_properties[:in_compilation]
      @log_file_postfix = init_properties[:log_file_postfix]
      @script           = init_properties[:script]
      @dialog_message   = init_properties[:dialog_message]
      @is_running      = init_properties[:is_running]
    end

    def execute
      now   = Time.now;
      today = now.strftime("%Y-%m-%d")
      exiting("exec_date: #{exec_date.strftime('%Y-%m-%d')} is not today") unless exec_date == today

      exiting(sprintf("Can't execue! Execution log file [%s] already exists!", log_file)) if File.exists?(log_file)

      if confirm_dialog
        printf(dialog_message + ' [y/n] [n]'  , script.to_s)
        answer = gets.chomp
        exiting 'canceled.' unless answer == 'y'
      end

      STDOUT.flush
      STDERR.flush

      log(["\n",
          '# This log file is generated by ichigeki.',
          "start: #{now.to_s} \n",
          '---',''].join
         )

      self.is_running = 1

      done
    end

    private

    def tee(input, output)
      output.puts input
    end

    def exiting(msg = '')
      msg = msg + "\n"
      if (self.in_compilation)
        puts msg
        exit 1
      end
    end

    def log_file
      dir =  File.expand_path(File.dirname(script))
      "#{dir.to_s}/.#{script.to_s}#{log_file_postfix}"
    end

    def log(msg)
      log_fh.puts msg
    end

    def log_fh
      open(log_file, "a")
    end

    def done
      if is_running
        now =  Time.now.to_s
        log(["\n",
          '','---',"\n",
          "end: #{now}\n", ''].join)
      end
    end

  end
end

