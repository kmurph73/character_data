Dummy TV show / movie character data for seeding "people" (including avatars / images) in your app - eg for a social networking site.

List of characters and data/images provided: https://kmurph73.github.io/character_data/

Install via `gem 'character_data', github: 'kmurph73/character_data'` in your Gemfile.

``` ruby
=> bojack = CharacterData::Person.all[0]

=> #<CharacterData::Person:0x00007f886e217570
 @bio=
  "Born in San Francisco, California is a self-loathing anthropomorphic alcoholic horse currently in his 50s. His acting career peaked when he starred in a successful family sitcom called Horsin' Around in the late 1980s and later The Bojack Horseman Show, an edgier, less successful sitcom which was cancelled in 2007 after just one season. Though he began as a young bright-eyed actor, he has since grown bitter, deeply depressed, and jaded towards Hollywoo and whom he has become post-fame. BoJack has been shown to be caring and insightful, but his insecurities, loneliness, and desperate need for approval often result in self-destructive actions that devastate those around him. Many of his issues stem from his childhood and issues with his unhappy parents, which the audience is shown through flashbacks. At the end of season 5, BoJack checks into rehab after he developed a drug addiction to prescription painkillers he was on which caused him to strangle his co-star when she tried to take them away from him.",
 @born=1964,
 @id="bojack",
 @job="Actor",
 @name="Bojack Horseman",
 @email="bojack@bojack_horseman.com",
 @sex="male",
 @show_id="bojack_horseman",
 @species="horse">

 => bojack_poolside = bojack.images[0] # see below!
 => #<CharacterData::Image:0x00007ffbc9c8e200 
   @filename="bojack1.jpg", 
   @realpath="/Users/kmurph/code/ruby/character_data/lib/data/images/bojack_horseman/bojack1.jpg">
```

Example usage with Rails' Active Storage (likely in db/seeds.rb):

``` ruby
CharacterData::Person.all.each do |person|
  user = User.new(name: person.name, email: person.email, password: 'password')

  imgs = person.images.map {|img| {io: img.file, filename: img.filename}}

  user.images.attach(imgs)

  user.save!
end
```

![bojack](https://raw.githubusercontent.com/kmurph73/character_data/master/lib/data/images/bojack_horseman/bojack1.jpg)

Simpson age sources: https://www.quora.com/If-all-The-Simpsons-characters-aged-how-old-would-they-be
