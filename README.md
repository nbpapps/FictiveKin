# FictiveKin - Image search

Details regarding the app:
* It uses pixabay.com to search for images. 
* Images are displayed in a collection view with cells adjusting to the image size
* Each image can be selected to show the large scale version, which can be shared
* The main screen in meant to be simplified with only a search field and the action button is shown when the user enters a query.

Information about the code:
* The app is built using the MVVM pattern. The ImageListViewModel handles all the information needed for requesting and displaying images.
* The two screens in the app are built from a View Controller and a Logic Controller, which gives a separation between display and logic.
* I use Child View Controllers to show different states for a given screen (for example, in the second screen, I switch between 3 possible child VCs - the grid of images, a loading indicator and a message view. The use of child VCs is helpful for reuse - the loading and message views are not connected to any specific screen, so they can be shown at any point.
* I used KingFisher SDK (https://github.com/onevcat/Kingfisher) for image loading.
* Collection View layout is configured via a UICollectionViewCompositionalLayout object
* Network URLs are built using URLComponents
* The Collection View has a separate Data Source object (which is good for reuse if another screen needed to show the same information)
* Most UI elements are built using a custom subclass. This makes the code in the VC much smaller and is also good for separation of concerns  


Notes:
* Most of the UI is implemented in code. The main screen is implemented in storyboard. I decided to show the both kinds of implementation


Known Issues:
* When sharing the image, there are layout warnings that are due to the share sheet presented by iOS.
* There are cases in which  layout warnings are shown on the main screen. This happens on the simulator and seams to be caused by the navigation bar
* When scrolling to the bottom of the collection view, there is no indication for additional loading cells. I did not want to clutter the UI with an additional indicator
* When requesting the next page of the images, the error is not taken into account. This could be implemented with a "notification style" alert from the top of the screen
