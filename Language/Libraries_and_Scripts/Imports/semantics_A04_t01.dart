// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The effect of a repeated invocation of p.loadLibrary() is as
/// follows:
/// • If another invocation of p.loadLibrary() has already succeeded, the
///   repeated invocation also succeeds. Otherwise,
/// • If another invocation of p.loadLibrary() has failed:
///   – If the failure is due to a compilation error, the repeated invocation
///     fails for the same reason.
///   – If the failure is due to other causes, the repeated invocation behaves
///     as if no previous call had been made.
///
/// @description Checks that if an invocation of `p.loadLibrary()` has already
/// succeeded, then the repeated invocation also succeeds
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";
import "static_type_lib.dart" deferred as p;

main() {
  asyncStart();
  p.loadLibrary().then((_) {
    p.foo;
    p.loadLibrary().then((_) {
      asyncEnd();
    });
  });
}
