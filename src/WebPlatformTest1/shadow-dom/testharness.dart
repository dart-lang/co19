import "../../Utils/expect.dart";

assert_equals(actual, expected, [reason]) =>
  Expect.equals(expected, actual, reason);

assert_not_equals(actual, expected, [reason]) =>
  Expect.notEquals(expected, actual, reason);

assert_true(actual, [reason]) =>
  Expect.isTrue(actual, reason);

