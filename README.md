# iChat-app
A chat app that I am making in iOS developer course using SwiftUI and Firebase

## Setup

* Swift 5
* SwiftUI 4
* iOS 16
* Firebase
* Swift Package Manager

## Firebase Project Configuration

1. Create new project:

![image](https://user-images.githubusercontent.com/20096045/202316589-5b57d993-248a-47a8-a9f0-3edfffc4a897.png)

![image](https://user-images.githubusercontent.com/20096045/202316668-349011b4-12e8-4dc0-809b-6e529c3c933f.png)

![image](https://user-images.githubusercontent.com/20096045/202316749-57b9831c-e4b3-45d8-9121-3c0be3143583.png)

![image](https://user-images.githubusercontent.com/20096045/202316834-9aa03474-5ff8-46d1-90d3-eeda85153c38.png)

2. Add Firebase in your project, select iOS+ option:

![image](https://user-images.githubusercontent.com/20096045/202317017-19853ee7-3518-4642-836b-6b105b3b9da1.png)

![image](https://user-images.githubusercontent.com/20096045/202317161-879e5c5f-dda1-40e2-9bfa-7d189499b98c.png)

Note: Type the exactaly bundle id of your app project

3. Download and put GoogleService-Info.plist in your project:

![image](https://user-images.githubusercontent.com/20096045/202317343-d33ceb0e-6ef5-47e6-b948-3351ceb5d851.png)

![image](https://user-images.githubusercontent.com/20096045/202317420-19a10eb4-5300-4aa2-96d5-dbe27b17015b.png)

Note: Don't forget adding GoogleService-Info.plist in .gitignore file.

4. Add Firebase SDK in SPM(Swift Package Manager):

![image](https://user-images.githubusercontent.com/20096045/202318074-432459c6-6c0e-4474-ab57-e680f06d6212.png)

Note: In this project, we need Auth, FirestoreDatabase and Storage services

5. Import Firebase on your project:

![image](https://user-images.githubusercontent.com/20096045/202318396-da76dfa1-3c4f-4af3-bf95-d81f592b648b.png)








