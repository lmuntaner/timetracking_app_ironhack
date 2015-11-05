puts "running seeds file..."

Project.destroy_all
Entry.destroy_all

puts "----- All Projects Destroyed -------"

(1..5).each do |i|
  iron_project = Project.create({
    title: "Ironhack number #{i}",
    priority: rand(1..3),
    description: "This is a short descript #{i}"
  })
  personal_project = Project.create({
    title: "Personal number #{i}",
    priority: rand(1..3)
  })
  (0..3).each do |h|
    iron_project.entries.create({
      hours: h,
      minutes: h * 15,
      date: rand(Date.new(2015,10,1)..Date.today),
      comment: "Any repetaed comment"
    })
    personal_project.entries.create({
      hours: h,
      minutes: h * 15,
      date: rand(Date.new(2015,10,1)..Date.today),
      comment: "Any repetaed comment"
    })
  end
end
