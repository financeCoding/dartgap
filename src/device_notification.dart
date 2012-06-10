// Copyright (c) 2012 Qalqo, all rights reserved.  
//
// This open source software is governed by the license terms 
// specified in the LICENSE file

/**
 * Visual, audible, and tactile device notifications.
 */
interface DeviceNotification {
  /**
   * Shows a custom alert or dialog box. 
   *
   * Note the future returns when the user closes the box
   */
  Future<Map> alert(String alertMessage);
  
  /**
   * Beep a number of [times]
   */
  beep(int times);
  
  /**
   * Show confirmation dialog.
   *
   * Returns callback with the index of the button clicked (1,2).
   */  
  Future<int> confirm(String dialog, [String title, String labels]);
  
  /**
   * Vibrate for [duration] milliseconds
   */
  vibrate(int duration);
}