/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String query
 * Returns the query component. The returned query is encoded. To get direct
 * access to the decoded query use queryParameters.
 * Returns the empty string if there is no query component.
 * @description Checks empty query setting
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals('', Uri.parse('../a/b').query);
}
