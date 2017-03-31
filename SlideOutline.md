# Intro

## You Can Mock Me As Much As You Like

Chris Hunt

Windows Platform Engineer at Ticketmaster

@LogicalDiagram

https://github.com/cdhunt

## Why we are here

>  Writing defect-free software is exceedingly difficult. Proof of correctness of real systems is still well beyond our abilities.
>
>  -- Gerard Meszaros, xUnit Test Patterns: Refactoring Test Code

- You want to write better PowerShell
- You want to build and use unit tests
- Pester has a `Mock` command, but you're not sure when you should use it. 
- You are testing code that calls something that isn't a PowerShell function and `Mock` doesn't work

## Starting Point

Let's assume:

* You have a basic understanding of Pester
* You are convinced that writing unit test are the way to go
* You will likely walk away realizing we've only scratched the surface

# Let's start with the correct vocabulary

We use the term **Mock** generically when there are lot of different way to make fake things. Gerard Meszaros uses the term **Test Double** for **any kind of pretend object used in place of a real object for testing purposes**.

**Dummy Object** An object that is passed around but never used.

**Fake Object** A working object, but takes some shortcuts. Example: Hard codes some properties instead of pulls them from an external source.

**Stubs** Provide static responses to calls made during the test.

**Mocks** Functions pre-programmed with expectations which form a specification of the calls they are expected to receive.

### Some More Definitions

**System Under Test** (SUT) - a single unit of work you are testing

**State Verification** Determine whether a test passed based on the state of the SUT after execution. `{1 -eq 1} | Should Be $true`

**Behavior Verification** Determine whether a test passed based on the calls made during execution. `Assert-MockCalled`, `Should Throw`

**Depended-on Component** (DOC) An individual class or a large-grained component on which the system under test (SUT) depends.

## Cool, but not 1-to-1 in PowerShell

PowerShell is a crazy dynamic language.

# A short story

In 1963 Ford wanted a car at Le Mans and heard Enzo Ferrari was willing to sell. After a great deal of due diligance by Ford, Ferrari walked out when he found out Ford refused to let him remain in control of the racing division. Ford was now determined to beat Ferrari and outsourced development of a race car to company based in England. The result was the GT40.

![](http://pictures.topspeed.com/IMG/crop/201208/ford-gt40-gulf-mirag-4_1600x0w.jpg)

In 1964, Despite setting a lap, record all three GT40s failed to finish and Ferrari won.

After the 1964 season, Ford brought in Carrol Shelby to take over the GT40 program.

In 1965, two GT40's were entered and both failed to finish and Ferrari won.

After 1965 Ford built a dynamometer laboratory to automate the testing of the engines as closely as possible to on-course conditions.

![chrome_2017-03-17_13-09-39](C:\Users\chris.hunt\Documents\ShareX\Screenshots\2017-03\chrome_2017-03-17_13-09-39.png)

[Ford Dyno Testing](https://youtu.be/NxP__UPj7L8)

In 1966, the GT40's finished 1-2-3.

![](https://assets.hemmings.com/blog/wp-content/uploads//2015/01/1966_GT40s_LeMans_HR.jpg)

## Just like the GT40 program

* We isolate one component and try simulate real world conditions
* Testing one component allows us to improve faster and cheaper than building and testing the entire product

# Learn by Example

## Mock

```powershell
Mock Function -Parameters @{'A'='B'}
Mock Function -Parameters @{'A'='C'}
Asset-MockCalled -Parameters @{'A'='C'}
```

## Dummy Objects

```powershell
get-example 1
```

```powershell
get-example 2
```

## Fake Object 

## Stub