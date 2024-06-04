/*
This application is about the university. 
It allows the students to take exams and allows the teacher to create exams and subjects. Here are the specific details about the interface of the application.
Data storage and app usage:
We are going to have some constant data that comes with application. then as the application grows and more students and teachers register, we will store them in the program without writing to local storage or backend.

Startup:
We have the login screen with two tabs for student and teacher login.
they can use their id and password to login. Moreover, both have the options to register.
we use a Boolean to go to registration screen and based on the value of the Boolean if true we will register a student and if false we register a teacher.
during the registration we the student can be paid or free user. (selection using radio buttons) 
View of registration screen:
Central title without appbar that says Register as (student or teacher, it depends)
as for name, id and password. 
Special feature: when asking for password we have password field and confirm password field make sure that they both share the common text editing controller so that the password is entered in both places automatically.
Login screen:
when the student or teacher presses the login. Also assign a random picture under the name 1 to 6.png from the assets folder we should display alert dialogue box with success or fail icon based on credential found in the system. navigate to the proper screen.
 
Student functionality:
the drawer allows the user to view his name and stuff also change password.
The main screen allows him to see his subscribed courses and exams that are due for tthat course if any.

Teacher’s functionality:
Drawer widget allows teachers to view his credentials. The main screen allows him to create course and also create exam.


 */