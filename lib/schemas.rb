
require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry.Types(default: :nominal)

  Integer = Strict::Integer
  Bool    = Strict::Bool
  Hash    = Strict::Hash
  String  = Strict::String
end

class GetUpdatesJSONResponse < Dry::Struct

  # Changed items
  attribute :items, Types.Array(Types::Integer).optional

  # Changed profiles
  attribute :profiles, Types.Array(Types::String).optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      items:    d["items"],
      profiles: d["profiles"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "items"    => items,
      "profiles" => profiles,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Item < Dry::Struct
  attribute :by,          Types::String
  attribute :dead,        Types::Bool.optional
  attribute :deleted,     Types::Bool.optional
  attribute :descendants, Types::Integer.optional
  attribute :id,          Types::Integer
  attribute :kids,        Types.Array(Types::Integer).optional
  attribute :parent,      Types::Integer.optional
  attribute :parts,       Types.Array(Types::Integer).optional
  attribute :poll,        Types::Integer.optional
  attribute :score,       Types::Integer.optional
  attribute :text,        Types::String.optional
  attribute :time,        Types::Integer
  attribute :title,       Types::String.optional
  attribute :item_type,   Types::String
  attribute :url,         Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      by:          d.fetch("by"),
      dead:        d["dead"],
      deleted:     d["deleted"],
      descendants: d["descendants"],
      id:          d.fetch("id"),
      kids:        d["kids"],
      parent:      d["parent"],
      parts:       d["parts"],
      poll:        d["poll"],
      score:       d["score"],
      text:        d["text"],
      time:        d.fetch("time"),
      title:       d["title"],
      item_type:   d.fetch("type"),
      url:         d["url"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "by"          => by,
      "dead"        => dead,
      "deleted"     => deleted,
      "descendants" => descendants,
      "id"          => id,
      "kids"        => kids,
      "parent"      => parent,
      "parts"       => parts,
      "poll"        => poll,
      "score"       => score,
      "text"        => text,
      "time"        => time,
      "title"       => title,
      "type"        => item_type,
      "url"         => url,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class User < Dry::Struct

  # The user's optional self-description. HTML
  attribute :about, Types::String.optional

  # Creation date of the user, in Unix Time
  attribute :created, Types::Integer.optional

  attribute :id, Types::String.optional

  # The user's karma
  attribute :karma, Types::Integer.optional

  attribute :submitted, Types::Any.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      about:     d["about"],
      created:   d["created"],
      id:        d["id"],
      karma:     d["karma"],
      submitted: d["submitted"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "about"     => about,
      "created"   => created,
      "id"        => id,
      "karma"     => karma,
      "submitted" => submitted,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
