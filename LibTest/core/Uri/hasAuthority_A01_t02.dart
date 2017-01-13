/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool hasAuthority
 * Returns whether the URI has an authority component.
 * @description Checks that if path sets an empty authority then this property
 * returns true
 * @issue 28359
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var uri = new Uri(path: "//");
  Expect.isTrue(uri.hasAuthority);
}
