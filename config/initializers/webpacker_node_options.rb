if ENV['NODE_OPTIONS'].to_s.empty? || !ENV['NODE_OPTIONS'].to_s.include?('--openssl-legacy-provider')
  ENV['NODE_OPTIONS'] = [ENV['NODE_OPTIONS'], '--openssl-legacy-provider'].compact.join(' ').strip
end
