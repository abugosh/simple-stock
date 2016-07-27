import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    search: function() {
      this.sendAction('search', {term: this.$('#searchField').val()});
    }
  }
});
