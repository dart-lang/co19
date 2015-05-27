/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests the properties of the exception thrown by dispatchEvent.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  Expect.throws(() {
    // raises a InvalidStateError
    document.dispatchEvent(null);
  }, (e) => e is DomException && e.name == DomException.INVALID_STATE /*'InvalidStateError'*/);
}



