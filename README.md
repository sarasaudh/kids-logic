



# KidsLogic

## Project Name: 
   KidsLogic
   
   

## Description :
   An educational & gaming application for children that provides the foundation for programming


## Features List:(User Stories)


### logIn & Register
- As a user I want to register account So that I can use the app.
- AS a user I want to login to my account So that I can use my account on the app.
- AS a user I want to chose Orientation So that I can read my lessons or just play games
- As a user, I want to change the language of the application so that I can read my lessons in my preferred language

## Games Section 🎮

- AS a user I want to enter to game page So that I can Play a game .
- AS a user I want to enter to (CodeCombatName) Game  So that I can Play .
- AS a user I want to enter to (GoldenFish) Game  So that I can Play .
- AS a user I want to enter to (honybee) Game  So that I can Play .

- As a user I want to enter the Carton page so that I can watch my story Lesson.

## Lessons Section 📖

### Lessons 
  - AS a user I want to enter to lesson page  So that I can read all lessons .
  - Video
  - As a user I want to enter the video page so that I can watch my youtube tutorial.
### evaluation : 

### self evaluation
- AS a user I want to enter to  self evaluation  page  So that I can add||delete tasks .
 - AS a user I want to enter to  self evaluation  page  So that I can add||delete Days .
 - AS a user I want to enter to  self evaluation  page  So that I can evaluation my self .

 ### Quiz
 - As a user I want to enter the Quiz page so that I can do my quiz .
- As a user I want to do my quiz so that I can raise my score
 - map
  - As a user I want to enter the map page so that I can visit kids Logic center & visit webSite.
  
### profile
  - AS a user I want to enter to my profile So that I can show my score photo .
   - AS a user I want to enter to my profile So that I can change my name .
  - AS a user I want to enter to my profile So that I can see My score.
  -  AS a user I want to enter to my profile So that I can see other Kids score.
  - AS a user I want to enter to my profile So that I can Sing Out.


## Kids Logic App 

| Component            | Permissions                     | Behavior                                                     |
| -------------------- | --------------------------------| ------------------------------------------------------------ |
| Sign up Page         | anon only                       | Signup page, link to login, present homepage after signup    |
| LoginPage            | anon only                       | Login page, link to signup, present homepage after login     |
| welcome page           | user only                       | Choose the chose Orientation ,Game Or Lessons , change Languge | 
| game page            | user only                       | The child, no matter how big or small, can choose the favorite game: honey bee, gold fish,or CodeCombatName game that specialized in programming |
| Hony bee Game page   | user only                       | The child can play the honey bee (he must catch the Golden Hony bee to increase his points, he must not press the red bee because it removes all his points, the child presses the panda's face to enjoy the music and also to increase the bee's speed    |
| GoldenFish game      | user only                       |  The child can play the game of the golden fish (he must catch the golden and red fish to increase his points and it makes fun sounds, he must not press the blue fish because it removes all his points and makes a scary laugh, the child presses on the face of the fish logo at the top To enjoy the music and also to increase the speed of the fish  |
| Carton               | user only                       |    The small child can access the cartoon movie by pressing the button on the main page, while the older child can access the cartoon movie by swiping to the left on the More page  |
| Lessons              | user only                 | The child can directly enter the lessons page and read his lessons in detail in Arabic or English, and he can also press the little panda icon to make a motivational sound |
| Video                | user only                 |   The child can watch an educational video about programming (a young child writes code for your site) in order to develop the spirit of competition |
| self evaluation      |user only                 |   The child must evaluate himself daily by placing daily tasks on the tasks page, and every new day he adds a new day and evaluates himself at each task he completed by ticking a check mark in order to develop his programming skills |
| Quiz                 | Child user only                 |     The child enters the test page and solves the questions by multiple choice and at the top he sees a point and the number of questions, and at the end a window appears for him with the number of points he has obtained, he can return to the previous page by dragging to the left |
| Map                  | user only                 |   The child can enter the map page in order to know the headquarters of the educational center for programming, and he can also visit our own website    |
| Profile Page         | user only                       | show sccore picture, change his name , see points for everyone, sign out  |

## Structure:

### Models:

- struct User
- struct Logic
- struct Qustion
- struct VideoModel
- struct Day
- struct Tasks
- struct Kids
- struct Qustion


### Views(Controllers):


- class LoginVC
- class SignUpVC
- class SectionVC

- class SettingHomeVC
- class ContainerViewController
- class MenuViewController

- class TabVC

- class Lessons
- class LessonDetailVC
- class LogicCell
- class LogicPosts
- class Vedio


- class TaskTabVC
- class DTasksVC
- class NewTaskVC
- class NewDayVC
- class DayTasksVC
- class DaysVC

- class Question
- class QuestionBank
- class QuizviewController

- class MapViewController

- class MyProfileVC
- class ScoreViewController

- class TabVC2

- class Games
- class Games2
- class GoldenFishGame
- class honyBeeGame
- class codecombat

- class VideoLessons
- class VideoCollectionViewCell


### Services:
- class UsersService
- class TasksService 
- class DaysService 

### feature
- Read Lessons
- watching videos Lessons
- evaluation  hem self
- trying to answer the Quiz
- Play games
- increase score
- Arabic & Englesh Lessons
- Dark & Light Mode
- 
 
## LogIn
![Simulator Screen Shot - iPhone 13 Pro - 2022-01-02 at 09 47 49](https://user-images.githubusercontent.com/91429812/148018788-1b6d5587-74a6-4e10-b92a-bf326b53437d.png) ![Simulator Screen Shot - iPhone 13 - 2022-01-10 at 15 04 53](https://user-images.githubusercontent.com/91429812/149909954-bfa2fe14-5b85-464c-985f-19c11040cf4a.png)![Untitled 5](https://user-images.githubusercontent.com/91429812/149911198-d2325c08-bf1c-4b69-bf69-69335ac116fb.png)




# Links 
### GitHub Rebo 

  - https://github.com/sarasaudh/kids-logic

### Slides :

My presentation:
https://docs.google.com/presentation/d/1XZZs9C2o_9z_82oMtjuDNlS440NmJMUTESgB4rBGYMU/edit?usp=sharing
  - 


