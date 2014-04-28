#
#  Be sure to run `pod spec lint NexTripService.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "NexTripService"
  s.version      = "0.0.1"
  s.summary      = "NexTripService is an Objective-C wrapper for the NexTrip API."

  s.description  = <<-DESC
                   The NexTrip API delivers realtime transit information for the MetroTransit system in Minneapolis/St Paul, Minnesota.
                   More information on the NexTrip API can be found [here](http://svc.metrotransit.org).
                   DESC

  s.homepage     = "https://github.com/shickey/NexTripService"
  s.license      = "MIT"
  s.author             = { "Sean Hickey" => "shickey.dev@gmail.com" }
  s.social_media_url   = "http://twitter.com/seanhic"
  s.ios.deployment_target = "6.0"
  s.osx.deployment_target = "10.8"
  s.source       = { :git => "https://github.com/shickey/NexTripService.git", :tag => "0.0.1" }
  s.source_files  = "NexTripService", "NexTripService/**/*.{h,m}"
  s.requires_arc = true
  s.dependency "AFNetworking", "~> 2.0"
end
