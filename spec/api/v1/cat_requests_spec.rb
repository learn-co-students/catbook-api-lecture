require 'rails_helper'
describe "Cats API" do 
  describe "get /cats" do 
    it 'returns a JSON collection of all of the cats' do 
      Cat.create(name: 'Maru', weight: 12, temperament: 'curious')
      Cat.create(name: 'Grumpy Cat', weight: 9, temperament: 'grumpy')
      get '/api/v1/cats' 
      response_body = JSON.parse(response.body)
      expect(response).to be_success
      expect(response_body.length).to eq(2)
      expect(response_body.first["hobbies"]).to eq([])
    end
  end

  describe 'get /cats/1' do 
    it 'returns a JSON object describing the first cat' do 
      cat = Cat.create(name: 'Maru', weight: 12, temperament: 'curious')
      get '/api/v1/cats/1'
      response_body = JSON.parse(response.body)
      expect(response).to be_success
      expect(response_body["name"]).to eq(cat.name)
    end
  end

  describe 'post /cats' do 
    context 'when valid' do 
      it 'creates a new cat' do 
        post '/api/v1/cats', {cat: {name: "Mimi", breed: "pixie bob", temperament: "wild",
          weight: 7}}
        cat = Cat.first
        response_body = JSON.parse(response.body)
        expect(response).to be_success
        expect(Cat.count).to eq(1)
        expect(cat.name).to eq("Mimi")
        expect(cat.breed).to eq("pixie bob")
        expect(cat.temperament).to eq("wild")
        expect(cat.weight).to eq(7)
        expect(cat.fluffy).to eq(false)
        expect(response_body["name"]).to eq("Mimi")
      end
    end

    context 'when invalid' do 
      it 'returns an error status and message' do
       post '/api/v1/cats', {cat: {breed: "pixie bob", temperament: "wild",
          weight: 7}}
        response_body = JSON.parse(response.body)
        expect(response.status).to eq(500)
        expect(response_body).to eq({"name" => ["can't be blank"]}) 
      end
    end
  end

  describe 'patch /cats/:id' do 
    context 'is valid' do 
      it 'updates the cat' do
        Cat.create(name: 'Maru', weight: 12, temperament: 'curious')
        patch '/api/v1/cats/1', {cat: {breed: "scottish fold",
          weight: 13}}
        cat = Cat.first
        expect(response).to be_success
        expect(cat.name).to eq("Maru")
        expect(cat.breed).to eq("scottish fold")
        expect(cat.weight).to eq(13)
      end
    end

    context 'is not valid' do 
      it 'returns an error status and message' do 
        Cat.create(name: 'Maru', weight: 12, temperament: 'curious')
        patch '/api/v1/cats/1', {cat: {name: nil, breed: "scottish fold",
          weight: 13}}
          expect(response.status).to eq(500)
          expect(JSON.parse(response.body)).to eq({"name" => ["can't be blank"]})
      end
    end
  end

  describe "destroy '/cats/:id'" do 
    context 'it exists' do 
      it 'destroys the cat record' do 
        Cat.create(name: 'Maru', weight: 12, temperament: 'curious')
        delete '/api/v1/cats/1'
        expect(response).to be_success
        expect(Cat.count).to eq(0)
      end
    end

    context 'it does not exist' do 
      it 'return an error message and a 404 status' do 
        delete '/api/v1/cats/1'
        expect(response.status).to eq(404)
        expect(JSON.parse(response.body)).to eq({"error" => "cat with id of 1 not found"})
      end
    end
  end
end









