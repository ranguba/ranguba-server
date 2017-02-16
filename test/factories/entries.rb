FactoryGirl.define do
  factory :entry do
    _key "http://example.com/"
    title "Example.com"
    body "Hello!"
    size {body.bytesize}
  end
end
