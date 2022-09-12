# Dear Reviewer, Thank you for taking time to review my code.

Listing out the details of the code as below:

Design Pattern: MVVM

Deployment target: 13.0

Device support: iPhone

Orientation: Potrait/Landscape

Details:

* App will fetch data of High school api
* Based on api response, a failure or successfull data representation after the api call is completed
* Network layer is kept as a separate Module and is platform agnostic. 

Implementation Details:

* Service Manager: A class to manage service call with internet connectivity and return models.
* Data Manager: Data manager for the app.
* String Utility: Utility to string in required format
* ActivityIndicator Utility: Activity indicator helper extension
* SatResultsModel: Model for SAT Results
* HighSchoolModel: Model for High School 
* HighSchoolViewModel: High School view model for HighSchoolViewController
* ScoreViewModel: Score view model for ScoreViewController
* HighSchoolCellViewModel: HighSchoolCellViewModel for cells on HighSchoolViewController
* HighSchoolViewController: Displays data for High schools and navigates the user to display data specific to user selection
* ScoreViewController: Displays data for SAT results based on user selection
* NetworkService: Makes api call and returns data
