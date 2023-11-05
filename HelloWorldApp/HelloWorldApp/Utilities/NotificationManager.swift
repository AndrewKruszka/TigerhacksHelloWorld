//
//  NotificationManager.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/5/23.
//

import Foundation
import UserNotifications

final class NotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate
{
    func requestPushNotificationAuthorization() async {
        do {
            try await UNUserNotificationCenter.current().requestAuthorization(options: [
                .alert,
                .sound,
                .badge,
                .carPlay,
                .provisional,
                .criticalAlert,
                .providesAppNotificationSettings]) //
            
        } catch {
            print(error)
        }
    }
    
    func sendNotification(message: String)
    {                        
        let content = UNMutableNotificationContent()
        content.title = message
        content.subtitle = "Subtitle"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(integerLiteral: 0), repeats: false)
        
        let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
