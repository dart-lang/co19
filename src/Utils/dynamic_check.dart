#library("dynamic_check");

_isCheckedMode() {
  try {
    String i = true;
    return false;
  } catch(var e) {
    return true;
  }
}

checkTypeError(f()) {
  try {
    f();
    if(_isCheckedMode()) {
      Expect.fail("Type error is expected");
    }
  } catch(TypeError ok) {
    if(!_isCheckedMode()) {
      Expect.fail("Unexpected type error in scripting mode!");
    }
  }
}