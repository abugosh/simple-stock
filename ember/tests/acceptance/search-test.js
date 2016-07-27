import Ember from 'ember';
import { module, test } from 'qunit';
import startApp from '../helpers/start-app';

module('Acceptance | search', {
  beforeEach: function() {
    this.application = startApp();
  },

  afterEach: function() {
    Ember.run(this.application, 'destroy');
  }
});

test('visiting /search/Company', function(assert) {
  visit('/search/Company');

  andThen(function() {
    assert.equal(currentURL(), '/search/Company');
    assert.equal(find('.stock-tr').length, 2);
  });
});

test('the search results should include two rows', function(assert) {
  visit('/search/Company');

  andThen(function() {
    assert.equal(find('.stock-tr').length, 2);
  });
});

test('the search results should include the company names', function(assert) {
  visit('/search/Company');

  andThen(function() {
    assert.equal(find('.stock-tr').length, 2);

    assert.ok(find('.stock-tr').text().indexOf('Company 1') > -1);
    assert.ok(find('.stock-tr').text().indexOf('Company 2') > -1);
  });
});

test('the search results should include the stock symbols', function(assert) {
  visit('/search/Company');

  andThen(function() {
    assert.equal(find('.stock-tr').length, 2);

    assert.ok(find('.stock-tr').text().indexOf('ABC:QWERTY1') > -1);
    assert.ok(find('.stock-tr').text().indexOf('ABC:QWERTY2') > -1);
  });
});

test('visiting /search/not_found', function(assert) {
  visit('/search/not_found');

  andThen(function() {
    assert.equal(currentURL(), '/search/not_found');
    assert.equal(find('.stock-tr').length, 0);

    assert.ok(find('.not-found').text().indexOf('No companies found.') > -1);
  });
});

test('clicking a history link should take me to the history page', function(assert) {
  visit('/search/Company');

  andThen(function() {
    click('.stock-tr .btn');

    andThen(function() {
      assert.equal(currentURL(), '/history/QWERTY1');
    });
  });
});
