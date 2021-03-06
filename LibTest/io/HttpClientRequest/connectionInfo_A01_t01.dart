// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion HttpConnectionInfo connectionInfo
/// Get information about the client connection. Returns null if the socket is
/// not available.
/// @description Checks that this property returns the information about the
/// client connection
/// @author sgrekhov@unipro.ru

import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test() async {
  String helloWorld = "Hello test world!";
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    request.response.write(helloWorld);
    request.response.close();
    server.close();
    asyncEnd();
  });

  HttpClient client = new HttpClient();
  client.get(localhost, server.port, "")
      .then((HttpClientRequest request) {
        Expect.isNotNull(request.connectionInfo);
        Expect.equals(server.port, request.connectionInfo?.remotePort);
        Expect.equals(localhost, request.connectionInfo?.remoteAddress.address);
        return request.close();
      })
      .then((HttpClientResponse response) {
        response.cast<List<int>>().transform(utf8.decoder).listen((content) {
          Expect.equals(helloWorld, content);
        });
      });
}

main() {
  asyncStart();
  test();
}
