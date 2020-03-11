// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of Expect;

/**
 * Expect is used for tests that do not want to make use of the
 * Dart unit test library - for example, the core language tests.
 * Third parties are discouraged from using this, and should use
 * the expect() function in the unit test library instead for
 * test assertions.
 *
 * This part contains all except
 *   static void _fail(String message) {}
 */
class Expect {
  /**
   * Checks whether the expected and actual values are equal (using `==`).
   */
  static void equals(var expected, var actual, [String? reason = null]) {
    if (expected == actual) return;
    if ((expected is double) &&
        (actual is double) &&
        (expected.isNaN) &&
        (actual.isNaN)) {
      return;
    }
    String msg = _getMessage(reason);
    _fail("Expect.equals(expected: <$expected>, actual: <$actual>$msg) fails.");
  }

  /**
   * Checks whether the actual value is a bool and its value is true.
   */
  static void isTrue(var actual, [String? reason = null]) {
    if (_identical(actual, true)) return;
    String msg = _getMessage(reason);
    _fail("Expect.isTrue($actual$msg) fails.");
  }

  /**
   * Checks whether the actual value is a bool and its value is false.
   */
  static void isFalse(var actual, [String? reason = null]) {
    if (_identical(actual, false)) return;
    String msg = _getMessage(reason);
    _fail("Expect.isFalse($actual$msg) fails.");
  }

  /**
   * Checks whether [actual] is null.
   */
  static void isNull(actual, [String? reason = null]) {
    if (null == actual) return;
    String msg = _getMessage(reason);
    _fail("Expect.isNull(actual: <$actual>$msg) fails.");
  }

  /**
   * Checks whether [actual] is not null.
   */
  static void isNotNull(actual, [String? reason = null]) {
    if (null != actual) return;
    String msg = _getMessage(reason);
    _fail("Expect.isNotNull(actual: <$actual>$msg) fails.");
  }

  /**
   * Checks whether the expected and actual values are identical
   * (using `identical`).
   */
  static void identical(var expected, var actual, [String? reason = null]) {
    if (_identical(expected, actual)) return;
    String msg = _getMessage(reason);
    _fail("Expect.identical(expected: <$expected>, actual: <$actual>$msg) "
        "fails.");
  }

  // Unconditional failure.
  static void fail(String msg) {
    _fail("Expect.fail('$msg')");
  }

  /**
   * Failure if the difference between expected and actual is greater than the
   * given tolerance. If no tolerance is given, tolerance is assumed to be the
   * value 4 significant digits smaller than the value given for expected.
   */
  static void approxEquals(num expected, num actual,
      [num? tolerance = null, String? reason = null]) {
    if (tolerance == null) {
      tolerance = (expected / 1e4).abs();
    }
    // Note: use !( <= ) rather than > so we fail on NaNs
    if ((expected - actual).abs() <= tolerance) return;

    String msg = _getMessage(reason);
    _fail('Expect.approxEquals(expected:<$expected>, actual:<$actual>, '
        'tolerance:<$tolerance>$msg) fails');
  }

  static void notEquals(unexpected, actual, [String? reason = null]) {
    if (unexpected != actual) return;
    String msg = _getMessage(reason);
    _fail("Expect.notEquals(unexpected: <$unexpected>, actual:<$actual>$msg) "
        "fails.");
  }

  /**
   * Specialized equality test for strings. When the strings don't match,
   * this method shows where the mismatch starts and ends.
   */
  static void stringEquals(String? expected, String? actual,
      [String? reason = null]) {
    String msg = _getMessage(reason);
    String defaultMessage =
        'Expect.stringEquals(expected: <$expected>", <$actual>$msg) fails';

    if (expected == actual) return;
    if ((expected == null) || (actual == null)) {
      _fail('$defaultMessage');
      return;
    }
    // scan from the left until we find a mismatch
    int left = 0;
    int eLen = expected.length;
    int aLen = actual.length;
    while (true) {
      if (left == eLen) {
        assert(left < aLen);
        String snippet = actual.substring(left, aLen);
        _fail('$defaultMessage\nDiff:\n...[  ]\n...[ $snippet ]');
        return;
      }
      if (left == aLen) {
        assert(left < eLen);
        String snippet = expected.substring(left, eLen);
        _fail('$defaultMessage\nDiff:\n...[  ]\n...[ $snippet ]');
        return;
      }
      if (expected[left] != actual[left]) {
        break;
      }
      left++;
    }

    // scan from the right until we find a mismatch
    int right = 0;
    while (true) {
      if (right == eLen) {
        assert(right < aLen);
        String snippet = actual.substring(0, aLen - right);
        _fail('$defaultMessage\nDiff:\n[  ]...\n[ $snippet ]...');
        return;
      }
      if (right == aLen) {
        assert(right < eLen);
        String snippet = expected.substring(0, eLen - right);
        _fail('$defaultMessage\nDiff:\n[  ]...\n[ $snippet ]...');
        return;
      }
      // stop scanning if we've reached the end of the left-to-right match
      if (eLen - right <= left || aLen - right <= left) {
        break;
      }
      if (expected[eLen - right - 1] != actual[aLen - right - 1]) {
        break;
      }
      right++;
    }
    String eSnippet = expected.substring(left, eLen - right);
    String aSnippet = actual.substring(left, aLen - right);
    String diff = '\nDiff:\n...[ $eSnippet ]...\n...[ $aSnippet ]...';
    _fail('$defaultMessage$diff');
  }

  /**
   * Checks that every element of [expected] is also in [actual], and that
   * every element of [actual] is also in [expected].
   */
  static void setEquals(Iterable<Object> expected, Iterable<Object> actual,
      [String? reason = null]) {
    final missingSet = new Set.from(expected);
    missingSet.removeAll(actual);
    final extraSet = new Set.from(actual);
    extraSet.removeAll(expected);

    if (extraSet.isEmpty && missingSet.isEmpty) return;
    String msg = _getMessage(reason);

    StringBuffer sb = new StringBuffer("Expect.setEquals($msg) fails");
    // Report any missing items.
    if (!missingSet.isEmpty) {
      sb.write('\nExpected collection does not contain: ');
    }

    for (final val in missingSet) {
      sb.write('$val ');
    }

    // Report any extra items.
    if (!extraSet.isEmpty) {
      sb.write('\nExpected collection should not contain: ');
    }

    for (final val in extraSet) {
      sb.write('$val ');
    }
    _fail(sb.toString());
  }

  /**
   * Calls the function [f] and verifies that it throws an exception.
   * The optional [check] function can provide additional validation
   * that the correct exception is being thrown.  For example, to check
   * the type of the exception you could write this:
   *
   *     Expect.throws(myThrowingFunction, (e) => e is MyException);
   */
  static void throws(void f(),
      [_CheckExceptionFn? check = null, String? reason = null]) {
    if (!(f is Function)) {
      String msg = reason == null ? "" : reason;
      _fail(
          "Expect.throws($f, $msg): first argument is not a Function, but a ${f.runtimeType}");
    }
    try {
      f();
    } catch (e, s) {
      if (check != null) {
        if (!check(e)) {
          String msg = reason == null ? "" : reason;
          _fail("Expect.throws($msg): Unexpected ${e.runtimeType}('$e')\n$s");
        }
      }
      return;
    }
    String msg = reason == null ? "" : reason;
    _fail('Expect.throws($msg) fails');
  }

  static String _getMessage(String? reason) =>
      (reason == null) ? "" : ", '$reason'";

  static void listEquals(var expected, var actual, [String? reason = null]) {
    if (expected is! List) {
      Expect.fail("expected is not a List:$expected");
    }
    if (actual is! List) {
      Expect.fail("actual is not a List:$expected");
    }
    deepEquals(expected, actual, reason);
  }

  static void mapEquals(var expected, var actual, [String? reason = null]) {
    if ((expected is! Map) || (actual is! Map)) {
      Expect.fail("not a Map");
    }
    deepEquals(expected, actual, reason);
  }

  /** checks that both collections have identical topology and equal primitive elements.
   *  useful to check cyclic collections passed through ports and streams.
   */
  static void deepEquals(var expected, var actual, [String? reason = null]) {
    Map planned = new Map();
    Map processed = new Map();

    void plan2check(var expected, var actual) {
      if (expected == null) {
        Expect.isNull(actual);
      }
      ;
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
              "Collections' lengths are not equal: expected length=${expected.length}, actual length=${actual.length}");
          planned[expected] = actual;
        }
      } else {
        Expect.equals(expected, actual);
      }
    }

    void runPlanned(var expected, var actual) {
      if (expected is Map) {
        for (var key in expected.keys) {
//        TODO check that key sets are equivalent. Following method does not work:
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
      // move pair from planned to processed
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
      String msg = _getMessage(reason);
      _fail('deepEquals($expected, $actual, $msg) fails\n   [cause: $error]');
    }
  }

  static void iterableEquals(Iterable expected, Iterable actual) {
    Iterator eit = expected.iterator;
    Iterator ait = actual.iterator;
    while (eit.moveNext()) {
      Expect.isTrue(ait.moveNext());
      Expect.equals(eit.current, ait.current);
    }
    Expect.isFalse(ait.moveNext());
  }
}

bool _identical(a, b) => identical(a, b);

typedef bool _CheckExceptionFn(exception);

class ExpectException implements Exception {
  String? message;
  ExpectException([this.message]);
  String toString() => message ?? "";
}
