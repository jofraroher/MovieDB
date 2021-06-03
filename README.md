# MovieDB
The following form project is created with the VIPER architecture with the MovieDB API.

<p align="center">
<img width="200" alt="App_Functionality" src="https://user-images.githubusercontent.com/12258711/120683969-d4725080-c463-11eb-8d98-41823ec7114d.gif">
</p>

## Application layers

VIPER divides application logic into distinct components of responsibility: 

- `View`: UI logic, including any user interaction;
- `Interactor`: business logic, akin to application use cases;
- `Presenter`: presentation logic, which maps business logic to view logic;
- `Entity`: entity logic, maintained by repositories & services;
- `Router`: navigation logic, which lives in the same realm as the view.

![viper](https://user-images.githubusercontent.com/12258711/120714542-f5996800-c488-11eb-834e-448b8b80da85.png)

This implementation of VIPER, has some particularities:

- **Builder component**
			
Some approaches consider the module creation task as a responsibility of the **router**. But this violates the **Single Responsibility Principle**, since it is already responsible for navigation between modules.

To solve this problem, **builder** was created. It is in charge of creating all components of the module and make the respective connections.

- **Decoupling between modules and entities**

This way, entities can be used in one or more modules, since they are simple structures with no business logic.

- **Router owns a reference to view**

iOS architecture, the navigation is performed **from a UIViewController to another UIViewController**. Because of this, router has to own the refecence for the view of the current module, **only for navigation purpose**, and receive the view of the destination module, from its builder.

## Single Responsibility Principle

The single responsibility principle states that a class should only have one reason to change.

this means two things:

- A class should only do one thing
- There is only one reason to change a certain class

You violate the single responsibility principle when a class has multiple responsibilities. This becomes clearest when you find that there are more than one reasons to change a class.

## Clean code

A clean code according to my opinion must meet the following characteristics:

- It should be easy to read code.
- It must be a code that is easy to maintain.
- It should be a code that is easy to increase its performance.

Taking these points into account, it is important that each layer of the application has a single responsibility, so that in this way there are no components that in the future have to be uncoupled to increase their characteristics.

In addition to this, I think it helps a lot that in the project that is being developed there is a communication between the team to establish certain rules such as the convention of names of functions and variables and in some way the convention that will be used throughout the project.

## Installation

### Install the dependencies
[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate the dependencies into your Xcode project using CocoaPods run `pod install` in the root of the project

1- Install `CocoaPods` 

2- run `pod install` in the terminal
