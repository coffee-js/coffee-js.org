
require("calabash").do "watch compile",
  "pkill -f doodle"
  "jade -o ./ -wP layout/index.jade"
  "doodle index.html"