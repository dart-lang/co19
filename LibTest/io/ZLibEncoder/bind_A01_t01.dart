/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<List<int>> bind(Stream<List<int>> stream)
 * Transforms the provided stream.
 * Returns a new stream with events that are computed from events of the
 * provided stream.
 * @description Checks that the bind method transforms stream's events.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

Future check(List<int> l) async {
  ZLibEncoder encoder = new ZLibEncoder();
  var sc = new StreamController();
  var s = sc.stream;

  Sink<List<int>> sink = sc.sink;
  sink.add(l);
  sink.close();

  List<int> cl = encoder.convert(l); ;
  await for (List<int> event in encoder.bind(s)) {
    Expect.listEquals(cl.sublist(0, event.length), event);
    cl = cl.sublist(event.length);
  }
}

main() {
  var l1 = [1, 2, 3, 4, 5, 6];
  asyncStart();
  Future.wait([check([]), check(l1)]).then((_) => asyncEnd());
}
