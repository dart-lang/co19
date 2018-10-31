/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<HttpClientResponse> done
 * A HttpClientResponse future that will complete once the response is
 * available. If an error occurs before the response is available, this future
 * will complete with an error.
 * @description Checks that if an error occurs before the response is available,
 * this future will complete with an error.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(String method) async {
  String helloWorld = "Hello test world!";
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    request.response.write(helloWorld);
    request.response.close();
  });

  HttpClient client = new HttpClient();
  int counter = 0;
  final request = await client.open(
      method, server.address.address, server.port, '');
  request.done.catchError((_) {
    counter++;
  });
  try {
    await request.close();
  } catch (error) {
    counter++;
  }
  await client.close();
  await server.close();
  Expect.equals(2, counter);
}

main() {
  test(""); // Use an empty string here as a not a valid HTTP method
}
