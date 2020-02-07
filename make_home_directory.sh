#!/bin/csh -f

set path = (/usr/bin)
set basedir = "/usr/share/skel"

foreach i ($*)
  grep "^${i}:" /etc/passwd > /dev/null
  if ($status) then
    echo "username ${i} is not in use"
  else
    echo "username ${i} is in Use"

    set homedir = `grep "^${i}:" /etc/passwd | awk -F: '{print $6}'`
    set prefix = "/home/vistors/${i}"
    echo "the home directory for user ${i} is ${homedir}"
    set pathanme = "/home/P3/rsirota${homedir}"
    /bin/mkdir -p "$pathanme"
    echo "direectoty created"
    foreach x (${basedir}/*)
      set exten = ${x:e}
      /bin/cp "${x}" "/home/P3/rsirota${prefix}"
      /bin/mv -f "/home/P3/rsirota${prefix}/dot.${exten}" "/home/P3/rsirota${prefix}/.${exten}
    end
  endif
end
