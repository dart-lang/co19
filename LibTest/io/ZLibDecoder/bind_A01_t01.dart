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
 * @author a.semenov@unipro.ru
 * @issue @30656
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

void check(List<int> data) {
  ZLibEncoder encoder = new ZLibEncoder();
  List<int> encodedData = encoder.convert(data);

  ZLibDecoder decoder = new ZLibDecoder();
  Stream<List<int>> s = new Stream.fromIterable([encodedData]);

  AsyncExpect.data(data, decoder.bind(s).expand<int>((List<int> e) => e));
}

main() {
  check([]);
  check([1]);
  check([1, 2, 3, 4, 5, 6]);
  check(new List.generate(1000, (int i) => i%256));
}
