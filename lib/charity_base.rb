# frozen_string_literal: true

require_relative "charity_base/version"

module CharityBase
  autoload :Client, "charity_base/client"
  autoload :Error, "charity_base/error"
  autoload :QUERY, "charity_base/query/query"
  autoload :Object, "charity_base/object"
  autoload :Resource, "charity_base/resource"

  autoload :Find, "charity_base/objects/find"
  autoload :Search, "charity_base/objects/search"

  autoload :FindResource, "charity_base/resources/find"
  autoload :SearchResource, "charity_base/resources/search"
end
