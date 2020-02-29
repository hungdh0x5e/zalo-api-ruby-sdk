lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zalo_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'zalo-api'
  spec.version       = ZaloAPI::VERSION
  spec.authors       = ['Huy Hùng']
  spec.email         = ["huyhung1994@gmail.com"]
  spec.homepage      = 'https://github.com/hungdh0x5e/zalo-api-ruby-sdk'
  spec.license       = 'MIT'

  spec.summary       = 'Zalo API Library for Ruby'
  spec.description   = 'Ruby wrapper for the REST API at https://zalo.me. Documentation at https://developers.zalo.me/'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency('faraday')
  spec.add_runtime_dependency('addressable')
  spec.add_runtime_dependency('json', '>= 1.8')

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
