// Copyright (c) 2012 Qalqo, all rights reserved.  
//
// This open source software is governed by the license terms 
// specified in the LICENSE file

class _SQLBatchResultImpl implements SQLBatchResult {
  _SQLBatchResultImpl(_DeviceMessage message) {
    results = new List<SQLResult>();
    message.content.forEach((var data) {
      results.add(new _SQLResultImpl(data["query"], data["result"]));
    });
  }
  
  SQLResult operator[](int index) => results[index];
  
  forEach(f(SQLResult result)) => results.forEach(f);
  
  String toString() => results.toString();
  
  List<SQLResult> results;
}
