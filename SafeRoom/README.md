Root-kit Proof SafeRoom
===========
What is a root-kit
-----------
A root-kit is a package hackers use to manipulate the machine they’ve hacked to make it more difficult for a systems administrator to detect that the system has been compromised. Root kits commonly also include tools creating back-doors to allow hackers back into a system they’ve hacked. Many different hacker’s websites contain “stock” root kits that can be downloaded. Once a system is hacked, the hacker simply builds and installs the rootkit. The rootkit overwrites several system tools such as find, netstat, ps, and etecetera. The hacked versions of these tools purposely hide the hacker’s activity, so they cannot be detected by a systems administrator. What’s so dangerous about this is that the systems administrator is often given no reason to suspect the system is hacked, and therefore doesn’t make any additional attempts to examine the system.

How can I protect myself?
------------
There are several tools available to detect root-kits. A web search will bring up several different available tools. Another way to protect yourself from a root-kit is by keeping track of the checksums of all your system binaries. This can be done using tools such as ‘tripwire’ or ‘md5sum’. Both packages are available to the general public, and create “fingerprints” of each file, allowing a systems administrator to detect when a file has been changed. This is very useful in both detection of a system compromise and recovering from one later without having to reinstall the system from scratch. The scope of this article, however, is to cover a non-conventional method of protection called a saferoom.

What is a saferoom?
------------
If you’ve ever installed a high-tech security system in your house, the consultant (if he’s any good) will put a set of locks and possibly a reinforced door on one room in the house (commonly a bathroom). If you are broken into, you are supposed to put your family in the saferoom until the proper authorities arrive. The saferoom protects your family from physical harm by denying the burglar access to them.

A saferoom, in security terms, is an impenetrable “room” on your system containing the critical tools necessary for your systems administrators to perform necessary fuctions. Saferooms are commonly placed in front of any other conventional path in the system administrator’s .login or .profile, and are the tools used to carry out day-to-day operations. A saferoom, used effectively, will provide systems administrators with a separate set of tools for detecting compromises, and help insure their ability to perform tracing functions if they do get compromised.

Is a saferoom unbreakable?
------------
That depends on the kind of saferoom you create. If you are successful in creating a saferoom that cannot be written to, even as root, you still have to take into concern the ability of a hacker to go and change your path or dismount the room altogether. The good news is that hackers are not “looking” for saferooms. When a hacker breaks into your system, they realize they have a very limited amount of time to secure their access and therefore many just install an out-of-the-box rootkit. In order for a hacker to disable a saferoom, they first have to know its there, and then the risk of dismounting a saferoom provides enough risk of detection for most hackers to become dumbfounded and make mistakes leading to their detection.

What is entailed in creating a saferoom?
-------------
There are two kinds of saferooms: physical saferooms, logical saferooms. The ideal saferoom consists of a separate disk that is physically write protected by setting a write-protect jumper. Due to cost issues, however, some people choose to simply create a hidden directory on a writable partition (a logical saferoom). Doing this makes it very easy to disable the saferoom, but is still effective as psychologically the average hacker is not going to be looking for a hidden directory. It does have some advantages, also, in that the saferoom will not show up by examining the system’s mountpoints. The hacker will have to search the entire system for system binaries, or find the system adminsitrator accounts on the system and examine their .login or .profile files to be able to detect a hidden-directory saferoom. Assuming they do find it, they still have to worry about detection concerns. If I’m logged in using my saferoom in my path and someone deletes the saferoom, I’ll get “file not found” errors suddenly. There are many other considerations as well. A good system administrator could write a cron job to monitor the saferoom and send an email out if the saferoom changed, or disappeared. All of these different non-conventional system protections will take a hacker by surprise, and significantly increase the risk that they’ll be detected.

If you really want to insure the security of your systems, we recommend two saferooms (one of each type). If a hacker does look for a saferoom and disables one, there’s a very slim chance they’re going to look for a second one. And if they do, the amount of activity it would take to hunt down and terminate two saferooms poses a huge detection risk.

The basic steps to creating a saferoom are:
* Preparing a disk (or directory) to act as a saferoom
* Populating the saferoom with critical binaries
* Adding the saferooms to the SA’s paths, or the default path
* Locking the saferoom

Configuring your saferoom’s disk?
-------------
If you are creating a physical saferoom, you’ll need to find a disk that has a read-only jumper. These are fairly common. Since a saferoom will be particularly small (unless you want to get elaborate), the smaller the disk the better. Once you have located and attached the disk in read/write mode, decide on a mountpoint (try not to be too obvious) and then you’re ready to move onto populating the room. If you are creating a logical saferoom, find a place to create a directory for the room. Many people use a populated directory such as /usr/local/lib/perl5 or /usr/include/sys. Wherever you create it, try not to be too obvious in the filename (e.g. “saferoom” is a bad choice for a filename).

Populating your saferoom
-------------
Once you’ve created your initial saferoom, you’ll want to create a bin directory inside and start copying critical files. Some of the files you’ll want to get are:

* crontab
* du

··· A useful tool used to display information about current network connections, routing tables, and interface statistics. Netstat can be altered by rootkits to hide the connections made by the intruder to and from the system.

* find

··· A useful tool used to display information about current network connections, routing tables, and interface statistics. Netstat can be altered by rootkits to hide the connections made by the intruder to and from the system.

* finger
* ifconfig

··· A useful tool used to display information about current network connections, routing tables, and interface statistics. Netstat can be altered by rootkits to hide the connections made by the intruder to and from the system.

* inetd

··· A super server designed to start programs that provide Internet services. (x)inetd then spawns the appropriate server to accept the connections. Many rootkits add their applications to the configuration file causing rootkit services to be spawned when a specific port is accessed. This is done to hide the process from administrators until the attacker calls it.

* kill
* killall

··· A command used to stop processes. Killall is trojaned in most rootkits so administrators cannot stop certain processes that have been installed by the rootkit.
* login

··· A daemon that is used when signing onto a system. The login daemon can be modified to document all usernames and passwords typed into the system. This documented list can be saved to a directory to be accessed for later use, sent to another system, or displayed on an alternative source such as a chat server or news group.

* ls
* lsof

··· A command that is used to list open files. The lsof command is overwritten to hide any file or process that is open by the rootkit.

* netstat

··· A useful tool used to display information about current network connections, routing tables, and interface statistics. Netstat can be altered by rootkits to hide the connections made by the intruder to and from the system.

* passwd
* pkill
* ps
* xinetd

··· A super server designed to start programs that provide Internet services. (x)inetd then spawns the appropriate server to accept the connections. Many rootkits add their applications to the configuration file causing rootkit services to be spawned when a specific port is accessed. This is done to hide the process from administrators until the attacker calls it.
