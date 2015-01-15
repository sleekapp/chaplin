require 'childprocess'

Given(/^I start a Chaplin server$/) do
  @chaplin_server = ChildProcess.build("bundle", "exec", "./bin/chaplin", "tmp/chaplin_project")
  # Uncomment the following line to see the server's output
  @chaplin_server.io.inherit!
  @chaplin_server.start
  sleep 3
end


When(/^I send the request GET (.*)$/) do |path|
  @response = `curl -s http://localhost:8081/#{path}`
end

Then(/^I should get the following response$/) do |expected_response|
  expect(@response).to eq expected_response + "\n"
end

