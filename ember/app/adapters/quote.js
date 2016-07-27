import DS from 'ember-data';

export default DS.RESTAdapter.extend({
  query: function(store, type, query) {
    var url = '/api/quotes/' + query['symbol'];

    if (this.sortQueryParams) {
      query = this.sortQueryParams(query);
    }

    return this.ajax(url, 'GET');
  }
});
