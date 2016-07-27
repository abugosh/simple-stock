import DS from 'ember-data';

export default DS.RESTAdapter.extend({
  findRecord: function(store, type, id) {
    var url = '/api/stocks/' + id;

    return this.ajax(url, 'GET');
  },

  query: function(store, type, query) {
    var url = '/api/stocks/search';

    return this.ajax(url, 'GET', { data: query });
  }
});
