RSpec.describe Increments::JobDescriptions::JobDescription do
  let(:job_description) { described_class.new(filename, markdown) }
  let(:filename) { '' }
  let(:markdown) { '' }

  describe '#filename' do
    subject { job_description.filename }
    let(:filename) { 'hello-world.md' }
    it { should eq filename }
  end

  describe '#markdown' do
    subject { job_description.markdown }
    let(:markdown) { "# Hello\nworld\n" }
    it { should eq markdown }
  end

  describe '#to_html' do
    subject { job_description.to_html }
    let(:markdown) { "# Hello\nworld\n" }
    it { should match a_string_starting_with("\n<h1>\n") }
  end
end
