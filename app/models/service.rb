class Service < ApplicatonRecord 
    validates :name, presence: true
    validates :url, presence: true
end