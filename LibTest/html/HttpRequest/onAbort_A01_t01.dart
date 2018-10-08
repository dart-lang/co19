/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<ProgressEvent> get onAbort
 * Stream of abort events handled by this HttpRequestEventTarget.
 * @description Checks the state an event is fired when the request is aborted.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  var request = new HttpRequest();
  request.open('GET', "test.dart");
  request.onAbort.listen((event) {
    UtilsHtml.show("request.onAbort.listen: $event");
    asyncEnd();
  });
  asyncStart();
  request.send();
  request.abort();
}
