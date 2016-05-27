# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


portugal = Country.create(name: 'Portugal')
Country.create(name: 'Spain')
Country.create(name: 'United Kingdom')
Country.create(name: 'France')
Country.create(name: 'Italy')

lisbon = City.create(name: 'Lisbon', country_id: Country.find(1).id)
City.create(name: 'Porto', country_id: Country.find(1).id)

ScientificArea.create(name: 'Natural sciences')
ScientificArea.create(name: 'Engineering and Technology')
ScientificArea.create(name: 'Medical and Health sciences')
ScientificArea.create(name: 'Agricultural sciences')
social = ScientificArea.create(name: 'Social sciences')
ScientificArea.create(name: 'Humanities')

Funding.create(name: 'Private')
public_funding = Funding.create(name: 'Public')
Funding.create(name: 'Public Private')

ResearchUnit.create(
  name:"DynamiaCET",
  year_of_foundation: Date.today - 20.years,
  country_id: portugal.id,
  city_id: lisbon.id,
  scientific_area_id: social.id,
  funding_id: public_funding.id
)
