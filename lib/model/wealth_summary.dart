class WealthSummary {
  int id;
  double total;
  double gain;
  bool hasHistory;
  double profitability;
  double cdi;

  WealthSummary(
      {this.id,
        this.total,
        this.gain,
        this.hasHistory,
        this.profitability,
        this.cdi});

  WealthSummary.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    total = map['total'].toDouble();
    gain = map['gain'].toDouble();
    hasHistory = map['hasHistory'];
    profitability = map['profitability'].toDouble();
    cdi = map['cdi'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['gain'] = this.gain;
    data['hasHistory'] = this.hasHistory;
    data['profitability'] = this.profitability;
    data['cdi'] = this.cdi;
    return data;
  }
}