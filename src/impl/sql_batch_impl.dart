// Copyright (c) 2012 Qalqo, all rights reserved.  
//
// This open source software is governed by the license terms 
// specified in the LICENSE file

class _SQLBatchImpl implements SQLBatch {
  _SQLBatchImpl(this._executor): _queries = new List<String>();
  
  SQLBatch batchSql(String sql) {
    _queries.add(sql);
    return this;
  }
  
  Future<SQLBatchResult> executeBatch() => _executor(_queries);
  
  final List<String> _queries;
  final BatchExecutor _executor;
}

typedef Future<SQLBatchResult> BatchExecutor(List<String> queries);