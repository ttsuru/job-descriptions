RSpec.describe Increments::JobDescriptions do
  VALID_FILENAME = 'application_engineer.ja.md'.freeze

  describe '.[]' do
    subject { described_class[filename] }

    context 'when a valid filename is given' do
      let(:filename) { VALID_FILENAME }

      it { should be_a described_class::JobDescription }
      it { should have_attributes filename: filename }
    end

    context 'when an invalid filename is given' do
      let(:filename) { 'doesnotexists.md' }

      it { expect { subject }.to raise_error(described_class::NotFound) }
    end

    context 'when a filename in document markdowns given' do
      let(:filename) { described_class::DOCUMENT_MARKDOWNS.sample }

      it { expect { subject }.to raise_error(described_class::NotFound) }
    end
  end

  describe '.keys' do
    subject { described_class.keys }

    it { should_not include 'README.md' }
    it { should include VALID_FILENAME }
  end
end
