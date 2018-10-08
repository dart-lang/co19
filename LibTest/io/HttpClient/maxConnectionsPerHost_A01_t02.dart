/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int maxConnectionsPerHost
 * read / write
 * Get and set the maximum number of live connections, to a single host.
 *
 * Increasing this number may lower performance and take up unwanted system
 * resources.
 *
 * To disable, set to null.
 *
 * Default is null.
 * @description Checks that this property get and set the maximum number of live
 * connections, to a single host
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

void test(int maxConnections, int max) {
  asyncStart();
  HttpServer.bind(localhost, 0).then((server) {
    int handled = 0;
    server.listen((request) {
      if (maxConnections != null) {
        Expect.isTrue(server.connectionsInfo().total <= maxConnections);
      }
      request.response.close();
      handled++;
      if (handled == max) {
        asyncEnd();
        server.close();
      }
    });

    var client = new HttpClient();
    client.maxConnectionsPerHost = maxConnections;
    for (int i = 0; i < max; i++) {
      asyncStart();
      client.getUrl(Uri.parse("http://${localhost}:${server.port}"))
          .then((request) => request.close()).then((response) {
        response.listen(null, onDone: () {
          asyncEnd();
        });
      });
    }
  });
}

void main() {
  test(1, 1);
  test(1, 10);
  test(5, 10);
  test(10, 50);
  test(null, 5);
}
