RSpec.configure do |config|
  config.before(:each) do
    WebMock.disable_net_connect!(allow_localhost: true)
    ["collection", "manifest1", "manifest2", "manifest3"].each do |fn|
      WebMock.stub_request(:get, "http://example.org/#{fn}.json")
        .to_return(status: 200, body: File.new("spec/fixtures/#{fn}.json").read)
    end
  end
end
