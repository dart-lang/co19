/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<ProgressEvent> get onError
 * Stream of error events handled by this HttpRequestEventTarget.
 * @description Checks that an error events issued when attemt to FET unexistent
 * resourse is made and error 404 returned.
 * @needsreview issue #16757
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  var request = new HttpRequest();
  request.open('GET', "IntentionallyMissingFile");
  asyncStart();
  request.onError.listen((event) {
    UtilsHtml.show("request.onError.listen: $event");
    asyncEnd();
  });
  request.send();
}
