# zemoga-ios-test
This project is a mobile test for Zemoga, the goal is consumes the free resources of the API https://jsonplaceholder.typicode.com/ and create an app that displays its data.

# Demo
https://user-images.githubusercontent.com/63270114/155180928-e026c1e9-d384-4b6b-8f6a-3cd779040b25.mp4

# Features
zemoga-ios-test is an app that has 2 main modules such as:

## List Post
This module has 2 submodules:
- All Post: Consumes the endpoint ```/posts``` and lists all available posts.
- Favorites Post: Lists all favorite posts saved in ```userDefaults``` of the app.

## Post Details
This module display detailed information of selected post, it appears here:
- Message body content.
- User information. This information is queried from the endpoint ```/users?id```.
- Post comments list. This information is queried from the endpoint ```/comments?postId```.

The actions that the user can perform in this module are:
- 🗑 Delete a post.
- ⭐ Add a post as a favorite.
> This information is stored in the userDefaults of the app.

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
