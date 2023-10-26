# Generated by Sideko (sideko.dev)
# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name        = 'hacker_news_api'
  spec.summary     = 'hacker_news_api 1.0.0'
  spec.version     = '1.0.0'
  spec.description = 'Hacker News makes the public their data available in near real time.
&gt; The v0 API is essentially a dump of our in-memory data structures. We know, what works great locally in memory isn&#x27;t so hot over the network. Many of the awkward things are just the way HN works internally... It&#x27;s not the ideal public API, but it&#x27;s the one we could release in the time we had

This documentation and SDK libraries have been generated by [Sideko](https://sideko.dev) which has no affiliation with Hacker News. Everything you see is generated from an OpenAPI specification.

Install and try the free beta SDK generator on our [Github](https://github.com/Sideko-Inc/sideko).
'
  spec.authors     = ['Sideko']
  spec.email       = 'team@sideko.dev'
  spec.license     = 'MIT'
  spec.files       = ['lib/hacker_news_api.rb', 'lib/schemas.rb']

  spec.add_runtime_dependency 'http', '~> 5.1.1'
  spec.add_runtime_dependency 'dry-struct', '~> 1.6'
  spec.add_runtime_dependency 'dry-types', '~> 1.7', '>= 1.7.1'
end