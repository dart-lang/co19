#library("dynamic_check");

isCheckedMode() {
  try {
    var i = 1;
    String s = i;
    return false;
  } catch(var e) {
    return true;
  }
}

checkTypeError(f()) {
  try {
    f();
    if(isCheckedMode()) {
      Expect.fail("Type error is expected");
    }
  } catch(TypeError ok) {
    if(!isCheckedMode()) {
      Expect.fail("Unexpected type error in scripting mode!");
    }
  }
}