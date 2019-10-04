/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In cases where the context type is not specific enough to
 * disambiguate, we could make it an error instead of defaulting to map.
 * @description Checks that {...?null} collection type is detected correctly
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

Set emptyset = {};
Map emptymap = {};

main() {
  Set res1 = {...?null};
  Expect.setEquals(emptyset, res1);

  Map res2 = {...?null};
  Expect.mapEquals(emptymap, res2);
}
