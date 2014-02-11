#Opens multiple rdp sessions via commandline. Requires rdesktop be installed.

#!/bin/bash
rd='/usr/local/bin/rdesktop -d **** -u **** -p **** -g 1280x720 -a 16 -r clipboard:CLIPBOARD -r sound:local'

servers=( **** **** )

for i in "${servers[@]}"

do
	$rd $i &	
done
