require 'artist_repository'
require 'database_connection'

RSpec.describe ArtistRepository do
  def reset_artists_table
    seed_sql = File.read('spec/seeds_artists.sql')
    connection = DatabaseConnection.connect('music_library_test')
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_artists_table
  end

  it 'returns the list of' do
    repo = ArtistRepository.new
    artists = repo.all
    expect(artists.length).to eq(2)
    expect(artists.first.id).to eq('1')
    expect(artists.first.name).to eq('Pixies')
  end
end