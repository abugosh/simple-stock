import DS from 'ember-data';

export default DS.Model.extend({
  low: DS.attr('number'),
  high: DS.attr('number'),
  open: DS.attr('number'),
  close: DS.attr('number'),
  date: DS.attr('date')
});
