import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('history-div', 'Integration | Component | history div', {
  integration: true
});

test('it renders', function(assert) {
  this.render(hbs`{{history-div}}`);

  assert.equal(this.$().text().trim(), '');

  this.render(hbs`
    {{#history-div}}
    {{/history-div}}
  `);

  assert.equal(this.$().text().trim(), '');
});
