require 'payjp'

PAYJP_PUBLIC_KEY = Rails.application.credentials.payjp[:key]
PAYJP_SECRET_KEY = Rails.application.credentials.payjp[:secret]
