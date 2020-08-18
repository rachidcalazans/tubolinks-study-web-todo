// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// Testing listeners

document.addEventListener("turbolinks:request-start", function(event){
  var xhr = event.data.xhr
  console.log('---')
// console.log(xhr)
  console.log('Updating')
// xhr.setRequestHeader('X-Request-Id2', '123');
// console.log(xhr)
})
//
// document.addEventListener("turbolinks:request-end", function(event){
//   var xhr = event.data.xhr
// console.log('--END-')
// console.log(xhr)
// })
