React Rails with Flux (Alt) Screencast
=============

Blog post: http://www.openmindedinnovations.com/blogs/react-rails-with-flux-alt-js-tutorial

Youtube video: https://www.youtube.com/watch?v=LWNiqGrLn0A

This is the code for the screencast showing how to integrate [react-rails](https://github.com/reactjs/react-rails) and [Alt.js](http://alt.js.org/) into your rails app. I only use sprockets without npm so it's really simple to setup.



Alt (http://alt.js.org/)
React Rails (https://github.com/reactjs/react-rails)
Lodash (https://lodash.com/)

Setup
=============

```
git clone https://github.com/OpenMindedInnovations/react_rails_flux_screencast.git

cd react_rails_flux_screencast

bundle install

rake db:migrate db:seed

rails s
```