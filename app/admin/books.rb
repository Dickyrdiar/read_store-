ActiveAdmin.register Book do

    index do
        column :name_book 
        column :desc 
        column :date_of_issue 
        column :page 
        column :ISBN 
        column :price , :sortable => :price do |book|
            div :class => "price" do
                number_to_currency book.price  
            end  
        end 
        default_actions 
    end 
end
