class Service < ApplicationRecord
  serialize :blocked_ip_origins, Array
  # Will fill this out more as I work through the OWASP V2 docs

  def attempt_login(current_term)
    # Will call web automation tool and attempt to log in given a term
    # based on the automation this will return "success", "fail", "locked"
  end
end
