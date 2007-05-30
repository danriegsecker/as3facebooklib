This client now has two examples with different way to track user sessions: cookies and MySQL.
Cookies wasn't really great so I decided to use MySQL to track users sessions.
Of course, if you have a very small program or MySQL isn't available to you, cookies can get the job done.
Also you do not have to use MySQL, I just did it as a demo, feel free to use any database.

For MySQL version do the following:

Modify facebook_conf.php with your API information
Change your MySQL info on BOTH config.php and cron.php
Set your own idle time (the time user is inactive before their session is cleared) on the two files.
Upload all the files except logincookies.php and clientcookies.php
Set crontab on cron.php to run every minute

If you want to use cookies do the following:

Modify facebook_conf.php with your API information and reverse the comments on $config['next']
Upload the following files only:
facebook_conf.php
facebookapi_php4_restlib.php
logincookies.php
clientcookies.php