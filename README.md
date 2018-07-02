# wort-archives
Archive scripts for WORT-FM.  Original scripts by Nathan McQuillen

`archive_record`: runs every 15 minutes (on 0) and records 15 minute sections to /mnt/aircheck/15 Minute Slices.

`bootstrap_autoarchive`: runs every 15 minutes (on 0) to start the autoarchive process if it isn't running already.

`archive_rsync`: runs every 15 minutes (on 1) to copy new files created by bootstrap_autoarchive out to stream.wortfm.org

`autoarchive`: run by bootstrap_autoarchive.  Records programs to files.  Uses `at` to start itself again while still running to catch overlap at the end of the programs.

`crontab`: Cron jobs as found on 6/18

`showdb.txt`: Database of Spinitron show IDs to old names

`spinitron_scripts`: Spinitron scripts used by other scripts

`2018-06-18 Analysis.md`: Jon's analysis from 6/18/2018.

Example file names (All Around Jazz, 7/2/2018):

`/mnt/aircheck/15 Minute Slices`:
```-rw-rw-r-- 1 www-data www-data 36002330 Jul  2 14:15 2018-07-02 1400 - 1415 - All Around Jazz - 111-1 - wort_180702_140001aaj.mp3
-rw-rw-r-- 1 www-data www-data 36002330 Jul  2 14:30 2018-07-02 1415 - 1430 - All Around Jazz - 111-1 - wort_180702_141501aaj.mp3
-rw-rw-r-- 1 www-data www-data 36002330 Jul  2 14:44 2018-07-02 1430 - 1445 - All Around Jazz - 111-1 - wort_180702_143001aaj.mp3
-rw-rw-r-- 1 www-data www-data 36002330 Jul  2 15:00 2018-07-02 1445 - 1500 - All Around Jazz - 111-1 - wort_180702_144503aaj.mp3
-rw-rw-r-- 1 www-data www-data 36002330 Jul  2 15:15 2018-07-02 1500 - 1515 - All Around Jazz - 111-1 - wort_180702_150003aaj.mp3
-rw-rw-r-- 1 www-data www-data 36002330 Jul  2 15:30 2018-07-02 1515 - 1530 - All Around Jazz - 111-1 - wort_180702_151502aaj.mp3
-rw-rw-r-- 1 www-data www-data 36002330 Jul  2 15:45 2018-07-02 1530 - 1545 - All Around Jazz - 111-1 - wort_180702_153002aaj.mp3
-rw-rw-r-- 1 www-data www-data 36002330 Jul  2 16:00 2018-07-02 1545 - 1600 - All Around Jazz - 111-1 - wort_180702_154502aaj.mp3
-rw-rw-r-- 1 www-data www-data  7201139 Jul  2 16:04 2018-07-02 1600 - 1615 - All Around Jazz - 111-1 - wort_180702_160003aaj.mp3
-rw-rw-r-- 1 www-data www-data 36002330 Jul  2 16:30 2018-07-02 1615 - 1630 - All Around Jazz - 111-1 - wort_180702_161502aaj.mp3
-rw-rw-r-- 1 www-data www-data 36002330 Jul  2 16:45 2018-07-02 1630 - 1645 - All Around Jazz - 111-1 - wort_180702_163002aaj.mp3
-rw-rw-r-- 1 www-data www-data 36002330 Jul  2 17:00 2018-07-02 1645 - 1700 - All Around Jazz - 111-1 - wort_180702_164502aaj.mp3
```

`/mnt/aircheck/Complete Shows`
```-rw-rw-r-- 1 www-data www-data 436801828 Jul  2 17:02 FULL - 2018-07-02 1400 - 1702 - All Around Jazz - 111-1 - wort_180702_140002aaj.mp3
```

`/mnt/aircheck/Old Archive Format`
```-rw-rw-r-- 1 www-data www-data 262081097 Jul  2 17:09 wort_180702_140002aaj.mp3
```
