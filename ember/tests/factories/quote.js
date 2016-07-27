import FactoryGuy from 'ember-data-factory-guy';

FactoryGuy.define('quote', {
  sequences: {
    low: function(num) { return num; },
    high: function(num) { return num + 10; },
    open: function(num) { return num + Math.round(10 * Math.random()); },
    close: function(num) { return num + Math.round(10 * Math.random()); },
    date: function(num) { return new Date(num * 86400000); } // 86400000 is milliseconds in day
  },
  default: {
    low: FactoryGuy.generate('low'),
    high: FactoryGuy.generate('high'),
    open: FactoryGuy.generate('open'),
    close: FactoryGuy.generate('close'),
    date: FactoryGuy.generate('date')
  }
});
