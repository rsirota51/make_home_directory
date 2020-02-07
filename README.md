# make_home_directory
The script should take a list of username(s) on the command line.  So
for example it could be run with:

        ./make_home_directory user1 kns foobar

to create the home directories for the three users "user1", "kns", and
"foobar".

The information about the users is expected to be in the passwd file
already. So the script should get the path name of the user's home directory
from the home_dir field of "/etc/passwd" (see the manual page for passwd(5))
and/or the lecture notes about user accounts.

You should use bostic's "/etc/passwd" file to get the information about
the users.  It should provide an error message if the user doesn't exist
(so if I really ran the command above it should give an error message for
"user1" and "foobar" because bostic's "/etc/passwd" file doesn't have entries
for those users).  For usernames that do exist it should create the user's
home directory, but using your Project #3 directory as a "prefix" because
I don't want you interfering with each other.  In other words your script
should get the home directory path out of bostic's "/etc/passwd" but the
directory it creates should have (in my case, adjust for your Project
directory) "/home/P3/kensmith" prepended to the pathname it creates.  Since
you own your directory in /home/P3 the script can run as you and create
the directory just fine without needing to be run as root like it would
need to be if it was creating the actual home directory path.

As an example if "my" script (so it's expected to do things in
/home/P3/kensmith) were to be run as:

        ./make_home_directory kns

it should create the directory "/home/P3/kensmith/home/visitors/kns" since
in bostic's "/etc/passwd" file the home directory for the user kns is
"/home/visitors/kns".  Don't try to set it up so the user owns the
directory, that would only work if the script was run as root.

In addition to creating the user's home directory it should copy in
a set of startup files.  There are seven files in "/usr/share/skel" that
should be copied into the home directory that got created.  All of them
have "dot" at the beginning of their names.  That part should be stripped
off.  So again using the example above of the "kns" user in my case the
file "/usr/share/skel/dot.cshrc" should be copied to
"/home/P3/kensmith/home/visitors/kns/.cshrc".  And similarly for the other
seven startup files provided in /usr/share/skel.

You should set it up so that it is very simple to remove the "prefix".
A simple (lets say one-line) edit of the script should be all it takes
to change it so that instead of creating "/home/P3/kensmith/home/visitors/kns"
it creates "/home/visitors/kns".  And good programming practice as described
in class (indentation, comments, etc) should be followed.  And your script
should not require the "parent" directory exist, it should create as much
of the directory tree as possible.  So for example the very first time
I run my script "/home/P3/kensmith/home" will not exist.  Your script should
still work in that case.  It can assume the "prefix" exists (so my script
could assume that "/home/P3/kensmith" exists).
