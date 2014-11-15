require 'unirest'

# To verify there is an actual communication. Returns 200 if everything went fine.
# --------------------------------------------------------------------------------

# response = Unirest.get('http://makerblog.herokuapp.com/posts',
# 	headers: {"Accept" => "application/json"})

# puts response
# puts response.code

module MakerBlog
	class Client
		def list_posts
			response = Unirest.get("http://makerblog.herokuapp.com/posts",
				headers: {"Accept" => "application/json"})
			posts = response.body
			posts.each do |post|
				puts "ID: #{post["id"]}"
				puts "Title: \"#{post["title"]}\" by #{post["name"].split.map(&:capitalize).join(' ')}"
				puts "Content: #{post["content"]}."
				puts "-" * 30
			end
		end


		def show_post(id)
			url = "http://makerblog.herokuapp.com/posts/#{id}"
			response = Unirest.get(url,
				headers: {"Accept" => "application/json"})
			post = response.body
			puts "\"#{post["title"]}\": #{post["content"]}."
		end

		def create_post(name, title, content)
			url = "http://makerblog.herokuapp.com/posts"
			payload = {:post => {'name' => name, 'title' => title, 'content' => content}}

			response = Unirest.post(url,
				headers: {"Accept" => "application/json",
									"Content-Type" => "application/json"},
									parameters: payload)

			post = response.body
			puts "You have succesfully created a new post:"
			puts "ID: #{post["id"]}"
			puts "Title: \"#{post["title"]}\" by #{post["name"]}"
			puts "Content: #{post["content"]}"
		end
	end
end

client = MakerBlog::Client.new
client.list_posts
client.show_post(19637)

client.create_post("Kelvinator", "Amazing Title", "Esto se esta poniendo bueno!")








