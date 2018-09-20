# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.

def assignment_score(grade_hash, name, assignment)
  grade_hash[name][assignment-1]
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.

def assignment_scores(grade_hash, assignment)
  grade_hash.map do | name, grades |
    grades[assignment-1] 
  end
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.

def average(array) 
  array.sum / array.length
end

def assignment_average_score(grade_hash, assignment)
  assignment_grades = assignment_scores(grade_hash, assignment)
  average(assignment_grades)
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.

def averages(grade_hash)
  assignment_grades = grade_hash.map do | name, grades |
    [name, average(grades)]
  end
  assignment_grades.to_h()
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F

def letter_grade(num_grade)
  if num_grade >= 90
    'A'
  elsif num_grade >= 80
    'B'
  elsif num_grade >= 70
    'C'
  elsif num_grade >= 60
    'D'
  else
    'F'
  end
end

# Return a hash of students and their final letter grade, as determined
# by their average.

def final_letter_grades(grade_hash)
  final_letter_grade = averages(grade_hash).map do | name, grade |
    [name, letter_grade(grade)]
  end
  final_letter_grade.to_h()
end

# Return the average for the entire class.

def class_average(grade_hash)
  average(averages(grade_hash).values)
end

# Return an array of the top `number_of_students` students.

def top_students(grade_hash, number_of_students)
    students = averages(grade_hash).sort_by { | name, grade | grade }.reverse.to_h
    students.keys[0..number_of_students-1]
end