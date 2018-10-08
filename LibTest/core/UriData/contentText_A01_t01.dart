/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String contentText
 * The content part of the data URI, as its actual representation.
 *
 * This string may contain percent escapes.
 * @description Checks that this property returns the content part of the data
 * URI, as its actual representation.
 * @issue 28700
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("some data",
      UriData.parse("data:text/plain,some data").contentText);
  Expect.equals("some data", new UriData.fromString("some data").contentText);
}
