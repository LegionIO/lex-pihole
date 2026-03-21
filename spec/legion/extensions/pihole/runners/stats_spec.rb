# frozen_string_literal: true

RSpec.describe Legion::Extensions::Pihole::Runners::Stats do
  let(:client) { Legion::Extensions::Pihole::Client.new(url: 'http://pi.hole/admin/api.php', token: 'test-token') }

  let(:stubs) { Faraday::Adapter::Test::Stubs.new }
  let(:test_connection) do
    Faraday.new(url: 'http://pi.hole/admin/api.php') do |conn|
      conn.response :json, content_type: /\bjson$/
      conn.adapter :test, stubs
    end
  end

  before { allow(client).to receive(:connection).and_return(test_connection) }

  describe '#summary' do
    it 'returns summary statistics' do
      stubs.get('/admin/api.php') do
        [200, { 'Content-Type' => 'application/json' },
         { 'dns_queries_today' => 1000, 'ads_blocked_today' => 150 }]
      end
      result = client.summary
      expect(result[:summary]['dns_queries_today']).to eq(1000)
      expect(result[:summary]['ads_blocked_today']).to eq(150)
    end
  end

  describe '#top_items' do
    it 'returns top items with default count' do
      stubs.get('/admin/api.php') do
        [200, { 'Content-Type' => 'application/json' },
         { 'top_queries' => { 'example.com' => 50 }, 'top_ads' => { 'ads.example.com' => 20 } }]
      end
      result = client.top_items
      expect(result[:top_items]['top_queries']['example.com']).to eq(50)
    end

    it 'accepts a custom count' do
      stubs.get('/admin/api.php') do
        [200, { 'Content-Type' => 'application/json' },
         { 'top_queries' => {}, 'top_ads' => {} }]
      end
      result = client.top_items(count: 5)
      expect(result[:top_items]).to be_a(Hash)
    end
  end

  describe '#top_clients' do
    it 'returns top clients' do
      stubs.get('/admin/api.php') do
        [200, { 'Content-Type' => 'application/json' },
         { 'top_sources' => { '192.168.1.10' => 300 } }]
      end
      result = client.top_clients
      expect(result[:top_clients]['top_sources']['192.168.1.10']).to eq(300)
    end
  end

  describe '#over_time_data_10mins' do
    it 'returns over-time data' do
      stubs.get('/admin/api.php') do
        [200, { 'Content-Type' => 'application/json' },
         { 'domains_over_time' => { '1617000000' => 10 }, 'ads_over_time' => { '1617000000' => 2 } }]
      end
      result = client.over_time_data_10mins
      expect(result[:over_time_data]).to be_a(Hash)
      expect(result[:over_time_data]['domains_over_time']).to be_a(Hash)
    end
  end

  describe '#query_types' do
    it 'returns query type breakdown' do
      stubs.get('/admin/api.php') do
        [200, { 'Content-Type' => 'application/json' },
         { 'querytypes' => { 'A (IPv4)' => 75.5, 'AAAA (IPv6)' => 24.5 } }]
      end
      result = client.query_types
      expect(result[:query_types]['querytypes']['A (IPv4)']).to eq(75.5)
    end
  end
end
