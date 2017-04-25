json.extract! user_basis, :id, :name, :email, :created_at, :updated_at
json.url user_basis_url(user_basis, format: :json)
