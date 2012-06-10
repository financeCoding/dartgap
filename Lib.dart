// Copyright (c) 2012 Qalqo, all rights reserved.  
//
// This open source software is governed by the license terms 
// specified in the LICENSE file

#library("qalqo:dartgap");

#import("dart:html");
#import("dart:json");

#import("../log/Lib.dart");

#source("src/dartgap.dart");
#source("src/device.dart");
#source("src/device_accelerometer.dart");
#source("src/device_database.dart");
#source("src/device_info.dart");
#source("src/device_notification.dart");
#source("src/device_screen.dart");
#source("src/sql_batch.dart");
#source("src/sql_batch_result.dart");
#source("src/sql_result.dart");

#source("src/impl/dartgap_impl.dart");
#source("src/impl/device_accelerometer_impl.dart");
#source("src/impl/device_aware.dart");
#source("src/impl/device_database_impl.dart");
#source("src/impl/device_impl.dart");
#source("src/impl/device_info_impl.dart");
#source("src/impl/device_message.dart");
#source("src/impl/device_message_aware.dart");
#source("src/impl/device_message_router.dart");
#source("src/impl/device_notification_impl.dart");
#source("src/impl/device_screen_impl.dart");
#source("src/impl/guid.dart");
#source("src/impl/sql_batch_impl.dart");
#source("src/impl/sql_batch_result_impl.dart");
#source("src/impl/sql_result_impl.dart");

DartGap get dartgap() => new _DartGapImpl();

