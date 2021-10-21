class Project < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :github, presence: true
    validates :link, presence: true
    validates :techs, presence: true

    # validates es para indicar los campos que serán obligatorios al crear un proyecto
end


