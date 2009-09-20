module Mail
  class Ruby18
    require 'base64'

    # Escapes any parenthesis in a string that are unescaped. This can't
    # use the Ruby 1.9.1 regexp feature of negative look behind so we have
    # to do two replacement, first unescape everything, then re-escape it
    def Ruby18.escape_paren( str )
      re = /\\\)/
      str = str.gsub(re) { |s| ')'}
      re = /\\\(/
      str = str.gsub(re) { |s| '('}
      re = /([\(\)])/          # Only match unescaped parens
      str.gsub(re) { |s| '\\' + s }
    end
    
    def Ruby18.paren( str )
      str = $1 if str =~ /^\((.*)?\)$/
      str = escape_paren( str )
      '(' + str + ')'
    end
    
    def Ruby18.decode_base64(str)
      Base64.decode64(str)
    end
    
    def Ruby18.encode_base64(str)
      Base64.encode64(str)
    end
    
  end
end