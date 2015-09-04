require 'httparty'
require 'json'

class MollomPage
  
  URL = "http://dev.mollom.com/v1"
  
  def createSite(name, email)
    response = HTTParty.post(URL + "/site?url=" + name + "&email=" + email)
    parsedAddress = response.parsed_response
    @publicKey = parsedAddress["siteResponse"]["site"]["publicKey"]
    responseCode = response.code
  end
  
  def update(param, value)
    response = HTTParty.post(URL + "/site/" + @publicKey + "?" + param + "=" + value)
    responseCode = response.code
  end
  
  def check
    response = HTTParty.get(URL + "/site/" + @publicKey)
    responseCode = response.code
  end
end