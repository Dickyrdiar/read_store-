ActiveAdmin.register AdminUser do
  index do
    column :email 
    column :current_sign_in_at 
    column :last_sign_in_at 
    column :sign_id_count 
  end 
end