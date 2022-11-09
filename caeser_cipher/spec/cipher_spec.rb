require './caeser_cipher.rb'

describe '#converter' do
    it 'return numbers' do
        expect(converter('12345',5)).to eql('12345')
    end

    it 'differntiating lower case and upcase characters' do
        expect(converter("SoCorer 123 J", 4)).to eql("WsGsviv 123 N")
    end

end