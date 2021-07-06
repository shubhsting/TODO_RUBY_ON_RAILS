json.extract! my_list, :id, :title, :description, :created_at, :updated_at
json.url my_list_url(my_list, format: :json)
