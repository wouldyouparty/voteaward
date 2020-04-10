require 'csv'

count = 1
headers = %w(name district party gid thumb picture no cname gender birthday age address job education career property military tax tax_unpaid_5yrs tax_unpaid_current crime crime_records candidate_count)

CSV.foreach('db/candidates.csv', headers: true) do |c|
  p "#{count}, #{c['name']}"
  province = Province.find_or_create_by(name: c["province"])
  district = province.districts.find_or_create_by(name: c["district"])
  party = Party.find_or_create_by(name: c["party"])
  data = {}
  candidate = Candidate.find_or_create_by(gid: c["gid"])
  headers.each{ |x| data[x] = c[x] }
  data["district"], data["party"] = district, party
  candidate.update(data)
  count += 1
end
