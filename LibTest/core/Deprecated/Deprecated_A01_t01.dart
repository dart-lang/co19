/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Deprecated(String expires)
 * Create a deprecation annotation which specifies the expiration of the
 * annotated feature.
 * @description Checks that this constructor can be called and returns instance
 * of Deprecated with correct expires value
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var obj = new Deprecated("Expires string");
  Expect.equals("Expires string", obj.expires);
}
