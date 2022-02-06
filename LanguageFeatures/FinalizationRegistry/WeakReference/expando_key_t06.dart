// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Not all objects are supported as targets for weak references. The
/// WeakReference constructor will reject any object that is not supported as an
/// Expando key.
///
/// @description Check that WeakReference constructor rejects any object that is
/// not supported as an Expando key. Test null.
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {
    dynamic d = null;
    WeakReference wr = WeakReference(d);
    print(wr.target);
  });
}
