/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool autoUncompress
 *  read / write
 *  Get and set whether the body of a response will be automatically
 *  uncompressed.
 *
 *  The body of an HTTP response can be compressed. In most situations providing
 *  the un-compressed body is most convenient. Therefore the default behavior is
 *  to un-compress the body. However in some situations (e.g. implementing a
 *  transparent proxy) keeping the uncompressed stream is required.
 *
 *  NOTE: Headers in from the response is never modified. This means that when
 *  automatic un-compression is turned on the value of the header Content-Length
 *  will reflect the length of the original compressed body. Likewise the header
 *  Content-Encoding will also have the original value indicating compression.
 *
 *  NOTE: Automatic un-compression is only performed if the Content-Encoding
 *  header value is gzip.
 *
 *  This value affects all responses produced by this client after the value is
 *  changed.
 *  To disable, set to false.
 *
 *  Default is true.
 * @description Checks that default value of this property is true
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

void main() {
  HttpClient client = new HttpClient();
  Expect.isTrue(client.autoUncompress);
}
