import FactoryGuy from 'ember-data-factory-guy';

FactoryGuy.define('stock', {
  sequences: {
    name: function(num) { return "Company" + num; },
    symbol: function(num) { return "ABC" + num; },
  },
  default: {
    name: FactoryGuy.generate('name'),
    symbol: FactoryGuy.generate('symbol'),
    exchange: 'FOO'
  }
});
