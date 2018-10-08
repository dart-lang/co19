/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream.eventTransformed(Stream source,
 *   EventSink mapSink(EventSink<T> sink))
 * Creates a stream where all events of an existing stream are piped through
 * a sink-transformation.
 * The given mapSink closure is invoked when the returned stream is listened
 * to. All events from the source are added into the event sink that is
 * returned from the invocation. The transformation puts all transformed
 * events into the sink the mapSink closure received during its invocation.
 * Conceptually the mapSink creates a transformation pipe with the input sink
 * being the returned EventSink and the output sink being the sink it received.
 * @description Checks that error events are the same if mapSink closure
 * returns a sink that correctly implements EventSink.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

// transform: skip evens, produce number and its double
class MySink implements EventSink<int> {
  final _sink;
  MySink(this._sink);
  void add(int i) {
    if (i.isOdd) {
      _sink.add(i);
      _sink.add(i * 2);
    }
  }
  void addError(e, [st]) => _sink.addError(e, st);
  void close() => _sink.close();
}

List<int> input = [1, 2, 3, 4, 5];

main() {
  Stream s = new Stream.fromIterable(input).map((x) {throw x;});
  Stream s2 = new Stream.eventTransformed(s, (sink) => new MySink(sink));

  AsyncExpect.events([], input, s2);
}
