class UserResearch < ApplicatonRecord
   validates :username, presence: true
   validates :service, presence: true
end