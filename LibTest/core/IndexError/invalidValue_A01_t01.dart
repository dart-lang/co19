/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic invalidValue
 * @description Checks that this property returns an invalidValue
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var indexable = "indexable";
  IndexError e = new IndexError(12, indexable);
  Expect.equals(12, e.invalidValue);
}
