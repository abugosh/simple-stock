import Ember from 'ember';
import { module, test } from 'qunit';
import startApp from '../helpers/start-app';

module('Acceptance | home', {
  beforeEach: function() {
    this.application = startApp();
  },

  afterEach: function() {
    Ember.run(this.application, 'destroy');
  }
});

test('visiting /', function(assert) {
  visit('/');

  andThen(function() {
    assert.equal(currentURL(), '/');
  });
});

test('the home page should have a header with simple stock', function(assert) {
  visit('/');

  andThen(function() {
    assert.equal(find('.page-header h1').text(), 'Simple Stock');
  });
});

test('the home page should have a search button', function(assert) {
  visit('/');

  andThen(function() {
    assert.equal(find('form.search-form a.btn').text(), 'Search');
  });
});
