// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Stream<T>.fromIterable( Iterable<T> elements )
///
/// Creates a stream that gets its data from `elements`.
///
/// The iterable is iterated when the stream receives a listener, and stops
/// iterating if the listener cancels the subscription, or if the
/// [Iterator.moveNext] method returns false or throws. Iteration is suspended
/// while the stream subscription is paused.
///
/// If calling [Iterator.moveNext] on `elements.iterator` throws, the stream
/// emits that error and then it closes. If reading [Iterator.current] on
/// `elements.iterator` throws, the stream emits that error, but keeps iterating
///
/// Can be listened to more than once. Each listener iterates elements
/// independently.
///
/// @description Checks that created stream is not a broadcast stream.
/// @author kaigorodov

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Stream s = new Stream.fromIterable([1, 2, 3]);
  Expect.isFalse(s.isBroadcast);
}
