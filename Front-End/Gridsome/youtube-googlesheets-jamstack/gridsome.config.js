// This is where project configuration and plugin options are located.
// Learn more: https://gridsome.org/docs/config

// Changes here require a server restart.
// To restart press CTRL + C in terminal and run `gridsome develop`

module.exports = {
  siteName: 'Gridsome',
  plugins: [
     {
           use: 'gridsome-source-google-sheets',
           options: {
                  sheetId: '1SRRSArW-SDtRllVelVict8bu01HCLOdd02YHx2hboaw',
                  apiKey: 'AIzaSyAPyBFn-_oxLb-1GYTQjo1fu7ua4FYmAO8'
                  // type: 'TYPE_NAME', //Optional - default is googleSheet. Used for graphql queries.
           }
     }
  ],
  templates: {
     googleSheet: [
          {
               path: '/:Id',
               component: './src/templates/googleSheet.vue'
          }
     ]
  }

}
