/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HttpConnectionsInfo connectionsInfo()
 * Returns an HttpConnectionsInfo object summarizing the number of current
 * connections handled by the server.
 * @description Checks that this method returns an HttpConnectionsInfo object
 * summarizing the number of current
 * connections handled by the server
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

test() async {
  String helloWorld = 'Hello, test world!';
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  Expect.isNotNull(server.connectionsInfo());
  Expect.equals(0, server.connectionsInfo().active);
  Expect.equals(0, server.connectionsInfo().total);

  asyncStart();
  int count = 0;
  server.listen((HttpRequest request) {
    count++;
    request.response.write(helloWorld);
    Expect.equals(1, server.connectionsInfo().active);
    Expect.equals(2, server.connectionsInfo().total);
    request.response.close();

    Expect.equals(1, server.connectionsInfo().active);
    Expect.equals(2, server.connectionsInfo().total);

    if (count > 1) {
      server.close();
      asyncEnd();
    }
  });

  HttpClient client = new HttpClient();
  Uri uri = Uri
      .parse("http://${InternetAddress.loopbackIPv4.address}:${server.port}");
  client.getUrl(uri).then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
        response.transform(utf8.decoder).listen((content) {
    });
  });
  client.getUrl(uri).then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
        response.transform(utf8.decoder).listen((content) {
    });
  });

  asyncEnd();
}

main() {
  asyncStart();
  test();
}
