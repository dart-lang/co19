/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test required arguments of URL object.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  shouldThrow(() => (Url as dynamic).createObjectUrl());
  shouldThrow(() => (Url as dynamic).revokeObjectUrl());
}
