// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Defines collections used by Patterns tests
/// @author sgrekhov22@gmail.com

library patterns_collections_lib;

import "dart:collection";

class MyList<T> extends ListBase<T> {
  List<T> _inner = [];
  String log = "";
  bool _logLength;
  MyList(this._inner, {logLength = true}) : this._logLength = logLength;

  @override
  int get length {
    if (_logLength) {
      log += "length;";
    }
    return _inner.length;
  }

  @override
  void set length(int newLength) {
    log += "length=;";
    _inner.length = newLength;
  }

  @override
  T operator [](int index) {
    log += "[$index];";
    return _inner[index];
  }

  @override
  void operator []=(int index, T value) {
    log += "[$index]=$value;";
    _inner[index] = value;
  }

  @override
  List<T> sublist(int start, [int? end]) {
    log += "sublist($start, $end);";
    return _inner.sublist(start, end);
  }

  void clearLog() {
    log = "";
  }
}
