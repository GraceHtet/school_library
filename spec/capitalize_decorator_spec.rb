require_relative '../decorator/capitalize_decorator'
require_relative '../decorator/trimmer_decorator'
require_relative '../lib/person'

describe CapitalizeDecorator do
  context 'when initializing' do
    before(:each) do
      @person = Person.new(nil, 22, name: 'maximilianus')
      @capitalizer = CapitalizeDecorator.new(@person)
    end

    it 'should return the capitalized name' do
      expect(@capitalizer.correct_name).to eq 'Maximilianus'
    end
  end
end
