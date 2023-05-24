require_relative '../decorator/trimmer_decorator'
require_relative '../lib/person'

describe CapitalizeDecorator do
  context 'when initializing' do
    before(:each) do
      @person = Person.new(nil, 22, name: 'maximilianus')
      @trimmer = TrimmerDecorator.new(@person)
    end

    it 'should return the trimmed name' do
      expect(@trimmer.correct_name).to eq 'maximilia'
    end
  end
end
