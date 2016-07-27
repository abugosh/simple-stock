import { moduleForComponent, test } from 'ember-qunit';
import { make, manualSetup } from 'ember-data-factory-guy';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('stock-tr', 'Integration | Component | stock tr', {
  integration: true,
  beforeEach: function () {
    manualSetup(this.container);
  }
});

test('it renders', function(assert) {
  this.render(hbs`{{stock-tr}}`);

  assert.ok(this.$().text().trim().indexOf('History') > -1);
});

test('it puts the symbol data in the component', function(assert) {
  var stock = make('stock');

  this.render(hbs`{{stock-tr stock=stock}}`);

  this.set('stock', stock);

  var out = this.$().text().trim();

  assert.ok(out.indexOf(stock.get('name')) > -1);
  assert.ok(out.indexOf(stock.get('symbol')) > -1);
  assert.ok(out.indexOf(stock.get('exchange')) > -1);
});
