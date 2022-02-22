# zemoga-ios-test
This project is a mobil test for Zemoga, the goal is consumes the free resources of the API https://jsonplaceholder.typicode.com/ and create an app that displays its data.

# Demo
aqui va el demo.

# Features
zemoga-ios-test is an app that has 2 main modules such as:

## List Post
This module has 2 submodules:
- All Post: Consumes the endpoint ```/posts``` and lists all available posts.
- Favorites Post: Lists all favorite posts saved in ```userDefaults``` of the app.

## Post Details
This module shows detailed information of selected post, it appears here:
- Message body content.
- User information. This information is queried from the endpoint ```/users?id```.
- Post comments list. This information is queried from the endpoint ```/comments?postId```.

# Architecture
In this application I've implemented the viper clean architecture pattern, being this the best scalable, sustainable and testable pattern; being able to develop different modules and submodules of the app in a more orderly way and closer to the implementation of solid principles, clean code and good practices in software development.

# Dependencies used
In this project I have implemented the use of cocoapods which are used for API requests, mapping JSON objects and showing the progress of some user actions. Pods installed:
- Alamofire.
- ObjectMapper.
- SVProgress.

# Installation and Run app
Once you have downloaded the project be sure to install the pods:
```
pod install
```

> If you need help to install cocoapods you can follow https://cocoapods.org/

After installing all dependencies you must run:
```
open zemoga-ios-test.xcworkspace
```

# Support
zemoga-ios-test supports iOS 14+
