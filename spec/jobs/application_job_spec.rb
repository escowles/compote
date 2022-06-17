require "rails_helper"

RSpec.describe ApplicationJob do
  subject(:job) { described_class.new }
  it "is a job" do
    expect(job).to respond_to(:perform)
  end
end
