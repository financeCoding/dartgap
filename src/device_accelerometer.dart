// Copyright (c) 2012 Qalqo, all rights reserved.  
//
// This open source software is governed by the license terms 
// specified in the LICENSE file

/**
 * Device accelerometer 
 */
interface DeviceAccelerometer {
  /**
   * Get current acceleration
   */
  Future<Map> get currentAcceleration();
}
