module ApplicationHelper

  def validation_errors(password)
    error_hash = {}
    is_password_nil?(password, error_hash)
    is_password_correct?(password, error_hash)
    error_hash
  end

  private

  def is_password_nil?(password, errors)
    return if !password.blank? || !password.nil?
    errors.store(:no_password, 'You have to type the password')
  end

  # def is_app_key_empty?
  #   return if !ENV['APP_KEY'].blank? || !ENV['APP_KEY'].nil?
  #   ERROR_HASH.store(:no_app_key, 'There is no application key')
  # end

  def is_password_correct?(password, errors)
    return if password == ENV['APP_KEY']
    errors.store(:password_dont_match, 'Password don\'t match app key')
  end
end
