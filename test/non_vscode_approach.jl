using VHSJuliaKursPackage
using Test

@testset begin
    @testset "Tests re-assignment of teacher to course" begin
        initial_teacher = Teacher("John", "Doe", 30)
        teacher = Teacher("Frank", "Zimmer", 50)
        course = VHSKurs("Math", initial_teacher)
        assign!(course, teacher)
        @test course.teacher == teacher
    end

end

