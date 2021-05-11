// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Stream<ProgressEvent> get onError
/// Stream of error events handled by this HttpRequestEventTarget.
/// @description Checks that an error events issued when attempt to FET unexistent
/// resource is made and error 404 returned.
/// @needsreview issue #16757

import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var request = new HttpRequest();
  var port = crossOriginPort;
  var host = '${window.location.protocol}//${window.location.hostname}:$port';
  var url = '$host/root_dart/tests/co19/src/IntentionallyMissingFile';
  request.open('GET', url);
  asyncStart();
  request.onError.listen((event) {
    asyncEnd();
  });
  request.send();
}
