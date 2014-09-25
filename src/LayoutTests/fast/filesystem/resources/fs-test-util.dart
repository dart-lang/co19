library fs_test_util;

import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";

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

class RemoveAllInDirectoryHelper {
  var successCallback, errorCallback;
  var entriesCount = 0;
  var done = false;
  var reader = null;

  RemoveAllInDirectoryHelper(this.successCallback, this.errorCallback);

  entryRemovedCallback(entry) {
    if (--entriesCount == 0 && successCallback != null && done) {
      successCallback();
      successCallback = null;
    }
  }
  entriesCallback(entries) {
    for (var i = 0; i < entries.length; ++i) {
      entriesCount++;
      if (entries[i].isDirectory)
        entries[i].removeRecursively().then(entryRemovedCallback, onError: errorCallback);
      else
        entries[i].remove().then(entryRemovedCallback, onError: errorCallback);
    }
    if (entries.length > 0)
      reader.readEntries().then(entriesCallback, onError: errorCallback);
    else if (entriesCount > 0)
      done = true;
    else if (successCallback != null)
      successCallback();
  }
  removeAllInDirectory(directory) {
    reader = directory.createReader();
    reader.readEntries().then(entriesCallback, onError: errorCallback);
  }
}

// Remove everything in the given directory.
removeAllInDirectory(directory, [successCallback, errorCallback]) {
    var helper = new RemoveAllInDirectoryHelper(successCallback, errorCallback);
    helper.removeAllInDirectory(directory);
}
