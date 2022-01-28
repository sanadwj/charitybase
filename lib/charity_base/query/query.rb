module CharityBase

  QUERY = """query CharitiesList($search: String, $limit: PageLimit, $id: [ID]) {
    CHC {
      getCharities(
        filters: { search: $search, id: $id}
      ) {
        count
        list(limit: $limit) {
          orgIds {
            id
          }
          id
          contact {
            email
            phone
            address
          }
          image {
            logo {
              small
              medium
            }
          }
          website
          names {
            primary
            value
          }
          activities
        }
      }
    }
  }""".freeze

end
