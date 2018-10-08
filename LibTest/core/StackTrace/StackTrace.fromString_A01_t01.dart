/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StackTrace.fromString(String stackTraceString)
 * Create a StackTrace object from stackTraceString.
 *
 * The created stack trace will have a toString method returning
 * stackTraceString.
 * ...
 * @description Checks that this constructor can be executed without error and
 * created StackTrace object equals to stackTraceString
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  StackTrace st = new StackTrace.fromString("From string");
  Expect.equals("From string", st.toString());
}
