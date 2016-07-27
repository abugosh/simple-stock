import Ember from 'ember';
import { module, test } from 'qunit';
import startApp from '../helpers/start-app';

module('Acceptance | history', {
  beforeEach: function() {
    this.application = startApp();
  },

  afterEach: function() {
    Ember.run(this.application, 'destroy');
  }
});

test('visiting /history/QWERTY1', function(assert) {
  visit('/history/QWERTY1');

  andThen(function() {
    assert.equal(currentURL(), '/history/QWERTY1');
  });
});

test('the search results should include the symbol info', function(assert) {
  visit('/history/QWERTY1');

  andThen(function() {
    assert.ok(find('.stock-header').text().indexOf('Company 1') > -1);
    assert.ok(find('.stock-header').text().indexOf('ABC:QWERTY1') > -1);
  });
});

test('the search results should include the history div', function(assert) {
  visit('/history/QWERTY1');

  andThen(function() {
    assert.equal(find('.history-div').length, 1);
  });
});
