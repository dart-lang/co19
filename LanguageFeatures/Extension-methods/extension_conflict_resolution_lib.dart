/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
// SharedOptions=--enable-experiment=extension-methods
library extension_conflict_resolution_lib;

extension MyFancyList on List {
  bool get isLibraryVersion => true;
}

extension MyNumList<T extends num> on List<T> {
bool get isNumLibraryVersion => true;
}

extension MyIntList<T extends int> on List<T> {
  bool get isIntLibraryVersion => true;
}

extension MySimpleExt on String {
  bool get isLibraryVersion => true;
  int getANum() => 12345;
  void test() {}
}