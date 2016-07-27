import Plotly from 'npm:plotly.js';
import PlotlyFinance from 'npm:plotlyjs-finance';
import Ember from 'ember';

export default Ember.Component.extend({
  didRender: function() {
    if (this.attrs.quotes) {
      var quotes = this.attrs.quotes.value;
      var params = {open: [], high: [], low: [], close: [], dates: []};
      quotes.map(function(quote) {
        params.open.push(quote.get('open'));
        params.high.push(quote.get('high'));
        params.low.push(quote.get('low'));
        params.close.push(quote.get('close'));

        params.dates.push(quote.get('date'));
      });
      var fig = PlotlyFinance.createCandlestick(params);

      Plotly.plot('history-chart', fig.data, fig.layout);
    }
  }
});
