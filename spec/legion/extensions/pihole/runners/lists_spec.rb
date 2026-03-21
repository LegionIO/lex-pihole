# frozen_string_literal: true

RSpec.describe Legion::Extensions::Pihole::Runners::Lists do
  let(:client) { Legion::Extensions::Pihole::Client.new(url: 'http://pi.hole/admin/api.php', token: 'test-token') }

  let(:stubs) { Faraday::Adapter::Test::Stubs.new }
  let(:test_connection) do
    Faraday.new(url: 'http://pi.hole/admin/api.php') do |conn|
      conn.response :json, content_type: /\bjson$/
      conn.adapter :test, stubs
    end
  end

  before { allow(client).to receive(:connection).and_return(test_connection) }

  describe '#list_domains' do
    it 'returns whitelist domains by default' do
      stubs.get('/admin/api.php') do
        [200, { 'Content-Type' => 'application/json' },
         { 'data' => ['allowed.example.com', 'safe.example.com'] }]
      end
      result = client.list_domains
      expect(result[:domains]['data']).to include('allowed.example.com')
    end

    it 'returns blacklist domains when requested' do
      stubs.get('/admin/api.php') do
        [200, { 'Content-Type' => 'application/json' },
         { 'data' => ['ads.example.com', 'tracker.example.com'] }]
      end
      result = client.list_domains(list: 'black')
      expect(result[:domains]['data']).to include('ads.example.com')
    end
  end

  describe '#add_domain' do
    it 'adds a domain to the whitelist' do
      stubs.get('/admin/api.php') do
        [200, { 'Content-Type' => 'application/json' },
         { 'message' => 'Added 1 domain(s) to whitelist' }]
      end
      result = client.add_domain(list: 'white', domain: 'safe.example.com')
      expect(result[:result]['message']).to include('whitelist')
    end

    it 'adds a domain to the blacklist' do
      stubs.get('/admin/api.php') do
        [200, { 'Content-Type' => 'application/json' },
         { 'message' => 'Added 1 domain(s) to blacklist' }]
      end
      result = client.add_domain(list: 'black', domain: 'ads.example.com')
      expect(result[:result]['message']).to include('blacklist')
    end
  end

  describe '#remove_domain' do
    it 'removes a domain from the whitelist' do
      stubs.get('/admin/api.php') do
        [200, { 'Content-Type' => 'application/json' },
         { 'message' => 'Removed 1 domain(s) from whitelist' }]
      end
      result = client.remove_domain(list: 'white', domain: 'safe.example.com')
      expect(result[:result]['message']).to include('whitelist')
    end
  end

  describe '#enable' do
    it 'enables Pi-hole blocking' do
      stubs.get('/admin/api.php') do
        [200, { 'Content-Type' => 'application/json' },
         { 'status' => 'enabled' }]
      end
      result = client.enable
      expect(result[:enabled]['status']).to eq('enabled')
    end
  end

  describe '#disable' do
    it 'disables Pi-hole blocking indefinitely' do
      stubs.get('/admin/api.php') do
        [200, { 'Content-Type' => 'application/json' },
         { 'status' => 'disabled' }]
      end
      result = client.disable
      expect(result[:disabled]['status']).to eq('disabled')
    end

    it 'disables Pi-hole blocking for a duration' do
      stubs.get('/admin/api.php') do
        [200, { 'Content-Type' => 'application/json' },
         { 'status' => 'disabled' }]
      end
      result = client.disable(duration: 30)
      expect(result[:disabled]['status']).to eq('disabled')
    end
  end
end
