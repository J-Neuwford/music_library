require 'album_repository'
require 'database_connection'

RSpec.describe AlbumRepository do
  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = DatabaseConnection.connect('music_library_test')
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_albums_table
  end

  it 'returns the list of albums' do
    repo = AlbumRepository.new
    albums = repo.all
    expect(albums.length).to eq 2
    expect(albums.first.id).to eq '1'
    expect(albums.first.title).to eq 'Doolittle'
  end

end