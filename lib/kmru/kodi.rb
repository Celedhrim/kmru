require "rest-client"
require "json"
require "pp"

module Kmru

  # Simple function to call the api
  def self.kodireq(payload)
    return RestClient.post "http://#{$options[:user]}:#{$options[:pass]}@#{$options[:host]}:#{$options[:port]}/jsonrpc", payload, {content_type: :json, accept: :json}
  end

  # Test kodi api connection
  def self.koditestconn
    payload = {
      "id" => "kmru",
      "jsonrpc" => "2.0",
      "method" => "JSONRPC.Ping"
    }.to_json

    result = false
    begin
      response = self.kodireq(payload)
      result = true if response.code == 200
    rescue
      result = false
    end
    return result
  end

  def self.getmovies
    case $options[:mode]
    when "last"
      payload = {
        "id" => "kmru",
        "jsonrpc" => "2.0",
        "method" => "VideoLibrary.GetRecentlyAddedMovies",
        "params" => {
          "limits" => {
            "start" => 0,
            "end" => $options[:number]
          }
        }
      }.to_json

    when "random", "cron"
      payload = {
        "id" => "kmru",
        "jsonrpc" => "2.0",
        "method" => "VideoLibrary.GetMovies",
        "params" => {
          "limits" => {
            "start" => 0,
            "end" => $options[:number]
          },
          "sort" => {
            "method" => "random"
          }
        }
      }.to_json

    when "all"
      payload = {
        "id" => "kmru",
        "jsonrpc" => "2.0",
        "method" => "VideoLibrary.GetMovies"
      }.to_json
    else
      puts "No suitable mode"
      exit 1
    end

    return JSON.parse(self.kodireq(payload).body.force_encoding("UTF-8"))['result']['movies']
  end

  def self.getmoviedetails(id)
    payload ={
      "id" => "kmru",
      "jsonrpc" => "2.0",
      "method" => "VideoLibrary.GetMovieDetails",
      "params" => {
        "movieid" => id,
        "properties" => ['rating', 'imdbnumber', 'votes', 'year']
      }
    }.to_json

    return JSON.parse(self.kodireq(payload).body.force_encoding("UTF-8"))['result']['moviedetails']

  end

  def self.setmoviedetails(id,imdbid,rating,votes)
    payload ={
      "id" => "kmru",
      "jsonrpc" => "2.0",
      "method" => "VideoLibrary.SetMovieDetails",
      "params" => {
        "movieid" => id,
        "imdbnumber" => imdbid,
        "rating" => rating,
        "votes" => "#{votes}"
      }
    }.to_json
    return self.kodireq(payload)
  end
end
