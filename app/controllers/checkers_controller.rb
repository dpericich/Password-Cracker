class CheckersController < ApplicationController
  # Some before_action to protect API from rogue actors

  def check_user(user_id)
    user = User.find(user_id)
    service = user.service
    dictionary = user.dictionary
    current_attempts = 0;

    while (current_attempts < service.attempts_before_backoff) do
      render json: "All terms in dicitonary guessed" if dictionary.terms[user.current_dictionary_index] == nil

      response = service.attempt_login(dictionary.terms[user.current_dictionary_index])

      if (response == "success")
        user.update!(password: dictionary.terms[user.current_dictionary_index])
        create_log(user, service, status)
        render json: status
      elsif (response == "failure")
        new_dictionary_index += 1
        user.update!(current_dictionary_index: new_dictionary_index)
        current_attempts +=  1
      elsif (response == "locked")
        user.update(status: "locked")
        create_log(user, service, status)
        render json: status
      end
    end

    render json: "Backoff reached"
  end

  def check_user_batch(user_collection)
    # perform the user check on some service or other group of records
  end


  private
  def create_log(user, service, status)
    EventLog.create!(user: user, service: service, status: status)
  end
end
