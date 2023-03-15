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

class MyMap<K, V> extends MapBase<K, V> {
  Map<K, V> _inner;
  String log = "";

  MyMap(this._inner);

  @override
  operator [](Object? key) {
    log += "[$key];";
    return _inner[key];
  }

  @override
  void operator []=(key, value) {
    log += "[$key]=$value;";
    _inner[key] = value;
  }

  @override
  void clear() {
    log += "clear();";
    _inner.clear();
  }

  @override
  Iterable<K> get keys {
    log += "keys;";
    return _inner.keys;
  }

  @override
  remove(Object? key) {
    log += "remove($key);";
    return _inner.remove(key);
  }

  @override
  int get length {
    log += "length;";
    return _inner.length;
  }

  @override
  bool containsKey(Object? key) {
    log += "containsKey($key)";
    return _inner.containsKey(key);
  }

  void clearLog() {
    log = "";
  }
}
