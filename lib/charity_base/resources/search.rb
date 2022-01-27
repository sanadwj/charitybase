module CharityBase
  class SearchResource < Resource
    def list(search, limit)
      Search.new post_request("graphql",
                              { "query": CharityBase::QUERY, "variables": { "search": search, "limit": limit } }).body["data"]["CHC"]["getCharities"]
    end
  end
end

