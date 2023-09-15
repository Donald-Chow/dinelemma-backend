# Dinelemma (Backend)

** This app uses Vue as front end, please use this [link](https://github.com/Donald-Chow/dinelemma-frontend) to view the front end repository.

Dinelemma is for diners with a dilemma. Ever run into the problem where you can't decide where to eat with your mate? Dinelemma simplify decision making and find a place where everyone wants to go.

The app is still in constant developement and improvements are coming!

## Description

Dinelemma started as a project to learn about Rails as API and Vue framework. This app is build as a mobile web app and windows views has not be implimented, and may never be implimented.

After logging in you will be greeted by the groups page, where you can create a dining group with your friends. 
You can also go to the explore page where you can browse restaurants where the app uses Google API to fetch for POI and add that to a favorites list. 
In your group, by starting a vote session with a favorites list of your choice, you can your dining party can start voting away.
Instead of choosing the ultimate food location, simply decide 'yes' or 'no' for a restaurant shown on the screen.
Once there is a restaurant where everyone wants to go app will tell you where the group has decided to go once the votes are in.

I have decided to continue building this app and giving it a complete makeover on the frontend UI in Beta version.

## Backend

The backend is build as a Ruby on Rails API. It follow REST API standard and will return JSON to the frontend.

The authentication uses DEVISE_JWT along with PUNDIT for authorization.

The app also utilitze ACTION CABLE for websocket connection where the app listens for:
1. When a voting session starts for a particular group
2. When the app found a match where everyone wants to go

ProstgreSQL is used as the database hosting on HEROKU.

## Authors

As now now, Dinelemma is a solo Developer project.

Donald Chow  

## Version History

* 0.1
    * Initial Release
