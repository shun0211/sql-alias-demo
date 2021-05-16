10.times do |n|
  teacher = User.create!(name: "teacher_#{n}", email: "teacher_#{n}@example.com")
  student = User.create!(name: "student_#{n}", email: "student_#{n}@example.com")
  Homework.create!(title: "宿題_#{n}", student: student, teacher: teacher)
end
