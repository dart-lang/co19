// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void attach(
///    Object value,
///    T finalizationToken,
///    {Object? detach}
/// )
/// Attaches this finalizer to [value].
///
/// When [value] is longer accessible to the program, while still having an
/// attachement to this finalizer, the [callback] of this finalizer may be
/// called with [finalizationToken] as argument.
///
/// @description Checks that finalizer can be attached to the different objects
/// and token is passed as a callback function parameter when object becomes
/// inaccessible.
/// @author iarkh@unipro.ru

import '../../gc_utils_lib.dart';
import '../../../../Utils/expect.dart';

class A {}
Object? returnedToken;
int cnt = 0;

final Finalizer finalizer = Finalizer((token) {
  returnedToken = token;
  cnt++;
});

@pragma('vm:never-inline')
void test() {
  Object? obj = Object();
  finalizer.attach(obj, "Just a string");
  print(obj);
}

main() async {
  test();
  await triggerGcWithDelay();
  Expect.equals("Just a string", returnedToken);

  Object? obj = A();
  finalizer.attach(obj, 15);
  print(obj);
  obj = List.filled(100, 1);
  await triggerGcWithDelay();
  Expect.equals(15, returnedToken);

  finalizer.attach(obj, []);
  print(obj);
  obj = A();
  await triggerGcWithDelay();
  Expect.equals([], returnedToken);

  await triggerGcWithDelay();
  Expect.equals(3, cnt);
}
