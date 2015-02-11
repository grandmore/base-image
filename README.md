Image `stuartfenton/base`

Basic image with `curl, wget, git-core, vim, htop and supervisor.`

The default CMD /start/supervisord sets the local timezone based on the TZ environment variable and runs supervisord.

Additional services may be added to /etc/supervisor/conf.d/.

Based on image from `hwuethrich/base`

I needed to make custom changes to bamboo and found it easier to start from the ground up. Specifically I needed a later version of ubunto as I need > Python 2.7. and custom builds of mercurial.