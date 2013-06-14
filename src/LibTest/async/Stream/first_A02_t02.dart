/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<T> first
 * If this is empty throws a StateError.
 * Otherwise this method is equivalent to this.elementAt(0).
 * @description Checks that for non-empty stream, this.first is equivalent to this.elementAt(0).
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

const VAL=123;

void check(Stream s) {
  asyncStart();
  s.elementAt(0).then((value){
    Expect.equals(VAL, value);
    asyncEnd();
  });
}

main() {
  check(new Stream.fromFuture(new Future.sync(() => VAL)));
  check(new Stream.fromFuture(new Future(() => VAL)));
  
  // using completable future
  Completer completer = new Completer();
  check(new Stream.fromFuture(completer.future));
  completer.complete(VAL);
  
  // using fromIterable
  check(new Stream.fromIterable([VAL,2,3]));
  check(new Stream.fromIterable(new Iterable.generate(1, (int index)=>VAL)));
  
  // using periodic
  Stream s=new Stream.periodic(durationMs(0), (computationCount)=>VAL);
  check(s);
  
}
