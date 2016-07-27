import { moduleForModel, test } from 'ember-qunit';

moduleForModel('stock', 'Unit | Model | stock', {
  needs: []
});

test('it exists', function(assert) {
  var model = this.subject();

  assert.ok(!!model);
});

test('has expected properties', function(assert) {
  var rawModel = {"name": "Apple Inc",
                  "symbol": "APPL",
                  "exchange": "NASDAQ"};
  var model = this.subject(rawModel);

  assert.equal(model.get('name'), rawModel['name']);
  assert.equal(model.get('symbol'), rawModel['symbol']);
  assert.equal(model.get('exchange'), rawModel['exchange']);
});
