# You Can Mock Me As Much As You Like



# Brain Dump

Notes from presentaiton development. Does not mirror the contents of the slides.

## Definitions

> Writing defect-free software is exceedingly difficult. Proof of correctness of real systems is still well beyond our abilities.
> -- Gerard Meszaros, xUnit Test Patterns: Refactoring Test Code

* Mock
* Stub

https://martinfowler.com/articles/mocksArentStubs.html

>Meszaros uses the term **Test Double** as the generic term for *any kind of pretend object used in place of a real object for testing purposes*.
>The name comes from the notion of a Stunt Double in movies. (One of his aims was to avoid using any name that was already widely used.) Meszaros then defined four particular kinds of double:
>
>**Dummy** objects are passed around but never actually used.
>Usually they are just used to fill parameter lists.
>
>**Fake** objects actually have working implementations, but usually take some shortcut which makes them not suitable for production (an in memory database is a good example).
>
>**Stubs** provide canned answers to calls made during the test, usually not responding at all to anything outside what's programmed in for the test.
>Stubs may also record information about calls, such as an email gateway stub that remembers the messages it 'sent', or maybe only how many messagesit 'sent'.
>
>**Mocks** objects pre-programmed with expectations which form a specification of the calls they are expected to receive.

**System Under Test** (SUT), or rather the abbreviation SUT.

**State Verification**: which means that we determine whether the exercised method worked correctly by examining the state of the SUT and its collaborators after the method was exercised

> Mocks use **behavior verification**: check to see if the system made the correct calls
>
> [State Verification](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/ch21.html#ch21lev1sec1) (page [462](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/ch21.html#ch21lev1sec1)) is done using assertions and is the simpler of the two approaches. [Behavior Verification](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/ch21.html#ch21lev1sec2) (page [468](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/ch21.html#ch21lev1sec2)) is more complicated and builds on the assertion techniques we use for verifying state.

**Depended-on Component** (DOC), An individual class or a large-grained component on which the system under test (SUT) depends. 

> The [**test fixture**](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/gloss01.html#gloss01_162) is everything we need to have in place to exercise the SUT. Typically, it includes at least an instance of the class whose method we are testing.

[*xUnit Test Patterns: Refactoring Test Code* by Gerard Meszaros](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/)

### Quotes from *xUnit Test Patterns*

#### Basics

> ensuring that tests do not depend on anything they did not set up themselves

> [Test Double](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/ch23.html#ch23lev1sec1)(page [522](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/ch23.html#ch23lev1sec1)) for the objects that act as interfaces to the other applications

>  functionally equivalent[Fake Objects](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/ch23.html#ch23lev1sec5) (page [551](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/ch23.html#ch23lev1sec5)) to speed up our tests

#### Test Smells

* **Project** smells are symptoms that something has gone wrong on the project. Their root cause is likely to be one or more of the code or behavior smells.

* **Behavior** smells are encountered when we compile or run tests. The most common behavior smell is [Fragile Tests](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/ch16.html#ch16lev1sec3). It arises when tests that once passed begin failing for some reason.

  *  [Frequent Debugging](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/ch16.html#ch16lev1sec4) is a sign that the unit tests are lacking in coverage or are trying to test too much functionality at once.

* **Code** smells...typically affect maintenance cost of tests, they may also be early warning signs of behavior smells to follow.

  *  Tests should be simple, linear sequences of statements. 


  https://dev.to/ruidfigueiredo/what-exactly-is-a-unit-in-unit-testing

#### Economics of Test Automation

Ideal

![image](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/graphics/f03fig01.gif)

* Goal: Tests as Specification
* Goal: Bug Repellent
* Goal: Defect Localization
* Goal: Tests as Documentation
* Goal: Tests as Safety Net
* Goal: Do No Harm
* Goal: Fully Automated Test
* Goal: Self-Checking Test
* Goal: Repeatable Test
* Goal: Simple Tests
* Goal: Expressive Tests
* Goal: Separation of Concerns
* Goal: Robust Test

> #### Tests Should Help Us Understand the SUT

> a library of [Test Utility Methods](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/ch24.html#ch24lev1sec2) that constitute a domain-specific testing language

[Test Automation Manfiesto](http://xunitpatterns.com/~gerard/xpau2003-test-automation-manifesto-paper.pdf)

## What to Mock and When

![](/lib/goals_priciples_smells.png)



####  Use the Front Door First

Use the interface the client is expected to use.

**Figure 6.7.** A round-trip test interacts with the SUT only via the front door. The test on the right replaces a DOC with a Fake Object to improve its repeatability or performance.

![image](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/graphics/f06fig07.gif)

**Figure 6.8.** A layer-crossing test can interact with the SUT via a "back door." The test on the left controls the SUT's indirect inputs using a Test Stub. The test on the right verifies its indirect outputs using a Mock Object.

![image](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/graphics/f06fig08.gif)

**Figure 6.10.** A Test Double being "injected" into a SUT by a test. A test can use Dependency Injection to replace a DOC with an appropriate Test Double. The DOC is passed to the SUT by the test as or after it has been created.

![image](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/graphics/f06fig10.gif)

#### Don't Modify the SUT

May use a test double to control input and output and avoid unacceptable side effects.

### Four distinct phases

 fixture setup, exercise SUT, result verification, and fixture teardown.

![image](https://www.safaribooksonline.com/library/view/xunit-test-patterns/9780131495050/graphics/f06fig06.gif)


## Mock script file invocation
jaykul	[11/18 10:14 AM] TIL how to mock script files:
${function:C:\Users\joel.bennett\script.ps1}={Write-Host "All Clear" -Fore Green}

## Mock Return type
Mock Function { [PSCustomObject]@{ PSTypeName = 'Microsoft.UpdateServices.Internal.BaseApi.UpdateServer' } }

or you might be able to mock the function that gets the object to return a mocked object

## Mock native commands

``` powershell
function ping { return @'
Pinging USHOLCHU1-L.LYV.LiveNation.com [::1] with 32 bytes of data:
Reply from ::1: time<1ms
Reply from ::1: time<1ms
Ping statistics for ::1:
    Packets: Sent = 2, Received = 2, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 0ms, Maximum = 0ms, Average = 0ms
'@
}
```

## Mock Web APIs

Mock Invoke-RestMethod
Spin up PowerShell based web service

## Mocking ScriptBlocks??