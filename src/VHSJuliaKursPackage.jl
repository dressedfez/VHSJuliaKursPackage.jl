module VHSJuliaKursPackage

export VHSKurs, Student, Teacher, assign!

# Abstract type defining a general person
abstract type Person end

# Abstract type defining a general course
abstract type Kurs end

# type defining a student
struct Student <: Person
    first_name::String
    last_name::String
    age::Int
end

# type defining a teacher
struct Teacher <: Person
    first_name::String
    last_name::String
    age::Int
end

# type defining a course
mutable struct VHSKurs <: Kurs
    name::String
    teacher::Teacher
    students::Vector{Student}

    # defines an inner constructor
    function VHSKurs(name::String, teacher::Teacher)
        new(name, teacher, Student[]) # Initialize students as an empty Vector
    end

    function VHSKurs(name::String, teacher::Teacher, students::Vector{Student})
        new(name, teacher, students)
    end
end


"""
    assign!(course::VHSKurs, student::Student)

Assign a student to a course. The student must be at least 10 years old 
and the course must have fewer than 10 students.

# Arguments
- `course::VHSKurs`: The course to enroll the student in
- `student::Student`: The student to enroll in the course
"""
function assign!(course::VHSKurs, student::Student)
    if student.age < 10
        println("Student is too young to enroll")
        return
    end

    if size(course.students, 1) >= 10
        println("Course is full")
        return
    end

    push!(course.students, student)
end

"""
    assign!(course::VHSKurs, teacher::Teacher)

Assign a new teacher to an existing course.

# Arguments
- `course::VHSKurs`: The course to enroll the student in
- `teacher::Teacher`: The teacher to be assigned to the course
"""
function assign!(course::VHSKurs, teacher::Teacher)
    course.teacher = teacher
end

end
