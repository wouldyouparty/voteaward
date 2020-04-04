require 'csv'

candidates = CSV.parse(File.read("db/candidates.csv"), headers: true)

candidates.each do |c|
  p c["name"]
  province = Province.find_or_create_by(name: c["province"])
  district = province.districts.find_or_create_by(name: c["district"])
  party = Party.find_or_create_by(name: c["party"])
  Candidate.create(
      name: c["name"], district: district, party: party,
      gid: c["gid"],
      thumb: c["thumb"],
      picture: c["picture"],
      no: c["no"],
      cname: c["cname"],
      gender: c["gender"],
      birthday: c["birthday"],
      age: c["age"],
      address: c["address"],
      job: c["job"],
      education: c["education"],
      career: c["career"],
      property: c["property"],
      military: c["military"],
      tax: c["tax"],
      tax_unpaid_5yrs: c["tax_unpaid_5yrs"],
      tax_unpaid_current: c["tax_unpaid_current"],
      crime: c["crime"],
      candidate_count: c["candidate_count"]
  )
end
