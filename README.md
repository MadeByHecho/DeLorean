# DeLorean
**A Swift testing framework for code using NSDate**

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

DeLorean is a simple testing framework that allows you to exercise production code that depends on NSDate.  DeLorean allows you to explicitly specify the current time when running tests, so your tests don't pass if you run them at Noon but fail if you run them at 6.


## Usage

Using DeLorean is really quite simple.  DeLorean provides 3 public methods for manipulating dates.

```swift
public class func travelTo(date: NSDate?)

public class func travelTo(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) -> NSDate?

public class func backToThePresent()
```

All these methods are pretty self explanatory but lets go into further detail about how to use them.

First off I tend to call backToThePresent() in the tearDown or afterEach function of my test.  That looks something like this

```swift
override func tearDown() {
		DeLorean.backToThePresent()

		super.tearDown()
}
```

This just makes sure that every test starts fresh and we don't spill any changes we made in previous tests into other tests.

Then when I want to test my code given a specific time I can use the travelTo functions.
For example say I wanted to test that something happened on the first of the January.

```swift
func testSomethingHappensOnTheFirstOfJanuary() {
	DeLorean.travelTo(month: 1, day: 1)
	// Something Happens
}
```

All code executed after ```DeLorean.travelTo(month: 1, day: 1)``` NSDate.date() (which you're probably using everywhere) will return a Date in January on the 1st of the month.

If say you already have a date, like your users birthday and want to validate that something happens then you can use the other travelTo function.

```swift
func testWeWishOurUsersHappyBirthday() {
	DeLorean.travelTo(date: user.birthday)
	// some code that validates that we wished them a happy birthday
}
```

DeLorean for now is intentionally simple and I actually removed some NSDate and Int extensions before publishing it.  Hopefully this simplicity serves you well and allows your code and tests to remain clear without mucking things up too much.

Because DeLorean is meant to be used as a Testing framework, the best place to see it in action is in the tests for DeLorean itself.  DeLorean's tests also use [Miles](https://github.com/MadeByHecho/miles) a wrapper around XCTest to make Unit Tests just a bit more readable.

## Installation
The following instructions were taken and repurposed from [Quick](https://github.com/Quick/Quick) because it is the best resource I've seen for integrating with a Test Target.  As such please note that instead of dragging in Quick and Nimble you'll be dragging in DeLorean.


## How to Install DeLorean using [Carthage](https://github.com/Carthage/Carthage)
As Test targets do not have the "Embedded Binaries" section, the frameworks must be added to the target's "Link Binary With Libraries" as well as a "Copy Files" build phase to copy them to the target's Frameworks destination.
 > As Carthage builds dynamic frameworks, you will need a valid code signing identity set up.

1. Add DeLorean to your **[Cartfile.private](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfileprivate)**

    ```
    github "MadeByHecho/DeLorean"
    ```

2. Run `carthage update`
3. From your `Carthage/Build/[platform]/` directory, add DeLorean to your test target's **Link Binary With Libraries** build phase
    ![](http://i.imgur.com/pBkDDk5.png)

4. For your test target, create a new build phase of type **Copy Files**
    ![](http://i.imgur.com/jZATIjQ.png)

5. Set the **Destination** to **Frameworks**, then add the DeLorean framework
    ![](http://i.imgur.com/rpnyWGH.png)

This is not 'the one and only way' to use Carthage to manage dependencies, for further reference check out the [Carthage documentation](https://github.com/Carthage/Carthage/blob/master/README.md)
