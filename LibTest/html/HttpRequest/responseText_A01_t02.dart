// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion final String responseText
/// The response in String form or empty String on failure.
/// @description Checks that the property is empty in case of failure.
/// @issue 16757
/// @issue 46608
/// @issue https://github.com/dart-lang/co19/issues/932

import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var port = crossOriginPort;
  var host = '${window.location.protocol}//${window.location.hostname}:$port';
  var url = '$host/root_dart/tests/co19/src/LibTest/html/IntentionallyMissingFile';
  Future<HttpRequest> f = HttpRequest.request(url);
  asyncStart();
  f.then((HttpRequest r) {
    Expect.fail("request.then() called");
  }, onError: (Object error) {
    asyncEnd();
  });
}
