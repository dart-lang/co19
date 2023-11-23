// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion final int status
/// The http result code from the request (200, 404, etc).
/// @description Checks that status is 200 for successful request.

import "dart:html";
import "dart:async";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  asyncStart();
  var port = crossOriginPort;
  var host = '${window.location.protocol}//${window.location.hostname}:$port';
  var url = '$host/root_dart/tests/co19/src/LibTest/html/xhr_cross_origin_data.txt';
  Future<HttpRequest> f = HttpRequest.request(url);
  f.then((HttpRequest r) {
    Expect.equals(200, r.status);
    asyncEnd();
  });
}
