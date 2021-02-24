import 'package:hasura_connect/hasura_connect.dart';
import 'package:fliper_glaidson/constants.dart';
import 'package:fliper_glaidson/model/wealth_summary.dart';

class WealthSummaryService {
  static Future<WealthSummary> getDataWealthSummary() async {
    HasuraConnect hasuraConnect = HasuraConnect(graphqlEndPoint, headers: {
      'content-type': 'application/json',
      'x-hasura-admin-secret': xHasuraAdminSecret
    });

    String docQuery = """
    query MyQuery {
      wealthSummary {
        id
        total
        gain
        hasHistory
        profitability
        cdi
      }
  }
""";

    var r = await hasuraConnect.query(docQuery);

    if (r != null) {
      WealthSummary wealthSummary =
          WealthSummary.fromMap(r['data']['wealthSummary'][0]);

      return wealthSummary;
    }

    return null;
  }
}
