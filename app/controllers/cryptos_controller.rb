class CryptosController < ApplicationController
  def index
      if params[:start] == ""
        start = 1
      else
        start = params[:start].to_i
      end

      @response = Unirest.get "https://api.coinmarketcap.com/v1/ticker/",
                parameters:{start: (start-1), limit: params[:limit]}
      @response = @response.body
      # @response = @response.sort_by { |hash| hash['price_usd'].to_f }.reverse!

      @bitcoin = Unirest.get "https://api.coinmarketcap.com/v1/ticker/",
                parameters:{start: 0, limit: 1}
      @bitcoin = @bitcoin.body
      @bitcoin_cap = @bitcoin[0]['market_cap_usd'].to_f 
      if params[:id]
        @response_ticker = Unirest.get "https://api.coinmarketcap.com/v1/ticker/#{params[:id]}"
        @response_ticker = @response_ticker.body
      end
  end
end
