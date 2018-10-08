/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const EventStreamProvider<ProgressEvent> readyStateChangeEvent
 * Static factory designed to expose readystatechange events to event handlers
 * that are not necessarily instances of HttpRequest.
 * @description Checks that readystatechange events are exposed.
 */
import "dart:html";
import "dart:async";
import "../../../UtilsHtml/expect.dart";

main() {
  var request = new HttpRequest();
  EventStreamProvider<ProgressEvent> sreamProvider =
      HttpRequest.readyStateChangeEvent;
  Stream<ProgressEvent> stream = sreamProvider.forTarget(document);
  stream.listen((event) {
    Expect.equals("readystatechange", event.type, "stream.listen.onData");
  }, onError: (Object error) {
    Expect.fail("stream.listen:onError($error)");
  });

  request.open('GET', "test.dart");
  Expect.equals(HttpRequest.OPENED, request.readyState, "after open");
  asyncStart();
  request.onLoad.listen((event) {
    switch (request.readyState) {
      case HttpRequest.DONE:
//          UtilsHtml.show(request.responseText);
        asyncEnd();
        break;
      case HttpRequest.HEADERS_RECEIVED:
        break;
      case HttpRequest.LOADING:
        break;
      default:
        Expect.fail(
            "request.onLoad.listen: unexpected readyState:${request.readyState}");
    }
  }, onError: (Object error) {
    Expect.fail("request.onLoad.listen:onError($error)");
  });
  request.send();
  Expect.equals(HttpRequest.OPENED, request.readyState, "after send");
}
