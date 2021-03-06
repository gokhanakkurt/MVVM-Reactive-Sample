MVVM - ReactiveSwift Sample
========================
This is a sample project built with Model-View-ViewModel(MVVM) architecture. 

App basically retrieves data from an API by using `ReactiveSwift` signal and populates UITableView with received data. Dendencies are also resolved by using `Swinject`

![MVVM Reactive Sample](http://gokhanakkurt.com/assets/img/mvvm-reactive-swift.png)

# Requirements
1. iOS 10.0+
2. Swift 5.0
3. Cocoapods (Dependency Manager)

# Development Setup & Build App
1. Open a terminal and go to project directory.
2. Install Cocoapods with command `sudo gem install cocoapods` (If you haven't installed yet.)
3. Install dependencies via `pod install`
4. Please open `.xcworkspace` file,  not `.xcodeproj`.
5. Hit the run button!

# Project 

## App Structure

`HomeViewController` is responsible for binding events and handling tableview delegates.  

`UserTableViewCell` stands for UITableViewCell showing user properties and it has custom XIB file under `View` folder. It's used by view controller.

`HomeViewModel` is a dependency of `HomeViewController`. It fetches users by using service instance and send signals to its receipents.

`UserService` is responsible for handling network request. It's a dependency of `HomeViewModel`.

`User` stands for User model for the project under `Model` folder.

Also, dependency are injected at `AppDelegate` file. Please review that part too.


## Used Dependencies

I used following open source frameworks and libraries:

1. [Alamofire](https://github.com/Alamofire/Alamofire)

2. [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)

3. [ReactiveSwift](https://github.com/ReactiveCocoa/ReactiveSwift)

4. [Swinjec](https://github.com/Swinject/Swinject)

5. [Reusable](https://github.com/AliSoftware/Reusable)

# Cocoapods
Cocoapods is used as dependency manager to manage 3rd party libraries and resources. See also [Cocoapods](http://cocoapods.org)
