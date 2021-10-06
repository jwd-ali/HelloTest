# HelloFresh Dev Team - Mobile iOS Developer Test

Hello! Thank you for taking the time to try our iOS test. The goal of the test is to assess your coding and design skills.

Note: While we love open source here at HelloFresh, please do not create a public repo with your test in! This challenge is only shared with people interviewing, and for obvious reasons, we'd like it to remain this way.

### Description
The app that you will write will have to load a json file that includes recipes, and then displays them on the screen, allowing the user to select up to 5 recipes.
We provided a template project to help you start, you can modify it however you feel necessary.

### Instructions
- Clone this repo.
- Create a new dev branch.
- Write the data models.
- Write a service that loads and parses the [json file](https://hf-mobile-app.s3-eu-west-1.amazonaws.com/ios/recipes_v3.json).
- Build a single view application that shows a list of recipes loaded using the service you wrote.
- Add selection/deselection functionality.
- Cover the service and the recipe selection code with unit tests.

### General Requirements
- Swift + UIKit required (no ObjC, SwiftUI or any cross-platform solutions)
- Handle errors while loading the json file.
- Try to keep the commits small.
- Write meaningful commit messages.
- Please consider Clean Code Principles.
- Enrich the code with comments and include clear instructions.
- No reactive frameworks (RxSwift, Combine, etc)
- No CoreData.
- The recipes should look similar to the following:

*Selected*:
<br>
<img src = "README Files/recipe-selected.png" width = 600>

*Unselected*:
<br>
<img src = "README Files/recipe-unselected.png" width = 600>

### Tips on How to Tackle the test
- We don't expect you to invest more than 4 hours on this task.
- Schedule a specific time to tackle the test.
- Please treat this as a production code and feel free to choose design patterns you are comfortable with.
- Be well rested and choose a quiet place with no interruptions.
- Read the instructions and requirements carefully, and feel free to ask any questions.
