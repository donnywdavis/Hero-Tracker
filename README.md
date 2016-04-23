# Homework 07

## Hero-Tracker

Objectives
After completing this assignment, you should…

* know how to use a UITableViewController to display a list of related data
* have more practice with autolayout (esp. if you tackle the hard mode)
* be able to create a model class to store information and easily transport this info around the app. (hard mode)
* know how to read in JSON data from a file included in the app

### Storyboard Tasks
* [x] Remove the view in the storyboard from the template
* [x] Add a Table View Controller to the canvas
* [x] Embed the above in a Navigation Controller
* [x] Add a second View Controller, to be used as the table's detail view
* [x] The table view cell prototype should display two labels. One on the left of the cell and one on the right.
    * [x] The table view cell prototype should have a disclosure indicator
    * [x] The table view cell prototype should have its reuse identifier set (hint: this should match the identifier set in "cellForRowAtIndexPath")
* [x] The detail view should have a custom class name of "HeroDetailViewController". See the identity inspector in Interface Builder.
* [x] The detail view should have 3 labels:
    * [x] A label in the upper left corner that displays the hero's name
    * [x] A label 20 points below the cover name label that displays the hero's home world
    * [x] A label the standard distance (8 points) from the home world label that displays the hero's powers (be sure to set the label to 0 lines in the attributes inspector, as it will allow you to display more than 1 line)
    * [x] These labels should be connected to their appropriate properties in the HeroDetailViewController class.

###Code Tasks
* [x] Remove the ViewController.(h/m) files from the project
* [x] Add a new Table View Controller subclass called HeroTableViewController
* [x] Add a new View Controller subclass called HeroDetailViewController
* [x] Add a new swift class called "Hero"
* [x] Add the heroes.json file to the project
* In HeroTableViewController:
    * [x] Create a property to store custom Hero models
    * [x] Set the title to "S.H.I.E.L.D. Hero Tracker"
    * [x] Call the private method loadHeroes()
    * [x] Create a private method called loadHeroes()
    * [x] Load the JSON file into a local array
    * [x] Create a for loop that iterates over each dictionary in the array and creates a hero object. Add each hero to the heroes array property
    * [x] Sort the heroes array in place to alphabetize the list by hero name
    * [x] Implement the three tableview datasource methods to get each hero in the heroes array to display in the table with the name in the cell's left label and their homeworld in the cell's right label.
    * [x] Implement the didSelectRowAtIndexPath tableview delegate method to transition to the detail view. Be sure to send the appropriate hero object to the detail view controller before you inititate the transition.
* In HeroDetailViewController:
    * [x] Create three IBOutlet properties: nameLabel, heightLabel, abilitiesLabel , and _powersLabel and wire them up to the appropriate labels in the storyboard.
    * [x] Take the name, height, abilities and powers from the hero property and set them to their appropriate label onscreen.

### Hard Mode
* [ ] Add a UIImageView to the detail view to display an avatar-style image of the hero. See the screenshot hardmode.png in today's folder for a guide on how to place it in the view.
* [ ] Find images for each hero on Google image search or similar, add the image files to the project, and then add a fourth key:value pair to the JSON for each hero with the filename of the associated image.
    * [ ] Add a property to the Hero model class to store this filename (as a String)
    * [ ] In the loadHeroes() function, pull this value from the dictionary each time through the loop and store it in your new model property
    * [ ] In the same place in HeroDetailViewController where you set the three labels, add another instruction that uses the filename property from the model object to load the appropriate image into the UIImageView.
