/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream asyncExpand(Stream convert(T event))
 * Creates a new stream with the events of a stream per original event.
 * ...
 * If convert returns null, no value is put on the output stream, just as if it
 * returned an empty stream.
 *
 * @description Checks that the returned stream is a broadcast stream
 * if source stream is.
 * @author a.semenov@unipro.ru
 */
library asyncExpand_A03_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T,E>(Stream<T> stream, Stream<E> convert(T event)) {
  Expect.equals(stream.isBroadcast, stream.asyncExpand(convert).isBroadcast);
}

void test(CreateStreamFunction create) {

    check(create([]), (_) => null);
    check(create([]).asBroadcastStream(), (_) => null);

    check(create([1,2,3,4,5]), (_) => null);
    check(create([1,2,3,4,5]).asBroadcastStream(), (_) => null);

    check(create([]), (e) => create([e]));
    check(create([]).asBroadcastStream(), (e) => create([e]));

    check(create([1,2,3,4,5]), (e) => create([e]));
    check(create([1,2,3,4,5]).asBroadcastStream(), (e) => create([e]));

    check(create([1,2,3,4,5]), (e) => create([e,e]));
    check(create([1,2,3,4,5]).asBroadcastStream(), (e) => create([e,e]));
}
