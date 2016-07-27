import { moduleForModel, test } from 'ember-qunit';

moduleForModel('quote', 'Unit | Model | quote', {
  needs: []
});

test('it exists', function(assert) {
  var model = this.subject();

  assert.ok(!!model);
});

test('has expected properties', function(assert) {
  var rawModel = {"low": 10.50,
                  "high": 100.74,
                  "open": 20.55,
                  "close": 40.22,
                  "date": "2016-01-01"};
  var model = this.subject(rawModel);

  assert.equal(model.get('low'), rawModel['low']);
  assert.equal(model.get('high'), rawModel['high']);
  assert.equal(model.get('open'), rawModel['open']);
  assert.equal(model.get('close'), rawModel['close']);
  assert.equal(model.get('date'), rawModel['date']);
});
