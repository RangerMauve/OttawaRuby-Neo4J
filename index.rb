require 'rubygems'
require 'neography'
require 'sinatra'

@neo = Neography::Rest.new("http://localhost:7474");

def read_file(file)
	return File.read(file);
end

def query(file, params = {})
	to_query = read_file("queries/"+file)

	@neo.execute_query(to_query, params);
end

get "/nodes" do
	query(get_all)
end
