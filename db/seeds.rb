azurite = Product.create!(
  name: 'Azurite',
  description: 'Some gems have hidden qualities beyond their luster,
    beyond their shine... Azurite is one of those gems.',
  shine: 8,
  price: 110.50,
  rarity: 7,
  color: '#CCC',
  faces: 14
)
azurite.images.create!([
  { url: 'images/gem-02.gif' },
  { url: 'images/gem-05.gif' },
  { url: 'images/gem-09.gif' }
  ])
bloodstone = Product.create!(
  name: 'Bloodstone',
  description: 'Some gems have hidden qualities beyond their
    luster, beyond their shine... Azurite is one of those gems.',
  shine: 9,
  price: 29.90,
  rarity: 6,
  color: '#EEE',
  faces: 12
)
bloodstone.images.create!([
  { url: 'images/gem-01.gif' },
  { url: 'images/gem-03.gif' },
  { url: 'images/gem-04.gif' }
])
zircon = Product.create!(
  name: 'Zircon',
  description: 'Zircon is our most coveted and sought after gem.
    You will pay much to be the proud owner of this gorgeous and
    high shine gem.',
  shine: 70,
  price: 1100,
  rarity: 2,
  color: '#000',
  faces: 6
)
zircon.images.create!([
  { url: 'images/gem-06.gif' },
  { url: 'images/gem-07.gif' },
  { url: 'images/gem-08.gif' }
])
