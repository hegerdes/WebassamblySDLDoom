const express = require('express')
const app = express()
const port = process.env.PORT || 4242;


app.use(express.static('public'));

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})