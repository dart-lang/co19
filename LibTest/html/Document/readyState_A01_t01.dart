/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String readyState
 * Returns loading status of the document
 * MDN: Returns "loading" while the document is loading,
 * "interactive" once it is finished parsing but still loading sub-resources,
 * and "complete" once it has loaded.
 * @description Checks that readyState is at least "interactive".
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  var readyState = document.readyState;
  Expect.isTrue(("interactive" == readyState) || ("complete" == readyState));
}
