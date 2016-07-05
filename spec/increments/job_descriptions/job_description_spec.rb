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

  describe '#title' do
    subject { job_description.title }

    context 'when it starts with h1' do
      let(:markdown) { "# #{title}\nfoo bar baz\n" }
      let(:title) { 'Hello world engineer' }
      it { should eq title }
    end

    context 'when it does not start with h1' do
      let(:markdown) { "hello world\nfoo bar baz\n" }
      it { should be_nil }
    end
  end
end
