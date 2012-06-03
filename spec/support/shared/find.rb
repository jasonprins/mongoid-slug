shared_examples 'find' do

  let(:attribute)  { "#{document._slug.name}" }
  let(:param) { document.to_param }

  it 'finds by slug' do
    if document._slug.renamed?
      klass.find_by(attribute.to_sym => "#{param}").should eql document
    else
      klass.find_by(slug: "#{param}").should eql document
    end
  end

  it 'finds by id as string' do
    klass.find(document.id.to_s).should eql document
  end

  it 'finds by id as array of strings' do
    klass.find([document.id.to_s]).should eql [document]
  end

  it 'finds by id as BSON::ObjectId' do
    klass.find(document.id).should eql document
  end

  it 'finds by id as an array of BSON::ObjectIds' do
    klass.find([document.id]).should eql [document]
  end

  it 'returns an empty array if given an empty array' do
    klass.find([]).should eql []
  end
end
