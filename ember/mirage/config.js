export default function() {

  this.get('/api/stocks/:symbol', function(_schema, request) {
    var symbol = request.params.symbol;
    if (symbol === 'QWERTY1') {
      return {name: 'Company 1', exchange: 'ABC', symbol: 'QWERTY1'};
    }

    return null;
  });

  this.get('/api/stocks/search', function(_schema, request) {
    var term = request.queryParams.name;
    if (term === 'Company') {
      return [{name: 'Company 1', exchange: 'ABC', symbol: 'QWERTY1'},
        {name: 'Company 2', exchange: 'ABC', symbol: 'QWERTY2'}];
    }

    return [];
  });

  this.get('/api/quotes/:symbol', function(_schema, request) {
    var symbol = request.params.symbol;
    if (symbol) {
      return [{high: 10, low: 1, open: 7, close: 5, date: '2016-1-1'}];
    }

    return [];
  });
}
