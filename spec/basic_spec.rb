require 'virtus/perpetuity'
require 'perpetuity/memory'

describe 'Including Virtus::Perpetuity.model' do
  before do
    Perpetuity.data_source :memory
    module Examples
      class User
        include Virtus::Perpetuity.model

        attribute :name, String
        attribute :age,  Integer

        index :age
      end
    end
  end

  it 'works' do
    expect { Examples::User.new(name:'Craig') }.not_to raise_exception
  end

  it 'creates a mapping' do
    expect(Perpetuity[Examples::User]).not_to be_nil
  end

  it 'creates a mapping with the correct attributes' do
    expect(Perpetuity[Examples::User].attributes).to include(:name)
    expect(Perpetuity[Examples::User].attributes).to include(:age)
  end

  it 'creates indexes' do
    expect(Perpetuity[Examples::User].indexes.map(&:name)).to include(:age)
  end
end
