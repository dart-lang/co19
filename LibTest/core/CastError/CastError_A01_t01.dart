/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion CastError()
 * @description Checks that this constructor can be called and returns instance
 * of CastError
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var error = new CastError();
  Expect.isTrue(error is CastError);
}
