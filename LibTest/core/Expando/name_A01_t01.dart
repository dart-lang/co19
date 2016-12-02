/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String name
 * read-only
 * The name of the this Expando as passed to the constructor. If no name was
 * passed to the constructor, the name is null.
 * @description Checks that the value of this property is the same as the string
 * passed to the constructor.
 * @author rodionov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("foo", new Expando("foo").name);
  Expect.equals(null, new Expando().name);
}
