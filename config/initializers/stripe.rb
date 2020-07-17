Rails.configuration.stripe = {
    :publisher_key => ENV['pk_test_51H57J5EqecAfhK5Qc7hUBsQHYW6fajN4mSnUm8iM3fX9oTzMUUCR97Zqv6wOqBKitUX6Amkj3EmvkWQmTD34JPZR00shMNWaKB'],
    :secret_key => ENV['sk_test_51H57J5EqecAfhK5QejlfJbTYMIflMjlgn7QzXYE4e5FguDm0cVoFEObOxg05B18HKhZqdJicF8f09qAVeod6HDZ200BZZeAa2q']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]