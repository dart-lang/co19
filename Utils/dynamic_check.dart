library dynamic_check;
import "expect.dart";

isCheckedMode() {
  try {
    var i = 1;
    String s = i;
    return false;
  } on TypeError {
    return true;
  }
}

checkTypeError(f()) {
  if(isCheckedMode()) {
    try {
      f();
      Expect.fail("Type error expected in checking mode");
    } on TypeError {
    }
  } else {
    try {
      f();
    } on TypeError catch(bad) {
      Expect.fail("Unexpected type error in scripting mode: $bad");
    }
  }
}

checkAssertionError(f(), [message]) {
  if(isCheckedMode()) {
    Expect.throws(f, (e) {
      if (e is AssertionError) {
        Expect.equals(message, e.message);
        return true;
      }
      return false;
    }, "Assertion error should be thrown");
  } else {
    try {
      f();
    } on AssertionError catch(bad) {
      Expect.fail("Unexpected assertion error in scripting mode: $bad");
    }
  }
}

/**
 * Check that dynamic error occurs. Dart specification (3rd Edition/June 12015)
 * does not specify what is 'dynamic erros'
 * (see https://github.com/dart-lang/sdk/issues/24394 ). So, for now,
 * this is a stub that checks that Error is thrown
 */
checkDynamicError(f()) {
  Expect.throws(f, (e) => e is Error, "Dynamic Error should be thrown");
}
