require 'spec_helper'
require 'integration_spec_helper'
require_relative '../../lib/chaplin'
require 'rack'

describe 'Serving static files' do

  it "serves static files as is" do
    response = Net::HTTP.get(URI('http://localhost:8081/hello.txt'))
    expect(response).to eq "Hello Chaplin!\n"
  end

end

describe 'Routes without API requests' do
  it 'serves the template' do
    response = Net::HTTP.get(URI('http://localhost:8081/about'))
    expect(response).to eq "Hello Chaplin!\n"
  end
end

describe 'Routes with get API requests' do
  it 'serves the template' do
    response = Net::HTTP.get(URI('http://localhost:8081/profile'))
    expect(response).to eq "Hello Chaplin!\n"
  end

end
