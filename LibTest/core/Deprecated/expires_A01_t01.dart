/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String expires
 * read-only
 * A description of when the deprecated feature is expected to be retired.
 * @description Checks that this property returns correct expires value
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var obj = new Deprecated("Expires string");
  Expect.equals("Expires string", obj.expires);
}
