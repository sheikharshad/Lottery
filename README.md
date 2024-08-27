# Lottery


A) Tools Required
Xcode - 15.4 or similar


B) Installation guide
  1) Take the checkout from git https://github.com/sheikharshad/Lottery
  2) Run the project file in Xcode


C) Project Main architeture
The project is using MMVM + repository patter.  


D) Main Modules
1) LotteryTab - 
The lottery Tab is responsilbe to show the Lottery inforamtion.
  a) Lottery List View show the List of lottery from JSON or cache.
  b) Lottery details View is responsible to show the detail of every Lottery. We can also use aswipe gesture to navigate between different lotteries

2) TicketTab
The TicketTab show the ticket information. the numbers are generates randomly and matched if its a winner. 

3) Repository
The Repository is responsible to fetch the data and give to ViewModel.

4) Components
 It contains all the common UI components to be re-usable.  

4) Tests
Test cases has been written for the business logic.

Improvements 
Framework could be used for StyleKit(all the styles of the application).
Framework for Lottery SDK that keeps the repositry out of the app and make it modularise.
Integrataion Tests could be added to make sure all modules are in place.



