using VHSJuliaKursPackage
using TestItems
using Test



@testitem "Tests re-assignment of teacher to course" begin
    initial_teacher = Teacher("John", "Doe", 30)
    teacher = Teacher("Frank", "Zimmer", 50)
    course = VHSKurs("Math", initial_teacher)
    assign!(course, teacher)
    @test course.teacher == teacher
end

@testitem "Tests assignment of student to course" begin
    teacher = Teacher("Frank","Zimmer",50)
    course = VHSKurs("Deutschkurs",teacher)
    student = Student("John", "Doe",20)
    assign!(course,student)
    @test course.students[1] == student
    @test length(course.students) == 1
end

@testitem "Tests assignment of student to full course" begin
    teacher = Teacher("Frank","Zimmer",50)
    course = VHSKurs("Deutschkurs",teacher)
    for i in 1:10
        student = Student("John", "Doe",20)
        assign!(course,student)
    end
    student = Student("Jane", "Doe",20)
    assign!(course,student)
    @test length(course.students) == 10
end