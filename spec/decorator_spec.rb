require_relative '../decorator/base'
require_relative '../decorator/capitalize_decorator'
require_relative '../decorator/trimmer_decorator'
require_relative '../lib/person'

describe Decorator do
  context 'when initializing' do
    before(:each) do
      @person = Person.new(nil, 22, name: 'maximilianus')
      @decorator = Decorator.new(@person)
      @capitalizer = CapitalizeDecorator.new(@person)
      @trimmer = TrimmerDecorator.new(@person)
    end

    it 'should return the correct name' do
      expect(@decorator.correct_name).to eq 'maximilianus'
    end

    it 'should return the capitalized name' do
      expect(@capitalizer.correct_name).to eq 'Maximilianus'
    end

    it 'should return the trimmed name' do
      expect(@trimmer.correct_name).to eq 'maximilia'
    end
  end
end
