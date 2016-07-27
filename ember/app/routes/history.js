import Ember from 'ember';

export default Ember.Route.extend({
  model(params) {
    return Ember.RSVP.hash({stock: this.store.findRecord('stock', params.symbol),
            quotes: this.store.query('quote', {symbol: params.symbol})});
  }
});
