/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ABSTRACT CLASS IOSink
 * It is an error to add data to the [IOSink] after the sink is closed.
 * @description Checks that its impossible to add an object to the sink after it
 * is closed.
 * @issue 29554
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

class MyStreamConsumer extends StreamConsumer<List<int>> {
  MyStreamConsumer() {}
  Future<dynamic> addStream(Stream<List> stream) { return new Future(() {}); }
  Future close() { return new Future(() {} ); }
}

main() {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.close();

  Expect.throws(() { sink.add([1, 2, 3]); }, (e) => e is StateError);
  Expect.throws(() { sink.addError("error"); }, (e) => e is StateError);
  Expect.throws(() { sink.write(1); }, (e) => e is StateError);
  Expect.throws(() { sink.writeAll([1, "test"]); }, (e) => e is StateError);
  Expect.throws(() { sink.writeln(); }, (e) => e is StateError);
  Expect.throws(() { sink.writeCharCode(53); }, (e) => e is StateError);
}
