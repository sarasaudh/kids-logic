# KidsLogic

### Project Name: 
   KidsLogic
   
   

### Description :
   An educational & gaming application for children that provides the foundation for programming


### Features List:(User Stories)
// Add your project feature list

- logIn & Register
As a user I want to register account So that I can use the app.
AS a user I want to login to my account So that I can use my account on the app.
AS a user I want to chose My  grade So that I can read my lessons or just play games

'As a Baby User: (age : 1 - 7 )' 

AS a user I want to enter to game page So that I can Play a game .
As a user I want to enter the Carton page so that I can watch my story Lesson.
AS a user I want to enter to my profile So that I can change my image and my state.
AS a user I want to enter to my profile So that I can see Kids score.
AS a user I want to enter to my profile So that I can Sing Out.

'As a child User :  ( age : 8 -15 )'

- Lessons 
AS a user I want to enter to lesson page  So that I can read all lessons .

- self evaluation
AS a user I want to enter to  self evaluation  page  So that I can add||delete tasks .
AS a user I want to enter to  self evaluation  page  So that I can add||delete Days .
AS a user I want to enter to  self evaluation  page  So that I can evaluation my self .
- Games

AS a user I want to enter to game page So that I can Play a game .
- Quiz
As a user I want to enter the Quiz page so that I can do my quiz .
- Video
As a user I want to enter the video page so that I can watch my youtube tutorial.
As a user I want to enter the Carton page so that I can watch my story Lesson.
- map
As a user I want to enter the map page so that I can visit kids Logic center & visit webSite.
- profile
AS a user I want to enter to my profile So that I can change my image and my state.
AS a user I want to enter to my profile So that I can see Kids score.
AS a user I want to enter to my profile So that I can Sing Out.


## Rect App 

| Path              | Component            | Permissions                     | Behavior                                                     |
| ------------------| -------------------- | --------------------------------| ------------------------------------------------------------ |
|`/`                |                      | public `<Route>`                |                                                              |
|`/signup`          | SignupPage           | anon only `<AnonRoute>`         | Signup page, link to login, present homepage after signup    |
|`/login`           | LoginPage            | anon only `<AnonRoute>`         | Login page, link to signup, present homepage after login     |
|`/gradepage`       | grade page           | user only `<PrivateRoute>`      | grade page                                                   |
|`/Profile`         | Profile Page         | user only `<PrivateRoute>`      | Profile                                                      |
|`/game`            | game page            | user only `<PrivateRoute>`      |                                                              |
|`/Hony bee Game`   | ony bee Game page    | user only `<PrivateRoute>`      |                                                              |
|`/GoldenFish game` | GoldenFish game      | user only `<PrivateRoute>`      |                                                              |
|`/Carton`          | Carton               | user only `<PrivateRoute>`      |                                                              |
|`Lessons`          | Lessons              | Child user only `<PrivateRoute>`|                                                              |
|`/self evaluation` | self evaluation      | Child user only `<PrivateRoute>`|                                                              |
|`/Map`             | Map                  | Child user only `<PrivateRoute>`|                                                              |
|`/Video`           | Video                | Child user only `<PrivateRoute>`|                                                              |
|`/Quiz`            | Quiz                 | Child user only `<PrivateRoute>`|                                                              |

### Structure:
// 
Models:


struct User
struct Logic
struct Qustion
struct VideoModel
struct Day
struct Tasks
struct Kids
struct Qustion


Views(Controllers):


class LoginVC
class SignUpVC
class GradeVC
class MyProfileVC

class TabVC
class TabVC2

class Lessons
class LessonDetailVC
class LogicCell
class LogicPosts
class Vedio
class VideoLessons
class VideoCollectionViewCell

class TaskTabVC
class DTasksVC
class NewTaskVC
class NewDayVC
class DayTasksVC
class DaysVC

class Games
class Games2
class GoldenFishGame
class honyBeeGame
class codecombat

class Question
class QuestionBank
class QuizviewController

class MoreVC
class MoreVC2

class MapViewController

class ContactCell
class TestController
class ScoreViewController



Services:
class UsersService
class TasksService 
class DaysService 

### Presentation:

My presentation:
https://drive.google.com/drive/folders/11ih5z_wBWkD9j6H1MaJezFHb_ANXQcub?usp=sharing


