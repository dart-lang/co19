/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<ProgressEvent> get onReadyStateChange
 * Stream of readystatechange events handled by this HttpRequest.
 * Event listeners to be notified every time the HttpRequest object's readyState changes values.
 * @description Checks that readyState is changed every time an event is fired.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  var request = new HttpRequest();
  var oldState = null;
  request.open('GET', "test.dart");
  asyncStart();
  request.onReadyStateChange.listen((event) {
    var newState = request.readyState;
//  print("  newState=$newState");
    Expect.isFalse(newState == oldState);
    oldState = newState;
    if (HttpRequest.DONE == newState) {
      asyncEnd();
    }
  });
  request.send();
}
