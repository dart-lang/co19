// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void add(List<int> data)
/// Adds byte data to the target consumer.
/// @description Checks that the target is added to the consumer after the [add]
/// method call
/// @author iarkh@unipro.ru

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

int called = 0;
List<int> aList = [1, 2, 3, 4, 5];

class MyStreamConsumer implements StreamConsumer<List<int>> {
  Future<dynamic> addStream(Stream<List> stream) {
    stream.toList().then((x) {
      called++;
      Expect.listEquals(aList, x.first);
    });
    return new Future(() {});
  }
  Future close() { return new Future(() {}); }
}

test() async {
  StreamConsumer<List<int>> consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.add(aList);
  await sink.close();
  Expect.equals(1, called);
}

main() { test(); }
