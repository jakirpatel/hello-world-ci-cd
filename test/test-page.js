var expect  = require('chai').expect;
var request = require('request');

it('Main page content', function() {
    request('http://localhost:3000' , function(error, response, body) {
        expect(body).to.equal('Hello World!');
    });
});
it('Main page status', function() {
    request('http://localhost:3000' , function(error, response, body) {
        expect(response.statusCode).to.equal(200);
    });
});

it('About page content', function() {
    request('http://localhost:3000/about' , function(error, response, body) {
        expect(response.statusCode).to.equal(404);
    });
});
