Partial
=======

<%= erb :_partial %>

Helpers
=======

view helpers

helpers do
  def shout(words)
    words.upcase
  end
end

no-layout needed

get 'no-layout'
erb :index, locals: {ideas: IdieaSrore.all.sort, idea: Idea: Idea.new(params[])}

views
  Useres
    Profile.erb
    edit.erb
    partials
      pic_and_name.erb


Collections
===========

<%= partial :'partials/idea', collection: @ideas %>
