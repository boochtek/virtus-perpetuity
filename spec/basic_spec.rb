require 'virtus/perpetuity'
require 'perpetuity'

describe 'Including Virtus::Perpetuity.model' do
  before do
    module Examples
      class User
        include Virtus::Perpetuity.model

        attribute :name, String
        attribute :age,  Integer
      end
    end
  end

  it 'works' do
    expect { Examples::User.new(name:'Craig') }.not_to raise_exception
  end

  it 'creates a mapping' do
    expect(Perpetuity[Examples::User]).not_to be_nil
  end
end
