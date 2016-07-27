import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    search: function(params) {
      this.transitionToRoute('/search/' + params["term"]);
    }
  }
});
