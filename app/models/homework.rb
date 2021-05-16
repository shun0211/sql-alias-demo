class Homework < ApplicationRecord
  belongs_to :student, class_name: 'User', optional: true
  belongs_to :teacher, class_name: 'User', optional: true

  scope :search, lambda { |search_params|
    teacher_name = search_params[:teacher_name]
    student_name = search_params[:student_name]

    joins(
      'LEFT OUTER JOIN users AS student_users ON student_users.id = homeworks.student_id
      LEFT OUTER JOIN users AS teacher_users ON teacher_users.id = homeworks.teacher_id
    ')
    .where('teacher_users.name LIKE(?) or teacher_users.name LIKE(?)', "%#{teacher_name}%", "%#{teacher_name}%")
    .where('student_users.name LIKE(?) or student_users.name LIKE(?)', "%#{student_name}%", "%#{student_name}%")


    # left_joins(:teacher).left_joins(:student)
    #   .where('users.name LIKE ?', "%#{teacher_name}%")
    #   .where('students_homeworks.name LIKE ?', "%#{student_name}%")

    # left_joins(:teacher).select('homeworks.*, users.name AS teacher_name')
    #   .left_joins(:student).select('students_homeworks.name AS student_name')
    #   .where('teacher_name LIKE(?)', "%#{teacher_name}%")
    #   .where('student_name LIKE(?)', "%#{student_name}%")

    # left_joins(:teacher, :student)
    #   .where('users.name LIKE(?)', "%#{teacher_name}%")
    #   .where('students_homeworks.name LIKE(?)', "%#{student_name}%")
    }

end
