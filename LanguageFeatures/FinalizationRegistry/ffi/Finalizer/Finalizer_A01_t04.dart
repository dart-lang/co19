// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Finalizer<T> constructor (Null safety)
/// Finalizer<T>(void callback(T))
/// Creates a finalizer with the given finalization callback.
///
/// The callback is bound to the current zone when the [Finalizer] is created,
/// and will run in that zone when called.
///
/// @description Checks that finalizer object can be created and its callback
/// will never run if attached object is accessible.
/// @author iarkh@unipro.ru

import 'dart:async';
import '../../gc_utils_lib.dart';
import '../../../../Utils/expect.dart';

int called = 0;
Object? accessibleLink;

final Finalizer finalizer = Finalizer((token) {
  Expect.equals(123, token);
  called++;
});

Completer<void> completer = Completer<void>();

@pragma('vm:never-inline')
attachToFinalizer() async {
  Object? object = Object();
  finalizer.attach(object, 123);
  await triggerGcWithDelay();
  accessibleLink = object;
  object = null;
  Expect.equals(0, called);
  () async {
    await triggerGcWithDelay();
    Expect.equals(0, called);
    completer.complete();
  }();
}

main() async {
  await attachToFinalizer();
  await completer.future;
  accessibleLink = null;
  // Previous triggerGc move some objects to old space. Do multiple GCs to
  // force all objects to old space.
  await triggerGcWithDelay(repeat: 3);
  Expect.equals(1, called);
  await triggerGcWithDelay();
  Expect.equals(1, called);
}
