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
 * @description Checks that default value of this property is [false]
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  HttpServer server = null;
  HttpServer.bind(InternetAddress.loopbackIPv4, 0).then((HttpServer s) {
    server = s;
    Expect.isFalse(server.autoCompress);
    asyncEnd();
  }).whenComplete(() {
    if (server != null) {
      server.close();
    }
  });
}
