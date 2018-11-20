json.extract! post, :id, :title, :content, :status, :priority, :user_id, :deadline, :created_at, :updated_at
json.url post_url(post, format: :json)
