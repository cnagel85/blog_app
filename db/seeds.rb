# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 about = Post.create(user_id: '1', title: "About Me",
                content: 'He this is a bit about me.

I am currently an undergraduate at the University of Colorado, and I am studying mathematics and computer science. In addition, I have experience in Business Management and Marketing, as well as the Japanese language. I am just a few credits from my graduation, which is set for December 2013.

I built this website in order to gain more experience with Ruby on Rails, HTML, and CSS. I started building HTML based websites when I was 13 and am hoping to gain more real world experience in both front-end and back-end web design.

My current interests are: anything tech, guitar and Metal music, computer science, video games, and running')
about.save