require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/student')
also_reload('./models/*')

get '/hogwarts' do
  @students = Student.all()
  erb(:index)
end

get '/hogwarts/new' do
  erb(:new)
end

get '/hogwarts/:id' do
  id = params[:id]
  @student = Student.find(id)
  erb(:show)
end

post '/hogwarts' do
  @student = Student.new(params)
  @student.save
  erb(:create)
end

post '/hogwarts/:id/delete' do
  id = params[:id]
  student = Student.find(id)
  student.delete()
  redirect to '/hogwarts'
end
