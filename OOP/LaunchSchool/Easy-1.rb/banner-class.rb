class Banner
    def initialize(message)
      @message = message
    end
  
    def to_s
      [plus_rule,vertical_rule,  empty_line, message_line, empty_line, vertical_rule, plus_rule].join("\n") 
    end
  
    private
  
    def vertical_rule
      "|" + vertical_rule_2
    end

    def vertical_rule_2
      position = @message.length + 2
      total = " "*position + "|"
    end

    def horizontal_rule
      length = @message.length + 2
      total = "-"*length 
    end

    def plus_rule
      #puts arr = total.split(",")
      "+" + horizontal_rule + "+" 
    end
  
    def empty_line
      " "
    end
  
    def message_line
      "| #{@message} |"
    end
  end

  banner = Banner.new('To boldly go where no one has gone before.')
puts banner