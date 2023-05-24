require_relative '../decorator/base'

describe Decorator do
  context 'when initializing' do
    before(:each) do
      @person = Person.new(nil, 22, name: 'maximilianus')
      @decorator = Decorator.new(@person)
    end

    it 'should return the correct name' do
      expect(@decorator.correct_name).to eq 'maximilianus'
    end
  end
end
