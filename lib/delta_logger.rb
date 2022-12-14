class DeltaLogger
   def initialize app
       @app = app
   end

def call env
  
    status, headers, response = @app.call(env)
  
    request = ActionDispatch::Request.new env

    #puts env.keys
    browser =  request.env['HTTP_USER_AGENT']
    results =  Geocoder.search(env['REMOTE_ADDR'].to_i)
    puts "***********************************************"
    address = results.first.address
    puts "**********************************************"
    country = results.first.country
    puts "**********************************************"
    city=  results.first.city
    puts "**********************************************"
    ip = request.env['REMOTE_ADDR']
    time = Time.now
    log_status(browser , address  , country, time ,ip)

    [status, headers, response]
end


def log_status(browser , address  , country,time, ip)
    Rails.logger.info("----- [HTTP Request] Browser=#{browser} , Address=#{address}  , Country = #{country} , Time= #{time}, Ip=#{ip} ")
end
end

