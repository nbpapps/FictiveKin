# FictiveKin - Image search

Details regarding the app:
* It uses pixabay.com to search for images. 
* Images are displayed in a collection view with cells adjusting to the image size
* Each image can be selected to show the large scale version, which can be shared
* The main screen in meant to be simplified with only a search field and the action button is shown when the user entered a query.

Information about the code:


Notes:
* Most of the UI is implemented in code. The main screen is implemented in storyboard. I decided to show the both kinds of implementation


Known Issues:
* When sharing the image, there are layout warnings that are due to the share sheet presented by iOS.
* There are cases in which  layout warnings are shown on the main screen. This happens on the simulator and seams to be caused by the navigation bar
* When scrolling to the bottom of the collection view, there is no indication for additional loading cells. I did not want to clutter the UI with an additional indicator
