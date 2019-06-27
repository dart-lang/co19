/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
// SharedOptions=--enable-experiment=extension-methods
library my_fancy_list_lib2;

extension MyFancyList<T> on List<T> {
  int get doubleLength => this.length * 2;
  List<T> operator-() => this.reversed.toList();
  List<List<T>> split(int at) => <List<T>>[this.sublist(0, at), this.sublist(at)];
  static String get className => "List";
}

extension _MyPrivateList<T> on List<T> {
  int get pDoubleLength => this.length * 2;
  static String get pClassName => "_MyPrivateList";
}
