lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pushme/aws/version"

Gem::Specification.new do |spec|
  spec.name          = "pushme-aws"
  spec.version       = Pushme::Aws::VERSION
  spec.authors       = ["Agustin Cavilliotti"]
  spec.email         = ["cavi21@gmail.com"]

  spec.summary       = %q{Push Notifications via Amazon AWS}
  spec.description   = %q{Add some basic feature to deal with push notifications through AWS SNS Mobile Push Notification Service}
  spec.homepage      = "https://github.com/nilusorg/pushme-aws"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "pry"
  spec.add_development_dependency "httplog"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "aws-sdk-sns", ["~> 1"]
end
