module CharityBase
  class FindResource < Resource
    def find(id)
      Find.new post_request("graphql",
                            { "query": CharityBase::QUERY, "variables": { "id": id } }).body["data"]["CHC"]["getCharities"]
    end
  end
end
