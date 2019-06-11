/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool autoCompress
 * read / write
 * Whether the HttpServer should compress the content, if possible.
 *
 * The content can only be compressed when the response is using chunked
 * Transfer-Encoding and the incoming request has gzip as an accepted encoding
 * in the Accept-Encoding header.
 *
 * The default value is false (compression disabled). To enable, set
 * autoCompress to true.
 * @description Checks that The content can only be compressed when the response
 * is using chunked Transfer-Encoding and the incoming request has gzip as an
 * accepted encoding in the Accept-Encoding header. Test setting autoCompress =
 * true on server and Accept-Encoding header on client
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

test() async {
  String helloWorld = 'Hello, test world!';
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  server.autoCompress = true;

  asyncStart();
  server.listen((HttpRequest request) {
    request.response
      ..write(helloWorld)
      ..close();
    server.close();
    asyncEnd();
  });
  asyncStart();

  HttpClient client = new HttpClient();
  client.autoUncompress = false;
  client
      .getUrl(Uri.parse(
          "http://${InternetAddress.loopbackIPv4.address}:${server.port}"))
      .then((HttpClientRequest request) {
    // All HttpClient requests set Accept-Encoding: gzip header by default
    return request.close();
  }).then((HttpClientResponse response) {
    Expect.equals(HttpStatus.ok, response.statusCode);
    response.cast<List<int>>().transform(gzip.decoder).transform(utf8.decoder).listen((content) {
      Expect.isTrue(
          response.headers.value(HttpHeaders.contentEncodingHeader) == "gzip");
      Expect.equals(helloWorld, content);
      asyncEnd();
    });
  });
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
