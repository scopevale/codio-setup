/**
* Created with project name.
* User: scopevale
* Date: 2014-
* Time: 10:00 PM
* To change this template use Tools | Templates.
*/
'use strict';

// server port
exports.port = process.env.PORT || 3000;

// mongolab credentials
exports.mongodb = {
  uri: process.env.MONGOLAB_URI || process.env.MONGOHQ_URL
};

// thetvdb.com API key
exports.thetvdb = {
    apikey: process.env.TVDB_APIKEY
};

// miscellaneous
exports.companyName = 'scopevale';
exports.projectName = 'TV Show Tracker';
exports.systemEmail = 'scopevale@gmail.com';

// nodemailer - sendgrid.com API credentials
exports.smtp = {
    auth: { 
        user: process.env.SMTP_USER, 
        pass: process.env.SMTP_PASS 
    },
    from: 'TV Show Tracker ✔ <tracker@tvshow.com>'
};
