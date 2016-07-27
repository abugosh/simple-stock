import Ember from 'ember';
import JSONSerializer from 'ember-data/serializers/json';

export default JSONSerializer.extend({
  extractId(modelClass, resourceHash) {
    var id = Ember.guidFor(resourceHash);
    return id;
  },
});
