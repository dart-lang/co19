/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<WebSocket> bind(Stream<HttpRequest> stream)
 * Transforms the provided stream.
 * Returns a new stream with events that are computed from events of the
 * provided stream.
 * @description Checks that the method bind returns Stream<WebSocket> object.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  var sc = new StreamController();
  var s = sc.stream;

  var st = (new WebSocketTransformer()).bind(s);
  Expect.isTrue(st is Stream<WebSocket>);
}
