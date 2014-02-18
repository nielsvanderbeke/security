== Problem ==
Your MAC address can be tracked regardless of whether or not you actually connect to a WiFi network, as your laptop is almost always scanning for nearby WiFi access points.

== Solution ==
Below is a simple bash script that runs on OSX (and can be easily adapted to other OS’s) that will randomize your MAC address every 30 seconds, and help prevent MAC-based tracking such as what the NSA and friends are testing out. It only does this if you’re not currently connected to a WiFi access point, otherwise your connection would get reset. Copy this somewhere and run it as root when you log in.

== Run on boot ==
You can have this script automatically run at system boot by creating a simple launch script at /Library/LaunchDaemons/com.zdziarski.macrandomize.plist. This will run it in the background, and will also randomize your MAC every time you boot your computer.