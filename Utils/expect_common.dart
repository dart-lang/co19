// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of 'expect.dart';

class Expect {

  /// Checks whether the expected and actual values are equal using `==`.
  static void equals(var expected, var actual, [String reason = '']) {
    if ((expected != actual) &&
        !((expected is double) &&
            (actual is double) &&
            (expected.isNaN) &&
            (actual.isNaN))) {
      _fail('Expect.equals(expected: <$expected>, actual: <$actual>$reason) '
          'fails.');
    }
  }

  /// Checks whether the actual value is [bool] and its value is [true].
  static void isTrue(var actual, [String reason = '']) {
    if (!_identical(actual, true)) {
      _fail('Expect.isTrue($actual$reason) fails.');
    }
  }

  /// Checks whether the actual value is [bool] and its value is [false].
  static void isFalse(var actual, [String reason = '']) {
    if (!_identical(actual, false)) {
      _fail('Expect.isFalse($actual$reason) fails.');
    }
  }

  /// Checks whether [actual] is [null].
  static void isNull(actual, [String reason = '']) {
    if (null != actual) {
      _fail('Expect.isNull(actual: <$actual>$reason) fails.');
    }
  }

   /// Checks whether [actual] is not [null].
  static void isNotNull(actual, [String reason = '']) {
    if (null == actual) {
      _fail('Expect.isNotNull(actual: <$actual>$reason) fails.');
    }
  }

  /// Checks whether the expected and actual values are identical (using
  /// `identical`).
  static void identical(var expected, var actual, [String reason = '']) {
    if (!_identical(expected, actual)) {
      _fail('Expect.identical(expected: <$expected>, '
          'actual: <$actual>$reason) fails.');
    }
  }

  /// Unconditional failure.
  static void fail(String reason) {
    _fail('Expect.fail($reason)');
  }

  /// Checks whether the difference between expected and actual is greater than
  /// the given tolerance. If no tolerance is given, tolerance is assumed to be
  /// a value of the 4 significant digits smaller than the value given for
  /// [expected].
  static void approxEquals(
      num expected, num actual, [num? tolerance, String reason = '']) {
      tolerance ??= (expected / 1e4).abs();

    // Note: use !( <= ) rather than > so we fail on NaNs
    if (!((expected - actual).abs() <= tolerance)) {
      _fail('Expect.approxEquals(expected:<$expected>, actual:<$actual>, '
          'tolerance:<$tolerance>$reason) fails');
    }
  }

  /// Checks whether the expected and actual values are not equal.
  static void notEquals(unexpected, actual, [String reason = '']) {
    if (unexpected == actual) {
      _fail('Expect.notEquals(unexpected: <$unexpected>, '
          'actual:<$actual>$reason) fails.');
    }
  }

  /// Specialized equality test for strings. When the strings don't match,
  /// this method shows where the mismatch starts and ends.
  static void stringEquals(
        String? expected, String? actual, [String reason = '']) {
  String defaultMessage =
    'Expect.stringEquals(expected: <$expected>, <$actual>$reason) fails';
  if (expected == actual) return;

  if (expected == null || actual == null) {
    _fail('$defaultMessage');
  } else {
     // Scan from the left until we find a mismatch
    int left = 0;
    int expLength = expected.length;
    int actLength = actual.length;
    while (true) {
      if (left == expLength) {
        assert(left < actLength);
        String snippet = actual.substring(left, actLength);
        _fail('$defaultMessage\nDiff:\n...[  ]\n...[ $snippet ]');
      } else if (left == actLength) {
        assert(left < expLength);
        String snippet = expected.substring(left, expLength);
        _fail('$defaultMessage\nDiff:\n...[  ]\n...[ $snippet ]');
      } else if (expected[left] != actual[left]) {
        break;
      }
      left++;
    }

    // scan from the right until we find a mismatch
    int right = 0;
    while (true) {
      if (right == expLength) {
        assert(right < actLength);
        String snippet = actual.substring(0, actLength - right);
        _fail('$defaultMessage\nDiff:\n[  ]...\n[ $snippet ]...');
      } else if (right == actLength) {
        assert(right < expLength);
        String snippet = expected.substring(0, expLength - right);
        _fail('$defaultMessage\nDiff:\n[  ]...\n[ $snippet ]...');
      } else if ((expLength - right <= left || actLength - right <= left) ||
          ((expected[expLength - right - 1] != actual[actLength - right - 1]))){
        // Stop scanning if we've reached the end of the left-to-right match
        break;
      }
      right++;
    }

    String eSnippet = expected.substring(left, expLength - right);
    String aSnippet = actual.substring(left, actLength - right);
    String diff = '\nDiff:\n...[ $eSnippet ]...\n...[ $aSnippet ]...';
    _fail('$defaultMessage$diff');
  }
 }

  /// Checks that every element of [expected] is also in [actual], and that
  /// every element of [actual] is also in [expected].
  static void setEquals(Iterable<Object?> expected,
      Iterable<Object?> actual, [String reason = '']) {
    final missingSet = new Set.from(expected);
    missingSet.removeAll(actual);
    final extraSet = new Set.from(actual);
    extraSet.removeAll(expected);

    if (!extraSet.isEmpty || !missingSet.isEmpty) {

      StringBuffer buffer = StringBuffer('Expect.setEquals($reason) fails');
      // Report any missing items.
      if (!missingSet.isEmpty) {
        buffer.write('\nExpected collection does not contain: ');
      }

      for (final val in missingSet) {
        buffer.write('$val ');
      }

      // Report any extra items.
      if (!extraSet.isEmpty) {
        buffer.write('\nExpected collection should not contain: ');
      }

      for (final val in extraSet) {
        buffer.write('$val ');
      }

      _fail(buffer.toString());
    }
  }

  /// Calls the function [func] and verifies that it throws an exception.
  ///
  /// The optional [check] function can provide additional validation that
  /// correct exception is being thrown. For example, to check the type of the
  /// exception you could write this:
  ///
  ///    Expect.throws(myThrowingFunction, (e) => e is MyException);
  static void throws(
      void func(), [_CheckExceptionFn? check, String reason = '']) {
    try {
      func();
    } catch (exception, str) {
      if (check != null && !check(exception)) {
        _fail('Expect.throws($reason): '
            'Unexpected ${exception.runtimeType}($exception)\n$str');
      }
      return;
    }
    _fail('Expect.throws($reason) fails');
  }

  /// Checks that given lists are equal.
  static void listEquals(var expected, var actual, [String reason = '']) {
    if (expected is ! List) {
      Expect.fail('expected is not a List:$expected');
    } else if (actual is! List) {
      Expect.fail('actual is not a List:$expected');
    } else {
      deepEquals(expected, actual, reason);
    }
  }

  /// Checks that given maps are equal.
  static void mapEquals(var expected, var actual, [String reason = '']) {
    if ((expected is! Map) || (actual is! Map)) {
      Expect.fail('not a Map');
    } else {
      deepEquals(expected, actual, reason);
    }
  }

  /// Checks that both collections have identical topology and equal primitive
  /// elements. Useful to check cyclic collections passed through ports and
  /// streams.
  static void deepEquals(var expected, var actual, [String reason = '']) {
    Map planned   = Map();
    Map processed = Map();

    void plan2check(var expected, var actual) {
      if (expected == null) {
        Expect.isNull(actual);
      }

      if ((expected is Map) || (expected is List)) {
        var savedActual = planned[expected];
        if (savedActual != null) {
          // this pair is planned to investigate
          Expect.equals(savedActual, actual);
        } else if ((savedActual = processed[expected]) != null) {
          // this pair is checked already
          Expect.equals(savedActual, actual);
        } else {
          // this pair is not yet investigated
          Expect.equals(expected.length, actual.length,
              'Collection lengths are not equal: '
                  'expected length=${expected.length}, '
                  'actual length=${actual.length}');
          planned[expected] = actual;
        }
      } else {
        Expect.equals(expected, actual, reason);
      }
    }

    void runPlanned(var expected, var actual) {
      if (expected is Map) {
        for (var key in expected.keys) {
//        TODO check that key sets are equivalent.
//        The following method does not work:
//          Expect.isTrue(actual.keys.toSet().remove(key)");
          plan2check(expected[key], actual[key]);
        }
      } else if (expected is List) {
        for (int i = 0; i != expected.length; i++) {
          plan2check(expected[i], actual[i]);
        }
      } else {
        Expect.fail("only Lists and Maps expected in the plan");
      }
      // Move pair from planned to processed
      planned.remove(expected);
      processed[expected] = actual;
    }

    try {
      plan2check(expected, actual);
      for (;;) {
        Iterable keys = planned.keys;
        if (keys.isEmpty) {
          return;
        }
        var key = keys.first;
        runPlanned(key, planned[key]);
      }
    } catch (error) {
      _fail('deepEquals($expected, $actual, $reason) fails\n   [cause: $error]');
    }
  }

  // Checks that given шеукфидуы are equal.
  static void iterableEquals(Iterable expected, Iterable actual) {
    Iterator expIterator = expected.iterator;
    Iterator actIterator = actual.iterator;
    while (expIterator.moveNext()) {
      Expect.isTrue(actIterator.moveNext());
      Expect.equals(expIterator.current, actIterator.current);
    }
    Expect.isFalse(actIterator.moveNext());
  }

  /// Checks that [obj] object is of the type [T] or not.
  static void _checkIs<T>(bool expected, Object? obj) {
    Expect.equals(expected, obj is T);
  }

  /// Call this function with `checkIs` as the first parameter to check the type
  /// to prevent the compiler reducing the code to the answer. Otherwise, dart2js
  /// compiler may optimize `Expect.isTrue(c is C)` to `Expect_isTrue(true)`
  @pragma('dart2js:noInline')
  static void _checkType(void Function(bool, Object?) checker, bool expected, Object? o) {
    checker(expected, o);
  }

  /// Call this function to perform runtime type check. Sometimes compiler (for
  /// example dart2js or AOT) optimizes
  /// `Expect.isTrue(c is C)` to `Expect_isTrue(true)`
  /// If you want to test not only compiler optimization but runtime as well the
  /// use
  /// ```dart
  /// Expect.isTrue(c is C);  // to test optimization
  /// Expect.runtimeIsType<C>(c); // to test runtime
  /// ```
  static void runtimeIsType<T>(Object? o) {
    _checkType(_checkIs<T>, true, o);
  }

  /// Call this function to perform runtime type check. Sometimes compiler (for
  /// example dart2js or AOT) optimizes
  /// `Expect.isFalse(c is C)` to `Expect_isFalse(false)`
  /// If you want to test not only compiler optimization but runtime as well the
  /// use
  /// ```dart
  /// Expect.isFalse(c is C); // to test optimization
  /// Expect.runtimeIsNotType<C>(c); // to test runtime
  /// ```
  static void runtimeIsNotType<T>(Object? o) {
    _checkType(_checkIs<T>, false, o);
  }
}

bool _identical(a, b) => identical(a, b);

typedef bool _CheckExceptionFn(exception);

class ExpectException implements Exception {
  String? message;
  ExpectException([this.message]);
  String toString() => message ?? "";
}

/// Is true iff `assert` statements are enabled.
final bool assertStatementsEnabled = (() {
    bool result = false;
    assert(result = true);
    return result;
  })();

/// Is true iff js compiler is used
final bool isJS = identical(1.0, 1);

/// Checks that objects are identical at the compile time
class CheckIdentical {
  const CheckIdentical(Object? o1, Object? o2) : assert(identical(o1, o2));
}

/// Checks that objects are not identical at the compile time
class CheckNotIdentical {
  const CheckNotIdentical(Object? o1, Object? o2) : assert(!identical(o1, o2));
}
