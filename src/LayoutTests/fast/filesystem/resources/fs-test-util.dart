library fs_test_util;

import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";

_defaultSuccessCallback(_) {}
_defaultErrorCallback(e) {
  testFailed("${e.name}");
  asyncEnd();
}

class JoinHelper {
  var count = 0;
  var joinCallback;
  run(func) {
    ++count;
    func();
  }
  done([_]) {
    if (--count == 0)
      joinCallback();
  }
  join(func) { joinCallback = func; }
}

removeAllInDirectory(dir, [sucessCallback=_defaultSuccessCallback,
                           errorCallback=_defaultErrorCallback]) {
  //dir.removeRecursively().then(sucessCallback, onError: errorCallback);
}

