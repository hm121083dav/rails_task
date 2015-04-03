ActionMailer::Base.smtp_settings = {
    :address              => 'smtp.rambler.ru',
    :port                 => 465,
    :domain               => 'rambler.ru',
    :user_name            => 'duxa_vena',
    :password             => '486dx66',
    :authentication       => 'login',
    :enable_starttls_auto => true
}