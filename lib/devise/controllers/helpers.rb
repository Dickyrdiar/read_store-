def is_flashing_format?
    is_navigational_format? 
end 

def is_flashing_format?
    Devise.navigational_formats_nclude?(request_format)
end 