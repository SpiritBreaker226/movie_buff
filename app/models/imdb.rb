class Imdb
	include HTTParty
	base_uri 'myapifilms.com'

	@@my_api_films_token = ENV["my_api_films"]

	def self.find_by_title(options = {})
		options[:token] = @@my_api_films_token

		get("/imdb", query: options)
	end

	def self.find(imdb_id)
		options = { 
			token: @@my_api_films_token,
			idIMDB: imdb_id
		}
		
		get("/imdb", query: options)
	end

	def self.top_movies
		options = { token: @@my_api_films_token }

		get("/imdb/top", query: options)
	end
end