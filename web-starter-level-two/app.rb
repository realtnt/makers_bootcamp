# These lines load Sinatra and a helper tool to reload the server
# when we have changed the file.
require 'sinatra/base'
require 'sinatra/reloader'

# You will want to require your data model class here
require "cat_list"

class WebApplicationServer < Sinatra::Base
  # This line allows us to send HTTP Verbs like `DELETE` using forms
  use Rack::MethodOverride

  configure :development do
    # In development mode (which you will be running) this enables the tool
    # to reload the server when your code changes
    register Sinatra::Reloader
  end

  before do
    # This sets up the global data store. You will use this for your data model.
    # In future you will use a database instead.
    $global ||= {}
  end

  # Start your server using `rackup`.
  # It will sit there waiting for requests. It isn't broken!

  # YOUR CODE GOES BELOW THIS LINE

  def cat_list
    $global[:cat_list] ||= CatList.new
  end

  get '/lostcats' do
    erb :lost_cats_index, locals: { cat_list: cat_list.list }
  end

  get '/lostcats/new' do
    erb :lostcats_new
  end

  post '/lostcats' do
    cat_list.add(
      params[:name], 
      params[:description], 
      params[:mobile], 
      params[:password]
    )
    redirect '/lostcats'
  end

  delete '/lostcats/:id' do
    cat_list.remove(params[:id].to_i)
    redirect '/lostcats'
  end



  get '/lostcats/:id' do
    erb :lost_cats_details, locals: { 
      lost_cat: cat_list.get(params[:id].to_i), 
      index: params[:id].to_i 
    }
  end

  get '/lostcats/:id/edit' do
    lost_cat_id = params[:id].to_i
    erb :lost_cats_edit, locals: {
      id: lost_cat_id,
      lost_cat: cat_list.get(lost_cat_id)
    }
  end

  patch '/lostcats/:id' do
    lost_cat_id = params[:id].to_i
    cat_list.update(
      lost_cat_id, 
      params[:name] ||= nil,
      params[:description] ||= nil,
      params[:mobile] ||= nil,
      params[:sighting] ||= nil,
      params[:password] ||= nil
    )
    redirect "/lostcats/#{lost_cat_id}"
  end

  get '/lostcats/:id/sighting' do
    lost_cat_id = params[:id].to_i
    erb :lost_cats_sighting_edit, locals: {
      id: lost_cat_id,
      lost_cat: cat_list.get(lost_cat_id)
    }
  end

  # get '/lostcats/:id/sentinel' do
  #   erb: lost_cats_sentinel, locals: { id: params[:id] }
  # end

  # post '/lostcats/:id/sentinel' do

  # end
end
