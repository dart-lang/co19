/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object modifiedObject
 * read-only
 * The object that was modified in an incompatible way.
 * @description Checks that modifiedObject property returns object that was
 * modified in an incompatible way
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var ob = "object";
  var error = new ConcurrentModificationError(ob);
  Expect.isTrue(error is ConcurrentModificationError);
  Expect.equals(ob, error.modifiedObject);
}
